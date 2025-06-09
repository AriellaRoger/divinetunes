# Christian Music App - Granular Build Plan

## Phase 1: Project Setup & Core Infrastructure

### 1.1 Backend Foundation
**Task 1.1.1**: Create PHP project structure
- **Start**: Empty directory
- **End**: Complete folder structure with all directories created
- **Test**: Verify all folders exist as per architecture
- **Files**: Create all folders in `/christian_music_backend/`

**Task 1.1.2**: Setup database configuration
- **Start**: Empty config folder
- **End**: Working database connection file
- **Test**: Successfully connect to MySQL database
- **Files**: `config/database.php` with connection class

**Task 1.1.3**: Create base Database utility class
- **Start**: Empty Utils folder
- **End**: Database utility class with basic CRUD methods
- **Test**: Can execute SELECT, INSERT, UPDATE, DELETE queries
- **Files**: `src/Utils/Database.php`

**Task 1.1.4**: Setup CORS configuration
- **Start**: No CORS handling
- **End**: CORS middleware handling all preflight requests
- **Test**: OPTIONS requests return proper CORS headers
- **Files**: `config/cors.php`, `src/Middleware/CorsMiddleware.php`

**Task 1.1.5**: Create JWT utility class
- **Start**: No authentication utilities
- **End**: JWT class with encode/decode methods
- **Test**: Can generate and validate JWT tokens
- **Files**: `src/Utils/JWT.php`

### 1.2 Database Schema
**Task 1.2.1**: Create users table migration
- **Start**: Empty database
- **End**: Users table with all required fields
- **Test**: Can insert/select user records
- **Files**: `database/migrations/001_create_users_table.sql`

**Task 1.2.2**: Create artists table migration
- **Start**: Users table exists
- **End**: Artists table with foreign key to users
- **Test**: Can create artist linked to user
- **Files**: `database/migrations/002_create_artists_table.sql`

**Task 1.2.3**: Create albums table migration
- **Start**: Artists table exists
- **End**: Albums table with artist relationships
- **Test**: Can create album linked to artist
- **Files**: `database/migrations/003_create_albums_table.sql`

**Task 1.2.4**: Create songs table migration
- **Start**: Albums table exists
- **End**: Songs table with album/artist relationships
- **Test**: Can create song linked to album and artist
- **Files**: `database/migrations/004_create_songs_table.sql`

**Task 1.2.5**: Create playlists table migration
- **Start**: Songs table exists
- **End**: Playlists and playlist_songs junction table
- **Test**: Can create playlist and add songs to it
- **Files**: `database/migrations/005_create_playlists_table.sql`

### 1.3 Basic Models
**Task 1.3.1**: Create User model
- **Start**: Database class exists
- **End**: User model with CRUD operations
- **Test**: Can create, read, update, delete users
- **Files**: `src/Models/User.php`

**Task 1.3.2**: Create Artist model
- **Start**: User model exists
- **End**: Artist model with user relationship
- **Test**: Can perform CRUD operations on artists
- **Files**: `src/Models/Artist.php`

**Task 1.3.3**: Create Song model
- **Start**: Artist model exists
- **End**: Song model with artist/album relationships
- **Test**: Can perform CRUD operations on songs
- **Files**: `src/Models/Song.php`

### 1.4 Flutter Project Setup
**Task 1.4.1**: Create Flutter project structure
- **Start**: Empty directory
- **End**: Flutter project with folder structure
- **Test**: `flutter run` executes without errors
- **Files**: Complete Flutter project structure

**Task 1.4.2**: Add required dependencies
- **Start**: Basic pubspec.yaml
- **End**: All required packages added to pubspec.yaml
- **Test**: `flutter pub get` completes successfully
- **Files**: `pubspec.yaml` with provider, http, dio, sqflite, etc.

**Task 1.4.3**: Setup app constants
- **Start**: Empty constants folder
- **End**: All app constants defined
- **Test**: Can import and use constants throughout app
- **Files**: `lib/core/constants/app_constants.dart`, `api_endpoints.dart`

**Task 1.4.4**: Create base API service
- **Start**: Empty services folder
- **End**: HTTP client with base configurations
- **Test**: Can make GET request to test endpoint
- **Files**: `lib/core/services/api_service.dart`

