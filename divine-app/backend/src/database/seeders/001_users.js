// divine-app/backend/src/database/seeders/001_users.js
const { v4: uuidv4 } = require('uuid'); // Assuming UUIDs are used for IDs

// IMPORTANT: In a real application, passwords MUST be hashed.
// For seeding purposes, we are showing plaintext here but this is NOT secure for actual use.
// You would typically use a library like bcrypt to hash passwords before insertion.
// e.g., const hashedPassword = await bcrypt.hash('password123', 10);
// For the purpose of this seed, we'll use placeholder strings for password_hash.

exports.seed = async function(knex) {
  // Deletes ALL existing entries in reverse order of creation due to FK constraints
  // These .del() calls assume that the tables exist. If running seeds on a fresh DB
  // without migrations first, this will fail. Migrations should always be run before seeds.
  await knex('UserActivity').del();
  await knex('PlaylistSongs').del();
  await knex('LiveStreams').del(); // Depends on Artists
  await knex('Songs').del(); // Depends on Albums, Artists
  await knex('Albums').del(); // Depends on Artists
  await knex('Artists').del(); // Depends on Users
  await knex('Subscriptions').del(); // Depends on Users
  await knex('Testimonies').del(); // Depends on Users
  await knex('PrayerRequests').del(); // Depends on Users
  await knex('Playlists').del(); // Depends on Users
  await knex('Users').del(); // Base table

  // Inserts seed entries
  const users = [
    {
      user_id: uuidv4(),
      email: 'admin@divinetunes.app',
      phone_number: '1000000000',
      password_hash: 'admin_password_hash_placeholder', // Replace with actual hash in real app
      first_name: 'Admin',
      last_name: 'User',
      role: 'admin',
      email_verified: true,
      phone_verified: true,
      created_at: new Date(),
      updated_at: new Date(),
    },
    {
      user_id: uuidv4(),
      email: 'artist1@divinetunes.app',
      phone_number: '1000000001',
      password_hash: 'artist1_password_hash_placeholder', // Replace with actual hash
      first_name: 'Artist',
      last_name: 'One',
      role: 'artist',
      email_verified: true,
      phone_verified: true,
      created_at: new Date(),
      updated_at: new Date(),
    },
    {
      user_id: uuidv4(),
      email: 'artist2@divinetunes.app',
      phone_number: '1000000002',
      password_hash: 'artist2_password_hash_placeholder', // Replace with actual hash
      first_name: 'Creative',
      last_name: 'Soul',
      role: 'artist',
      email_verified: true,
      phone_verified: false,
      created_at: new Date(),
      updated_at: new Date(),
    },
    {
      user_id: uuidv4(),
      email: 'user1@divinetunes.app',
      phone_number: '1000000003',
      password_hash: 'user1_password_hash_placeholder', // Replace with actual hash
      first_name: 'Listener',
      last_name: 'Faithful',
      role: 'user',
      email_verified: true,
      phone_verified: false,
      created_at: new Date(),
      updated_at: new Date(),
    }
  ];
  await knex('Users').insert(users);
};
