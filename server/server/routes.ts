import type { Express } from "express";
import { createServer, type Server } from "http";
import { storage } from "./storage";
import { searchRequestSchema, bulkImportSchema } from "@shared/schema";
export async function registerRoutes(app: Express): Promise<Server> {
  console.log("🚀 Registering ConnectHappyValley API routes...");
  
  // Test database connection immediately
  try {
    const testActivities = await storage.getActivities();
    console.log(`✅ Database connection verified - ${testActivities.length} activities found`);
  } catch (error: any) {
    console.error("❌ Database connection failed:", error.message);
    console.error("Environment check:", {
      DATABASE_URL: process.env.DATABASE_URL ? "Present" : "Missing",
      NODE_ENV: process.env.NODE_ENV
    });
  }
  // Search endpoint - main search functionality
  app.get("/api/search", async (req, res) => {
    try {
      const query = req.query.q as string;
      console.log(`GET search for: "${query}" (redirecting to proper database search)`);
      
      if (!query) {
        return res.status(400).json({
          success: false,
          error: "Search query is required"
        });
      }
      // Search database for activities
      const searchTerms = query.toLowerCase().split(' ').filter(term => term.length > 0);
      console.log("Search terms:", searchTerms);
      
      const activities = await storage.searchActivities(query, undefined, 8);
      console.log(`PostgreSQL search for "${query}" found ${activities.length} total, showing top 8`);
      
      if (activities.length > 0) {
        const topResults = activities.slice(0, 3).map(a => a.title).join(', ');
        console.log(`Top results: ${topResults}`);
      }
      
      // Count activities with URLs
      const activitiesWithUrls = activities.filter(activity => activity.websiteUrl);
      console.log(`Database search found ${activitiesWithUrls.length} venues with URLs`);
      // Transform activities for response
      const venues = activities.map(activity => ({
        title: activity.title,
        description: activity.description,
        location: activity.location,
        priceRange: activity.priceRange || 'Contact for pricing',
        rating: parseFloat(activity.rating.toString()),
        tags: Array.isArray(activity.tags) ? activity.tags : [],
        story: activity.story,
        url: activity.websiteUrl || null
      }));
      res.json({
        success: true,
        activities: venues,
        query,
        totalResults: activities.length,
        source: "database"
      });
    } catch (error) {
      console.error("Search error:", error);
      res.status(500).json({
        success: false,
        error: "Search failed"
      });
    }
  });
  // Activities endpoint
  app.get("/api/activities", async (req, res) => {
    try {
      const limit = parseInt(req.query.limit as string) || 24;
      const offset = parseInt(req.query.offset as string) || 0;
      const category = req.query.category as string;
      const activities = await storage.getActivities(limit, offset, category);
      res.json({
        success: true,
        activities,
        pagination: {
          limit,
          offset,
          total: activities.length
        }
      });
    } catch (error) {
      console.error("Activities fetch error:", error);
      res.status(500).json({
        success: false,
        error: "Failed to fetch activities"
      });
    }
  });
  // Articles endpoint
  app.get("/api/articles", async (req, res) => {
    try {
      const limit = parseInt(req.query.limit as string) || 20;
      const offset = parseInt(req.query.offset as string) || 0;
      const category = req.query.category as string;
      const articles = await storage.getArticles(limit, offset, category);
      res.json({
        success: true,
        articles,
        pagination: {
          limit,
          offset,
          total: articles.length
        }
      });
    } catch (error) {
      console.error("Articles fetch error:", error);
      res.status(500).json({
        success: false,
        error: "Failed to fetch articles"
      });
    }
  });
  return createServer(app);