## Phase 2: Authentication System

### 2.1 Backend Authentication
**Task 2.1.1**: Create AuthController register method
- **Start**: Empty AuthController
- **End**: Register endpoint that creates new users
- **Test**: POST to /api/auth/register creates user in database
- **Files**: `src/Controllers/AuthController.php` (register method only)

**Task 2.1.2**: Create AuthController login method
- **Start**: Register method exists
- **End**: Login endpoint that returns JWT token
- **Test**: POST to /api/auth/login returns valid JWT
- **Files**: `src/Controllers/AuthController.php` (add login method)

**Task 2.1.3**: Create auth middleware
- **Start**: JWT utility exists
- **End**: Middleware that validates JWT tokens
- **Test**: Protected endpoints reject invalid tokens
- **Files**: `src/Middleware/AuthMiddleware.php`

**Task 2.1.4**: Create auth routes
- **Start**: Controllers exist
- **End**: All auth routes defined and working
- **Test**: Can register and login via API endpoints
- **Files**: `src/Routes/auth_routes.php`, update `src/Routes/api.php`

### 2.2 Flutter Authentication
**Task 2.2.1**: Create User model
- **Start**: Empty models folder
- **End**: User model class with JSON serialization
- **Test**: Can convert User to/from JSON
- **Files**: `lib/data/models/user_model.dart`

**Task 2.2.2**: Create AuthService
- **Start**: API service exists
- **End**: AuthService with login/register methods
- **Test**: Can call backend auth endpoints successfully
- **Files**: `lib/core/services/auth_service.dart`

**Task 2.2.3**: Create AuthProvider
- **Start**: AuthService exists
- **End**: Provider managing authentication state
- **Test**: Login updates authentication state
- **Files**: `lib/presentation/providers/auth_provider.dart`

**Task 2.2.4**: Create login screen UI
- **Start**: Empty screens folder
- **End**: Login screen with form validation
- **Test**: Form validates input and shows errors
- **Files**: `lib/presentation/screens/auth/login_screen.dart`

**Task 2.2.5**: Connect login screen to AuthProvider
- **Start**: Login screen and AuthProvider exist
- **End**: Login screen triggers authentication
- **Test**: Valid login navigates to home screen
- **Files**: Update `login_screen.dart` to use AuthProvider

**Task 2.2.6**: Create register screen UI
- **Start**: Login screen complete
- **End**: Register screen with form validation
- **Test**: Form validates input and creates account
- **Files**: `lib/presentation/screens/auth/register_screen.dart`

**Task 2.2.7**: Create splash screen with auth check
- **Start**: Auth system complete
- **End**: Splash screen that checks login status
- **Test**: App navigates to correct screen based on auth state
- **Files**: `lib/presentation/screens/misc/splash_screen.dart`

## Phase 3: Basic Music System

### 3.1 Backend Music Infrastructure
**Task 3.1.1**: Create MusicController with basic endpoints
- **Start**: Song model exists
- **End**: GET endpoints for songs, artists, albums
- **Test**: Can retrieve lists of songs, artists, albums
- **Files**: `src/Controllers/MusicController.php`

**Task 3.1.2**: Add file upload functionality
- **Start**: MusicController exists
- **End**: Can upload music files and cover images
- **Test**: POST request successfully uploads files
- **Files**: `src/Services/FileUploadService.php`, update MusicController

**Task 3.1.3**: Create music routes
- **Start**: MusicController complete
- **End**: All music endpoints accessible
- **Test**: Can CRUD songs, artists, albums via API
- **Files**: `src/Routes/music_routes.php`

### 3.2 Flutter Music Models
**Task 3.2.1**: Create Song model
- **Start**: User model exists
- **End**: Song model with JSON serialization
- **Test**: Can convert Song to/from JSON
- **Files**: `lib/data/models/song_model.dart`

**Task 3.2.2**: Create Artist model
- **Start**: Song model exists
- **End**: Artist model with JSON serialization
- **Test**: Can convert Artist to/from JSON
- **Files**: `lib/data/models/artist_model.dart`

**Task 3.2.3**: Create Album model
- **Start**: Artist model exists
- **End**: Album model with JSON serialization
- **Test**: Can convert Album to/from JSON
- **Files**: `lib/data/models/album_model.dart`

