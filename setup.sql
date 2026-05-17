-- Run this SQL in your Supabase SQL Editor (https://supabase.com -> SQL Editor)

-- 1. Create the expenses table
CREATE TABLE expenses (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  name TEXT NOT NULL,
  amount NUMERIC NOT NULL,
  payer TEXT NOT NULL,
  assigned TEXT NOT NULL,
  category TEXT DEFAULT 'General',
  date DATE DEFAULT CURRENT_DATE,
  created_at TIMESTAMPTZ DEFAULT now()
);

-- 2. Enable Row Level Security
ALTER TABLE expenses ENABLE ROW LEVEL SECURITY;

-- 3. Allow public access (no login required since password is in-app)
CREATE POLICY "Allow all" ON expenses
  FOR ALL
  USING (true)
  WITH CHECK (true);
