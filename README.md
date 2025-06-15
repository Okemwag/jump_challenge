# Jump Challenge App

The Jump Challenge App is an AI-powered agent for Financial Advisors, built with Elixir and Phoenix LiveView. It integrates with Gmail, Google Calendar, and HubSpot to provide a chat interface for querying client data, automating tasks, and performing proactive actions based on user instructions. The app uses Retrieval-Augmented Generation (RAG) with pgvector for semantic search and Bumblebee for embeddings, leveraging Elixir's concurrency model for scalability and fault tolerance.

This project was developed as part of the Jump Challenge (June 2025), demonstrating mastery of Elixir, Phoenix LiveView, and concurrency patterns.

## Features

### Google OAuth Authentication
- Login with Google, requesting Gmail (read/write) and Calendar (read/write) permissions
- Test user: `webshookeng@gmail.com`

### HubSpot Integration
- Connect HubSpot CRM via OAuth to access contacts and notes

### Chat Interface
- Phoenix LiveView-based, ChatGPT-like UI for:
  - Querying client data (e.g., "Who mentioned baseball?") using RAG with Gmail and HubSpot data
  - Automating tasks (e.g., "Schedule an appointment with Sara Smith") with tool-like functionality
  - Setting ongoing instructions (e.g., "Auto-create HubSpot contacts for new emails")
- Handles ambiguous names (e.g., "Greg") by prompting for clarification

### RAG Pipeline
- Ingests Gmail emails and HubSpot contacts/notes
- Uses Bumblebee for text embeddings and pgvector for vector storage

### Task Automation
- Manages long-running tasks (e.g., email follow-ups) with Oban background jobs
- Stores tasks in PostgreSQL for persistence

### Proactive Actions
- Processes Gmail and HubSpot webhooks (or polls as fallback) to trigger actions based on instructions
- Example: Auto-send thank-you emails for new HubSpot contacts

### Concurrency
- Uses GenServer for per-user agent logic, Task.Supervisor for async API calls, Agent for instruction storage, and PubSub for real-time chat updates

### Deployment
- Deployed to Fly.io with PostgreSQL and Redis add-ons

## Tech Stack

- **Backend**: Elixir 1.17, Phoenix 1.7
- **Frontend**: Phoenix LiveView, Tailwind CSS, Flowbite
- **Database**: PostgreSQL with pgvector
- **AI**: Bumblebee (embeddings), lightweight LLM logic
- **Integrations**:
  - Google APIs: ueberauth, google_api_gmail, google_api_calendar
  - HubSpot API: Tesla
- **Task Queue**: Oban with Redis
- **Concurrency**: GenServer, Task, Supervisor, Agent, Phoenix.PubSub
- **Deployment**: Fly.io

## Project Structure

```
jump_challenge/
├── lib/
│   ├── jump_challenge/
│   │   ├── accounts/           # User authentication (User schema)
│   │   ├── integrations/       # Gmail, Calendar, HubSpot
│   │   ├── agent/              # AI logic (RAG, tasks)
│   │   ├── tasks/              # Task management
│   │   ├── instructions/       # Ongoing instructions
│   │   └── web/                # LiveView, controllers
│   ├── jump_challenge_web/
│   │   ├── live/               # LiveView components (ChatLive)
│   │   ├── templates/          # Static templates
│   │   └── views/              # View logic
├── priv/
│   ├── repo/                   # Ecto migrations
│   └── static/                 # Assets
├── config/                     # Configuration
├── test/                       # ExUnit tests
├── fly.toml                    # Fly.io deployment
└── mix.exs                     # Dependencies
```

## Prerequisites

- Elixir 1.17
- Erlang/OTP 27
- PostgreSQL 15+ with pgvector extension
- Redis
- Node.js (for assets)
- Google Cloud Console account (for OAuth credentials)
- HubSpot Developer account (for OAuth credentials)

## Setup Instructions

### 1. Clone the Repository

```bash
git clone https://github.com/your-username/jump-challenge-app.git
cd jump_challenge
```

### 2. Install Dependencies

```bash
mix deps.get
npm install --prefix assets
```

### 3. Configure Environment Variables

Create a `.env` file or set environment variables:

```bash
export GOOGLE_CLIENT_ID=your-google-client-id
export GOOGLE_CLIENT_SECRET=your-google-client-secret
export HUBSPOT_CLIENT_ID=your-hubspot-client-id
export HUBSPOT_CLIENT_SECRET=your-hubspot-client-secret
export DATABASE_URL=ecto://user:pass@localhost/jump_challenge_dev
export REDIS_URL=redis://localhost:6379
export PHX_HOST=localhost
```

### 4. Setup Database

```bash
mix ecto.setup
```

### 5. Build Assets

```bash
mix assets.setup
mix assets.build
```

### 6. Run the Application

```bash
mix phx.server
```

Access at http://localhost:4000/chat.

## Testing

Run ExUnit tests:

```bash
mix test
```

Key test cases:
- Google OAuth login with `webshookeng@gmail.com`
- HubSpot OAuth and contact ingestion
- RAG queries (e.g., "Who mentioned baseball?")
- Task automation (e.g., scheduling appointments)
- Proactive actions (e.g., auto-creating HubSpot contacts)

## Deployment to Fly.io

### 1. Initialize Fly.io App

```bash
flyctl launch
```

### 2. Set Secrets

```bash
flyctl secrets set GOOGLE_CLIENT_ID=... GOOGLE_CLIENT_SECRET=... HUBSPOT_CLIENT_ID=... HUBSPOT_CLIENT_SECRET=...
```

### 3. Setup Add-ons

```bash
flyctl postgres create
flyctl redis create
```

### 4. Deploy

```bash
flyctl deploy
```

### 5. Access

- **App URL**: https://jump-challenge-app.fly.dev (update with actual URL)
- **GitHub Repo**: https://github.com/your-username/jump-challenge-app (update with actual repo)

## Usage

### Login
1. Click "Login with Google" and authenticate with `webshookeng@gmail.com`
2. Connect HubSpot via "Connect HubSpot"

### Chat Interface
- **Query clients**: e.g., "Why did Greg sell AAPL?" (handles ambiguous names)
- **Request tasks**: e.g., "Schedule an appointment with Sara Smith"
- **Set instructions**: e.g., "When I create a HubSpot contact, send a thank-you email"

### Proactive Actions
- The app processes Gmail/HubSpot webhooks to act on instructions (e.g., auto-create contacts)

## Concurrency Patterns

- **GenServer**: Per-user agent logic for chat and task handling
- **Task.Supervisor**: Async API calls (e.g., sending emails)
- **Oban**: Background jobs for long-running tasks and webhooks
- **Agent**: Stores ongoing instructions
- **PubSub**: Real-time chat updates in LiveView
- **DynamicSupervisor**: Supervises per-user GenServers

## Notes

- **AI Implementation**: Uses Bumblebee for embeddings and a lightweight LLM-like logic for intent classification due to the absence of a full LLM in Elixir
- **Limitations**: The LLM logic is simplified (regex-based intent detection) but extensible with advanced models if needed
- **Development**: Built solo using AI tools (Claude, GitHub Copilot) as per challenge rules

## Contributing

Contributions are welcome! Please submit issues or pull requests to the GitHub repository.

## License

MIT License