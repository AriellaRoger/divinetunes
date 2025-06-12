-- 008_create_prayer_requests_table.sql

CREATE TABLE IF NOT EXISTS PrayerRequests (
    prayer_request_id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    user_id UUID, -- Nullable for anonymous requests
    title VARCHAR(255) NOT NULL,
    content TEXT NOT NULL,
    is_anonymous BOOLEAN DEFAULT TRUE,
    category VARCHAR(100),
    status VARCHAR(50) DEFAULT 'pending' CHECK (status IN ('pending', 'active', 'closed', 'answered')),
    created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
    updated_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
    CONSTRAINT fk_user
        FOREIGN KEY(user_id)
        REFERENCES Users(user_id)
        ON DELETE SET NULL -- If a user is deleted, their prayer requests can become anonymous or be handled differently.
                           -- SET NULL keeps the request but removes direct user link.
);

CREATE INDEX IF NOT EXISTS idx_prayer_requests_user_id ON PrayerRequests(user_id);
CREATE INDEX IF NOT EXISTS idx_prayer_requests_category ON PrayerRequests(category);
CREATE INDEX IF NOT EXISTS idx_prayer_requests_status ON PrayerRequests(status);

-- Trigger for updated_at
CREATE TRIGGER trigger_prayer_requests_updated_at
BEFORE UPDATE ON PrayerRequests
FOR EACH ROW
EXECUTE FUNCTION update_updated_at_column();