**Task 3.2.4**: Create Playlist model
- **Start**: Album model exists
- **End**: Playlist model with songs relationship
- **Test**: Can convert Playlist to/from JSON
- **Files**: `lib/data/models/playlist_model.dart`

### 3.3 Music Services
**Task 3.3.1**: Create MusicRepository
- **Start**: Music models exist
- **End**: Repository handling music data operations
- **Test**: Can fetch songs, artists, albums from API
- **Files**: `lib/data/repositories/music_repository.dart`

**Task 3.3.2**: Create basic AudioService
- **Start**: Empty audio service
- **End**: AudioService that can play/pause/stop audio
- **Test**: Can play a sample audio file
- **Files**: `lib/core/services/audio_service.dart`

**Task 3.3.3**: Create MusicPlayerProvider
- **Start**: AudioService exists
- **End**: Provider managing playback state
- **Test**: Play button updates provider state
- **Files**: `lib/presentation/providers/music_player_provider.dart`

### 3.4 Basic Music UI
**Task 3.4.1**: Create song tile widget
- **Start**: Song model exists
- **End**: Reusable widget displaying song info
- **Test**: Widget displays song title, artist, duration
- **Files**: `lib/presentation/widgets/music/song_tile.dart`

**Task 3.4.2**: Create basic music player widget
- **Start**: MusicPlayerProvider exists
- **End**: Widget with play/pause button and progress bar
- **Test**: Buttons control playback state
- **Files**: `lib/presentation/widgets/music/music_player_widget.dart`

**Task 3.4.3**: Create home screen with song list
- **Start**: Song tile widget exists
- **End**: Home screen displaying list of songs
- **Test**: Screen loads and displays songs from API
- **Files**: `lib/presentation/screens/home/home_screen.dart`

**Task 3.4.4**: Create basic music player screen
- **Start**: Music player widget exists
- **End**: Full-screen music player interface
- **Test**: Can navigate to player and control playback
- **Files**: `lib/presentation/screens/music/music_player_screen.dart`

## Phase 4: Bible Integration

### 4.1 Backend Bible System
**Task 4.1.1**: Create bible_verses table migration
- **Start**: Basic tables exist
- **End**: Bible verses table with song relationships
- **Test**: Can store bible verses linked to songs
- **Files**: `database/migrations/006_create_bible_verses_table.sql`

**Task 4.1.2**: Create BibleVerse model
- **Start**: Bible verses table exists
- **End**: Model with CRUD operations
- **Test**: Can create, read, update bible verses
- **Files**: `src/Models/BibleVerse.php`

**Task 4.1.3**: Create BibleController
- **Start**: BibleVerse model exists
- **End**: Controller with verse CRUD endpoints
- **Test**: Can manage bible verses via API
- **Files**: `src/Controllers/BibleController.php`

**Task 4.1.4**: Add verse sync to songs
- **Start**: BibleController exists
- **End**: Endpoint to get verses for specific song
- **Test**: GET /songs/{id}/verses returns associated verses
- **Files**: Update `MusicController.php` with verse relationships

### 4.2 Flutter Bible Integration
**Task 4.2.1**: Create BibleVerse model
- **Start**: Music models exist
- **End**: BibleVerse model with JSON serialization
- **Test**: Can convert BibleVerse to/from JSON
- **Files**: `lib/data/models/bible_verse_model.dart`

**Task 4.2.2**: Create BibleRepository
- **Start**: BibleVerse model exists
- **End**: Repository for bible verse operations
- **Test**: Can fetch verses for songs
- **Files**: `lib/data/repositories/bible_repository.dart`

**Task 4.2.3**: Create BibleProvider
- **Start**: BibleRepository exists
- **End**: Provider managing bible verse state
- **Test**: Can load and display verses for current song
- **Files**: `lib/presentation/providers/bible_provider.dart`

**Task 4.2.4**: Create verse display widget
- **Start**: BibleProvider exists
- **End**: Widget showing bible verses with references
- **Test**: Widget displays verse text and reference
- **Files**: `lib/presentation/widgets/bible/verse_widget.dart`

