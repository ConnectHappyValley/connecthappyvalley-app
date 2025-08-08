# ConnectHappyValley - Local Discovery Platform
A comprehensive search application for discovering local activities in Happy Valley (State College, PA) with AI-powered recommendations and multi-source data integration.
## Features
- **245+ Local Venues**: Restaurants, attractions, outdoor activities, music venues
- **Multi-Source Search**: Database + Google Custom Search + OpenAI AI
- **Real-time Results**: Fast search with clickable URLs
- **Category Browsing**: Restaurants, attractions, outdoor, music, events, Penn State
- **Mobile Responsive**: Works on all devices
## Technology Stack
- **Frontend**: HTML5, CSS3, Vanilla JavaScript
- **Backend**: Node.js, Express.js, TypeScript
- **Database**: PostgreSQL with Drizzle ORM
- **AI Integration**: OpenAI API for intelligent search
- **Deployment**: Vercel with serverless functions
## Quick Start
1. **Clone the repository**
   ```bash
   git clone https://github.com/yourusername/connecthappyvalley-app.git
   cd connecthappyvalley-app
Install dependencies

npm install
Set up environment variables

cp .env.example .env
# Add your DATABASE_URL, OPENAI_API_KEY, GOOGLE_API_KEY, GOOGLE_CSE_ID
Run development server

npm run dev
Visit http://localhost:5000

Environment Variables
DATABASE_URL=your_postgresql_connection_string
OPENAI_API_KEY=your_openai_api_key
GOOGLE_API_KEY=your_google_api_key
GOOGLE_CSE_ID=your_custom_search_engine_id
NODE_ENV=development
API Endpoints
GET /api/search?q=query - Search all venues
GET /api/activities?category=restaurants - Get activities by category
GET /api/articles - Get local articles and stories
POST /api/import/bulk - Bulk import data (admin)
Database Schema
Activities: Local venues with ratings, URLs, categories
Articles: Happy Valley stories and content
Search Queries: Analytics and search history
FAQs: Frequently asked questions
Deployment
Vercel Deployment
Connect GitHub repository to Vercel
Add environment variables in Vercel dashboard
Deploy automatically on git push
Manual Deployment
npm run build
npm start
Contributing
Fork the repository
Create feature branch (git checkout -b feature/amazing-feature)
Commit changes (git commit -m 'Add amazing feature')
Push to branch (git push origin feature/amazing-feature)
Open Pull Request
License
Private project for ConnectHappyValley.

Support
For questions or support, contact: [your-email@domain.com]

ConnectHappyValley - Together We ARE Better!
