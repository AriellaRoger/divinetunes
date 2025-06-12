-- 011_create_devotionals_table.sql

CREATE TABLE IF NOT EXISTS Devotionals (
    devotional_id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    title VARCHAR(255) NOT NULL,
    content TEXT NOT NULL,
    author VARCHAR(255), -- Could be a user_id if authors must be users, or just a string
    publication_date DATE,
    scripture_references TEXT, -- Could be a JSONB for structured references
    category VARCHAR(100), -- Added category for better organization
    created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
    updated_at TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);

CREATE INDEX IF NOT EXISTS idx_devotionals_title ON Devotionals(title);
CREATE INDEX IF NOT EXISTS idx_devotionals_author ON Devotionals(author);
CREATE INDEX IF NOT EXISTS idx_devotionals_publication_date ON Devotionals(publication_date);
CREATE INDEX IF NOT EXISTS idx_devotionals_category ON Devotionals(category);

-- Trigger for updated_at
CREATE TRIGGER trigger_devotionals_updated_at
BEFORE UPDATE ON Devotionals
FOR EACH ROW
EXECUTE FUNCTION update_updated_at_column();