**Task 4.2.5**: Integrate verses into music player
- **Start**: Verse widget and music player exist
- **End**: Music player shows relevant verses during playback
- **Test**: Verses appear when song is playing
- **Files**: Update `music_player_screen.dart` to show verses

## Phase 5: Playlist Management

### 5.1 Backend Playlist System
**Task 5.1.1**: Create PlaylistController
- **Start**: Playlist table exists
- **End**: Controller with playlist CRUD operations
- **Test**: Can create, read, update, delete playlists
- **Files**: `src/Controllers/PlaylistController.php`

**Task 5.1.2**: Add songs to playlist functionality
- **Start**: PlaylistController exists
- **End**: Endpoint to add/remove songs from playlists
- **Test**: Can modify playlist contents via API
- **Files**: Update `PlaylistController.php` with song management

**Task 5.1.3**: Add playlist sharing functionality
- **Start**: Basic playlist CRUD exists
- **End**: Endpoints for sharing playlists between users
- **Test**: Can share playlist and other users can access it
- **Files**: Update `PlaylistController.php` with sharing methods

### 5.2 Flutter Playlist Management
**Task 5.2.1**: Create PlaylistRepository
- **Start**: Playlist model exists
- **End**: Repository handling playlist operations
- **Test**: Can perform CRUD operations on playlists
- **Files**: `lib/data/repositories/playlist_repository.dart`

**Task 5.2.2**: Create PlaylistProvider
- **Start**: PlaylistRepository exists
- **End**: Provider managing playlist state
- **Test**: Can create, edit, delete playlists
- **Files**: `lib/presentation/providers/playlist_provider.dart`

**Task 5.2.3**: Create playlist card widget
- **Start**: Playlist model exists
- **End**: Widget displaying playlist info and cover
- **Test**: Widget shows playlist name, song count, duration
- **Files**: `lib/presentation/widgets/music/playlist_card.dart`

**Task 5.2.4**: Create playlist screen
- **Start**: Playlist card widget exists
- **End**: Screen showing playlist contents
- **Test**: Can view playlist and play songs from it
- **Files**: `lib/presentation/screens/music/playlist_screen.dart`

**Task 5.2.5**: Create playlist creation dialog
- **Start**: PlaylistProvider exists
- **End**: Dialog for creating new playlists
- **Test**: Can create new playlist with name and description
- **Files**: Create playlist creation widget

## Phase 6: Community Features Foundation

### 6.1 Backend Community Infrastructure
**Task 6.1.1**: Create testimonies table migration
- **Start**: Basic tables exist
- **End**: Testimonies table with user relationships
- **Test**: Can store user testimonies in database
- **Files**: `database/migrations/007_create_testimonies_table.sql`

**Task 6.1.2**: Create prayer_requests table migration
- **Start**: Testimonies table exists
- **End**: Prayer requests table with anonymity support
- **Test**: Can store prayer requests (anonymous and named)
- **Files**: `database/migrations/008_create_prayer_requests_table.sql`

**Task 6.1.3**: Create Testimony model
- **Start**: Testimonies table exists
- **End**: Model with CRUD operations
- **Test**: Can create, read, update testimonies
- **Files**: `src/Models/Testimony.php`

**Task 6.1.4**: Create PrayerRequest model
- **Start**: Prayer requests table exists
- **End**: Model with CRUD and anonymity handling
- **Test**: Can manage prayer requests with privacy controls
- **Files**: `src/Models/PrayerRequest.php`

### 6.2 Flutter Community Models
**Task 6.2.1**: Create Testimony model
- **Start**: Basic models exist
- **End**: Testimony model with JSON serialization
- **Test**: Can convert Testimony to/from JSON
- **Files**: `lib/data/models/testimony_model.dart`

**Task 6.2.2**: Create PrayerRequest model
- **Start**: Testimony model exists
- **End**: PrayerRequest model with JSON serialization
- **Test**: Can convert PrayerRequest to/from JSON
- **Files**: `lib/data/models/prayer_request_model.dart`

**Task 6.2.3**: Create CommunityRepository
- **Start**: Community models exist
- **End**: Repository for community data operations
- **Test**: Can fetch testimonies and prayer requests
- **Files**: `lib/data/repositories/community_repository.dart`

