-- 007_create_testimonies_table.sql

CREATE TABLE IF NOT EXISTS Testimonies (
    testimony_id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    user_id UUID NOT NULL,
    title VARCHAR(255) NOT NULL,
    content TEXT NOT NULL,
    is_anonymous BOOLEAN DEFAULT FALSE,
    status VARCHAR(50) DEFAULT 'pending' CHECK (status IN ('pending', 'approved', 'rejected')),
    created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
    updated_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
    CONSTRAINT fk_user
        FOREIGN KEY(user_id)
        REFERENCES Users(user_id)
        ON DELETE CASCADE -- If a user is deleted, their testimonies are also deleted.
);

CREATE INDEX IF NOT EXISTS idx_testimonies_user_id ON Testimonies(user_id);
CREATE INDEX IF NOT EXISTS idx_testimonies_status ON Testimonies(status);

-- Trigger for updated_at
CREATE TRIGGER trigger_testimonies_updated_at
BEFORE UPDATE ON Testimonies
FOR EACH ROW
EXECUTE FUNCTION update_updated_at_column();
