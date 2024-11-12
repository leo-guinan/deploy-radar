-- Create tables if they don't exist
CREATE TABLE IF NOT EXISTS conversations (
  id UUID PRIMARY KEY,
  url TEXT NOT NULL,
  media_type TEXT NOT NULL,
  user_insight TEXT NOT NULL,
  ai_analysis TEXT,
  world_model JSONB,
  created_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE IF NOT EXISTS messages (
  id UUID PRIMARY KEY,
  conversation_id UUID REFERENCES conversations(id),
  role TEXT NOT NULL,
  content TEXT NOT NULL,
  timestamp TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE IF NOT EXISTS webhooks (
  id UUID PRIMARY KEY,
  url TEXT NOT NULL,
  secret TEXT NOT NULL,
  events TEXT[] NOT NULL,
  created_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP
); 