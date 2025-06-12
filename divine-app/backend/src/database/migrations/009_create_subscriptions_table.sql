-- 009_create_subscriptions_table.sql

CREATE TABLE IF NOT EXISTS Subscriptions (
    subscription_id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    user_id UUID NOT NULL,
    plan_type VARCHAR(50) NOT NULL CHECK (plan_type IN ('free', 'premium_monthly', 'premium_yearly')),
    status VARCHAR(50) NOT NULL CHECK (status IN ('active', 'cancelled', 'expired', 'pending_payment', 'trial')),
    start_date TIMESTAMP WITH TIME ZONE,
    end_date TIMESTAMP WITH TIME ZONE,
    stripe_subscription_id VARCHAR(255) UNIQUE, -- Store Stripe's subscription ID for webhook and management
    created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
    updated_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
    CONSTRAINT fk_user
        FOREIGN KEY(user_id)
        REFERENCES Users(user_id)
        ON DELETE CASCADE -- If a user is deleted, their subscription records are also deleted.
);

CREATE INDEX IF NOT EXISTS idx_subscriptions_user_id ON Subscriptions(user_id);
CREATE INDEX IF NOT EXISTS idx_subscriptions_plan_type ON Subscriptions(plan_type);
CREATE INDEX IF NOT EXISTS idx_subscriptions_status ON Subscriptions(status);
CREATE INDEX IF NOT EXISTS idx_subscriptions_stripe_id ON Subscriptions(stripe_subscription_id);

-- Trigger for updated_at
CREATE TRIGGER trigger_subscriptions_updated_at
BEFORE UPDATE ON Subscriptions
FOR EACH ROW
EXECUTE FUNCTION update_updated_at_column();