**Task 6.2.4**: Create CommunityProvider
- **Start**: CommunityRepository exists
- **End**: Provider managing community state
- **Test**: Can load and manage community content
- **Files**: `lib/presentation/providers/community_provider.dart`

## Phase 7: Advanced Music Features

### 7.1 Worship Mode
**Task 7.1.1**: Create worship mode UI
- **Start**: Music player exists
- **End**: Distraction-free worship interface
- **Test**: Worship mode hides unnecessary UI elements
- **Files**: `lib/presentation/screens/music/worship_mode_screen.dart`

**Task 7.1.2**: Add lyrics display to worship mode
- **Start**: Worship mode UI exists
- **End**: Lyrics display synchronized with playback
- **Test**: Lyrics appear and highlight during song playback
- **Files**: Update worship mode screen with lyrics widget

**Task 7.1.3**: Add loop functionality
- **Start**: Basic audio service exists
- **End**: Songs can be set to loop indefinitely
- **Test**: Song restarts automatically when loop is enabled
- **Files**: Update `audio_service.dart` with loop controls

**Task 7.1.4**: Add worship timer
- **Start**: Loop functionality exists
- **End**: Timer that can stop playback after set duration
- **Test**: Playback stops automatically after timer expires
- **Files**: Add timer functionality to worship mode

### 7.2 Offline Functionality
**Task 7.2.1**: Setup local database
- **Start**: Basic Flutter app exists
- **End**: SQLite database for offline storage
- **Test**: Can create and query local database
- **Files**: `lib/data/datasources/local/database_helper.dart`

**Task 7.2.2**: Implement song caching
- **Start**: Local database exists
- **End**: Can download and store songs locally
- **Test**: Songs play without internet connection
- **Files**: `lib/data/datasources/local/offline_music_datasource.dart`

**Task 7.2.3**: Add download progress tracking
- **Start**: Song caching works
- **End**: UI shows download progress for songs
- **Test**: Progress bar updates during song download
- **Files**: Add download progress to audio service

**Task 7.2.4**: Implement offline playlist sync
- **Start**: Song caching complete
- **End**: Playlists work in offline mode
- **Test**: Can play cached playlists without internet
- **Files**: Update playlist functionality for offline support

## Phase 8: Admin Dashboard

### 8.1 Admin Backend
**Task 8.1.1**: Create admin middleware
- **Start**: Auth middleware exists
- **End**: Middleware checking admin role permissions
- **Test**: Admin-only endpoints reject non-admin users
- **Files**: `src/Middleware/AdminMiddleware.php`

**Task 8.1.2**: Create AdminController analytics methods
- **Start**: Admin middleware exists
- **End**: Endpoints returning user and content statistics
- **Test**: Admin can view app usage statistics
- **Files**: `src/Controllers/AdminController.php` (analytics methods)

**Task 8.1.3**: Create user management endpoints
- **Start**: AdminController exists
- **End**: CRUD operations for user management
- **Test**: Admin can view, edit, disable user accounts
- **Files**: Update `AdminController.php` with user management

**Task 8.1.4**: Create content management endpoints
- **Start**: User management complete
- **End**: CRUD operations for songs, artists, albums
- **Test**: Admin can manage all music content
- **Files**: Update `AdminController.php` with content management

### 8.2 Admin Dashboard UI
**Task 8.2.1**: Create admin login page
- **Start**: Basic PHP structure exists
- **End**: HTML login form for admin access
- **Test**: Admin can log in with credentials
- **Files**: `admin/index.php`

**Task 8.2.2**: Create admin dashboard layout
- **Start**: Admin login works
- **End**: Dashboard with navigation and stats overview
- **Test**: Dashboard shows key metrics and navigation
- **Files**: `admin/dashboard.php`

**Task 8.2.3**: Create users management page
- **Start**: Dashboard layout exists
- **End**: Page for viewing and managing users
- **Test**: Can view user list and perform actions
- **Files**: `admin/users.php`

**Task 8.2.4**: Create music management page
- **Start**: Users management complete
- **End**: Page for managing songs, artists, albums
- **Test**: Can upload, edit, delete music content
- **Files**: `admin/music.php`

