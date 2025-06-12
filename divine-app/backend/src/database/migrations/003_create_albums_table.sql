-- 003_create_albums_table.sql

CREATE TABLE IF NOT EXISTS Albums (
    album_id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    artist_id UUID NOT NULL,
    title VARCHAR(255) NOT NULL,
    release_date DATE,
    artwork_url VARCHAR(255),
    genre VARCHAR(100),
    created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
    updated_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
    CONSTRAINT fk_artist
        FOREIGN KEY(artist_id)
        REFERENCES Artists(artist_id)
        ON DELETE CASCADE -- If an artist is deleted, their albums are also deleted.
);

CREATE INDEX IF NOT EXISTS idx_albums_title ON Albums(title);
CREATE INDEX IF NOT EXISTS idx_albums_artist_id ON Albums(artist_id);
CREATE INDEX IF NOT EXISTS idx_albums_genre ON Albums(genre); -- Added index for genre

-- Trigger for updated_at
CREATE TRIGGER trigger_albums_updated_at
BEFORE UPDATE ON Albums
FOR EACH ROW
EXECUTE FUNCTION update_updated_at_column();
