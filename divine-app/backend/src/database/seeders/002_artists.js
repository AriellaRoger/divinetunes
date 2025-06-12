// divine-app/backend/src/database/seeders/002_artists.js
const { v4: uuidv4 } = require('uuid');

exports.seed = async function(knex) {
  // It's assumed that 001_users.js (or a master seeder) handles deleting Artists entries
  // if a full refresh is needed, to avoid FK issues with Users table.
  // If running this seed standalone for some reason, you might uncomment:
  // await knex('Artists').del();

  const artistUser1 = await knex('Users').where({ email: 'artist1@divinetunes.app' }).first();
  const artistUser2 = await knex('Users').where({ email: 'artist2@divinetunes.app' }).first();

  const artistsToSeed = [];

  if (artistUser1) {
    artistsToSeed.push({
      artist_id: uuidv4(),
      user_id: artistUser1.user_id,
      artist_name: 'Divine Worship Collective',
      bio: 'A collective of worship leaders bringing fresh sounds to praise. Led by Artist One.',
      profile_image_url: 'https://picsum.photos/seed/dwc_profile/200/200', // Placeholder image
      banner_image_url: 'https://picsum.photos/seed/dwc_banner/800/200', // Placeholder image
      verified: true,
      created_at: new Date(),
      updated_at: new Date(),
    });
  } else {
    console.warn('Seed Warning for 002_artists.js: Could not find artist user (artist1@divinetunes.app) to link artist profile.');
  }

  if (artistUser2) {
    artistsToSeed.push({
      artist_id: uuidv4(),
      user_id: artistUser2.user_id,
      artist_name: 'Soulful Psalms',
      bio: 'Spreading messages of hope and faith through soulful melodies. Led by Creative Soul.',
      profile_image_url: 'https://picsum.photos/seed/sps_profile/200/200', // Placeholder image
      banner_image_url: 'https://picsum.photos/seed/sps_banner/800/200', // Placeholder image
      verified: false, // Example of an unverified artist
      created_at: new Date(),
      updated_at: new Date(),
    });
  } else {
    console.warn('Seed Warning for 002_artists.js: Could not find artist user (artist2@divinetunes.app) to link artist profile.');
  }

  if (artistsToSeed.length > 0) {
    await knex('Artists').insert(artistsToSeed);
  } else {
    console.log('Seed Info for 002_artists.js: No artist users found, so no artists were seeded.');
  }
};