**Task 8.2.5**: Create analytics page
- **Start**: Music management complete
- **End**: Page displaying detailed app analytics
- **Test**: Shows charts and metrics for app usage
- **Files**: `admin/analytics.php`

## Phase 9: Testing & Polish

### 9.1 Backend Testing
**Task 9.1.1**: Create authentication tests
- **Start**: Auth system complete
- **End**: Unit tests for all auth endpoints
- **Test**: All auth scenarios pass automated tests
- **Files**: Create test files for authentication

**Task 9.1.2**: Create music API tests
- **Start**: Music system complete
- **End**: Unit tests for all music endpoints
- **Test**: All music operations pass automated tests
- **Files**: Create test files for music API

**Task 9.1.3**: Create community API tests
- **Start**: Community system complete
- **End**: Unit tests for community features
- **Test**: All community operations pass automated tests
- **Files**: Create test files for community API

### 9.2 Flutter Testing
**Task 9.2.1**: Create widget tests for music player
- **Start**: Music player complete
- **End**: Widget tests for all player components
- **Test**: All player widgets render and function correctly
- **Files**: `test/widget_test.dart` for music components

**Task 9.2.2**: Create integration tests for auth flow
- **Start**: Auth system complete
- **End**: Full integration tests for login/register
- **Test**: Complete auth flow works end-to-end
- **Files**: `test/integration_test.dart` for auth

**Task 9.2.3**: Create unit tests for providers
- **Start**: All providers complete
- **End**: Unit tests for all provider classes
- **Test**: Provider state management works correctly
- **Files**: Individual test files for each provider

### 9.3 Performance Optimization
**Task 9.3.1**: Optimize image loading
- **Start**: Basic image display works
- **End**: Images load efficiently with caching
- **Test**: Images load quickly and don't reload unnecessarily
- **Files**: Update image handling throughout app

**Task 9.3.2**: Optimize audio streaming
- **Start**: Basic audio playback works
- **End**: Audio streams efficiently with buffering
- **Test**: Audio plays smoothly without interruptions
- **Files**: Update `audio_service.dart` with optimizations

**Task 9.3.3**: Optimize database queries
- **Start**: Basic CRUD operations work
- **End**: All database queries are optimized
- **Test**: App responds quickly to all data operations
- **Files**: Add indexes and optimize all model queries

## Phase 10: Advanced Features

### 10.1 Push Notifications
**Task 10.1.1**: Setup Firebase for notifications
- **Start**: Basic app functionality complete
- **End**: Firebase configured for push notifications
- **Test**: Can send test notification to device
- **Files**: Firebase configuration files

**Task 10.1.2**: Implement prayer reminder notifications
- **Start**: Firebase setup complete
- **End**: Users can set prayer reminders
- **Test**: Notifications appear at scheduled times
- **Files**: Update notification service with prayer reminders

**Task 10.1.3**: Implement community notifications
- **Start**: Prayer reminders work
- **End**: Notifications for new testimonies/prayer requests
- **Test**: Users receive notifications for community activity
- **Files**: Update community features with notifications

### 10.2 Search & Discovery
**Task 10.2.1**: Implement basic search backend
- **Start**: All content models exist
- **End**: Search endpoint returning relevant results
- **Test**: Search returns songs, artists, playlists
- **Files**: Add search method to `MusicController.php`

**Task 10.2.2**: Create search UI
- **Start**: Search backend works
- **End**: Search screen with results display
- **Test**: Users can search and view results
- **Files**: `lib/presentation/screens/home/search_screen.dart`

**Task 10.2.3**: Implement mood-based recommendations
- **Start**: Basic search works
- **End**: Recommendations based on user mood input
- **Test**: Mood selection returns appropriate songs
- **Files**: Add recommendation logic to backend and frontend

## Completion Criteria

Each task is complete when:
1. ✅ All specified files are created/updated
2. ✅ Automated tests pass (where applicable)
3. ✅ Manual testing confirms functionality works
4. ✅ Code follows project architecture patterns
5. ✅ No breaking changes to existing functionality

## Notes for Engineering LLM

- Complete tasks in order - each builds on previous ones
- Test thoroughly before marking task complete
- Follow the established architecture patterns
- Ask for clarification if task requirements are unclear
- Document any deviations from the plan with reasoning