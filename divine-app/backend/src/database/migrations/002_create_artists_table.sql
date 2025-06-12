-- 002_create_artists_table.sql

CREATE TABLE IF NOT EXISTS Artists (
    artist_id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    user_id UUID UNIQUE NOT NULL,
    artist_name VARCHAR(255) NOT NULL,
    bio TEXT,
    profile_image_url VARCHAR(255),
    banner_image_url VARCHAR(255),
    verified BOOLEAN DEFAULT FALSE,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
    updated_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
    CONSTRAINT fk_user
        FOREIGN KEY(user_id)
        REFERENCES Users(user_id)
        ON DELETE CASCADE -- If a user is deleted, their artist profile is also deleted.
);

CREATE INDEX IF NOT EXISTS idx_artists_artist_name ON Artists(artist_name);
CREATE INDEX IF NOT EXISTS idx_artists_user_id ON Artists(user_id); -- Index on FK for performance

-- Trigger for updated_at
CREATE TRIGGER trigger_artists_updated_at
BEFORE UPDATE ON Artists
FOR EACH ROW
EXECUTE FUNCTION update_updated_at_column();
