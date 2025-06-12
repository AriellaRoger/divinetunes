# Divine - Christian Music Sharing App Architecture

## Overview
Divine is a comprehensive Christian music streaming platform supporting mobile (Android/iOS), desktop (PC/Mac), TV OS, and CarPlay with faith-based features, community interaction, and artist support tools.

## Technology Stack

### Frontend
- **Mobile**: React Native (iOS/Android)
- **Web/Desktop**: React with Electron wrapper
- **TV OS**: React Native for TV
- **CarPlay**: React Native CarPlay integration

### Backend
- **API**: Node.js with Express/Fastify
- **Database**: PostgreSQL (primary) + Redis (caching/sessions)
- **File Storage**: AWS S3 (audio files, images)
- **Real-time**: Socket.io for live features
- **Authentication**: JWT + OAuth (Google, Facebook, Apple)
- **Payment**: Stripe integration
- **CDN**: CloudFront for audio streaming

### Infrastructure
- **Hosting**: AWS/Docker containers
- **Search**: Elasticsearch for content discovery
- **Analytics**: Custom analytics + third-party integration
- **Push Notifications**: Firebase Cloud Messaging

## File + Folder Structure

```
divine-app/
├── mobile/                          # React Native mobile app
│   ├── src/
│   │   ├── components/              # Reusable UI components
│   │   │   ├── common/              # Generic components
│   │   │   │   ├── Button.js
│   │   │   │   ├── Modal.js
│   │   │   │   ├── LoadingSpinner.js
│   │   │   │   └── SearchBar.js
│   │   │   ├── player/              # Music player components
│   │   │   │   ├── MusicPlayer.js
│   │   │   │   ├── ProgressBar.js
│   │   │   │   ├── VolumeControl.js
│   │   │   │   └── PlaylistQueue.js
│   │   │   ├── auth/                # Authentication components
│   │   │   │   ├── LoginForm.js
│   │   │   │   ├── SignupForm.js
│   │   │   │   └── SocialLogin.js
│   │   │   └── worship/             # Worship mode components
│   │   │       ├── LyricsDisplay.js
│   │   │       ├── ChordSheet.js
│   │   │       └── VerseDisplay.js
│   │   ├── screens/                 # App screens/pages
│   │   │   ├── auth/
│   │   │   │   ├── LoginScreen.js
│   │   │   │   ├── RegisterScreen.js
│   │   │   │   └── ForgotPasswordScreen.js
│   │   │   ├── main/
│   │   │   │   ├── HomeScreen.js
│   │   │   │   ├── DiscoverScreen.js
│   │   │   │   ├── LibraryScreen.js
│   │   │   │   └── ProfileScreen.js
│   │   │   ├── player/
│   │   │   │   ├── NowPlayingScreen.js
│   │   │   │   ├── QueueScreen.js
│   │   │   │   └── LyricsScreen.js
│   │   │   ├── playlists/
│   │   │   │   ├── PlaylistScreen.js
│   │   │   │   ├── CreatePlaylistScreen.js
│   │   │   │   └── SharedPlaylistScreen.js
│   │   │   ├── community/
│   │   │   │   ├── TestimonyBoardScreen.js
│   │   │   │   ├── PrayerRequestScreen.js
│   │   │   │   └── LiveStreamScreen.js
│   │   │   ├── kids/
│   │   │   │   ├── KidsModeScreen.js
│   │   │   │   ├── KidsPlaylistScreen.js
│   │   │   │   └── ParentalControlScreen.js
│   │   │   └── artist/
│   │   │       ├── ArtistProfileScreen.js
│   │   │       ├── ArtistDashboardScreen.js
│   │   │       └── UploadContentScreen.js
│   │   ├── services/                # API and external services
│   │   │   ├── api/
│   │   │   │   ├── authService.js
│   │   │   │   ├── musicService.js
│   │   │   │   ├── playlistService.js
│   │   │   │   ├── userService.js
│   │   │   │   ├── paymentService.js
│   │   │   │   └── streamingService.js
│   │   │   ├── audio/
│   │   │   │   ├── audioManager.js
│   │   │   │   ├── streamingService.js
│   │   │   │   └── offlineManager.js
│   │   │   ├── storage/
│   │   │   │   ├── localStorage.js
│   │   │   │   ├── cacheManager.js
│   │   │   │   └── downloadManager.js
│   │   │   └── push/
│   │   │       ├── notificationService.js
│   │   │       └── pushManager.js
│   │   ├── store/                   # State management (Redux/Zustand)
│   │   │   ├── index.js
│   │   │   ├── slices/
│   │   │   │   ├── authSlice.js
│   │   │   │   ├── playerSlice.js
│   │   │   │   ├── playlistSlice.js
│   │   │   │   ├── userSlice.js
│   │   │   │   └── settingsSlice.js
│   │   │   └── middleware/
│   │   │       ├── audioMiddleware.js
│   │   │       └── syncMiddleware.js
│   │   ├── navigation/              # Navigation configuration
│   │   │   ├── AppNavigator.js
│   │   │   ├── AuthNavigator.js
│   │   │   ├── MainNavigator.js
│   │   │   └── TabNavigator.js
│   │   ├── utils/                   # Utility functions
│   │   │   ├── helpers.js
│   │   │   ├── constants.js
│   │   │   ├── validators.js
│   │   │   └── formatters.js
│   │   ├── hooks/                   # Custom React hooks
│   │   │   ├── useAuth.js
│   │   │   ├── usePlayer.js
│   │   │   ├── usePlaylist.js
│   │   │   └── useOffline.js
│   │   └── styles/                  # Styling
│   │       ├── colors.js
│   │       ├── typography.js
│   │       ├── spacing.js
│   │       └── themes.js
│   ├── android/                     # Android-specific code
│   ├── ios/                         # iOS-specific code
│   ├── package.json
│   └── app.json
│
├── web/                             # React web application
│   ├── src/
│   │   ├── components/              # Shared components with mobile
│   │   ├── pages/                   # Web-specific pages
│   │   ├── services/                # API services
│   │   ├── store/                   # State management
│   │   ├── utils/                   # Utilities
│   │   └── styles/                  # Web-specific styles
│   ├── public/
│   ├── package.json
│   └── webpack.config.js
│
├── desktop/                         # Electron wrapper
│   ├── main.js
│   ├── preload.js
│   ├── package.json
│   └── build/
│
├── backend/                         # Node.js API server
│   ├── src/
│   │   ├── controllers/             # Request handlers
│   │   │   ├── authController.js
│   │   │   ├── userController.js
│   │   │   ├── musicController.js
│   │   │   ├── playlistController.js
│   │   │   ├── artistController.js
│   │   │   ├── paymentController.js
│   │   │   ├── streamController.js
│   │   │   ├── communityController.js
│   │   │   └── adminController.js
│   │   ├── models/                  # Database models
│   │   │   ├── User.js
│   │   │   ├── Artist.js
│   │   │   ├── Song.js
│   │   │   ├── Album.js
│   │   │   ├── Playlist.js
│   │   │   ├── PlaylistSong.js
│   │   │   ├── Testimony.js
│   │   │   ├── PrayerRequest.js
│   │   │   ├── Subscription.js
│   │   │   ├── LiveStream.js
│   │   │   ├── Devotional.js
│   │   │   └── UserActivity.js
│   │   ├── services/                # Business logic
│   │   │   ├── authService.js
│   │   │   ├── musicService.js
│   │   │   ├── playlistService.js
│   │   │   ├── recommendationService.js
│   │   │   ├── paymentService.js
│   │   │   ├── streamingService.js
│   │   │   ├── notificationService.js
│   │   │   ├── analyticsService.js
│   │   │   └── moderationService.js
│   │   ├── middleware/              # Express middleware
│   │   │   ├── auth.js
│   │   │   ├── validation.js
│   │   │   ├── rateLimit.js
│   │   │   ├── cors.js
│   │   │   └── errorHandler.js
│   │   ├── routes/                  # API routes
│   │   │   ├── auth.js
│   │   │   ├── users.js
│   │   │   ├── music.js
│   │   │   ├── playlists.js
│   │   │   ├── artists.js
│   │   │   ├── payments.js
│   │   │   ├── streaming.js
│   │   │   ├── community.js
│   │   │   └── admin.js
│   │   ├── database/                # Database configuration
│   │   │   ├── connection.js
│   │   │   ├── migrations/
│   │   │   ├── seeders/
│   │   │   └── queries/
│   │   ├── utils/                   # Backend utilities
│   │   │   ├── logger.js
│   │   │   ├── encryption.js
│   │   │   ├── fileUpload.js
│   │   │   ├── emailService.js
│   │   │   └── validators.js
│   │   ├── config/                  # Configuration files
│   │   │   ├── database.js
│   │   │   ├── redis.js
│   │   │   ├── aws.js
│   │   │   ├── stripe.js
│   │   │   └── environment.js
│   │   └── app.js                   # Express app setup
│   ├── tests/                       # Backend tests
│   ├── package.json
│   └── server.js                    # Entry point
│
├── shared/                          # Shared utilities and types
│   ├── types/                       # TypeScript type definitions
│   ├── constants/                   # Shared constants
│   ├── utils/                       # Cross-platform utilities
│   └── api-client/                  # Shared API client
│
├── admin-dashboard/                 # Admin web interface
│   ├── src/
│   │   ├── components/
│   │   ├── pages/
│   │   ├── services/
│   │   └── utils/
│   └── package.json
│
├── docs/                           # Documentation
│   ├── api/                        # API documentation
│   ├── architecture/               # Architecture docs
│   ├── deployment/                 # Deployment guides
│   └── user-guide/                 # User documentation
│
├── scripts/                        # Build and deployment scripts
│   ├── build.sh
│   ├── deploy.sh
│   ├── database-setup.sql
│   └── seed-data.js
│
├── docker/                         # Docker configuration
│   ├── Dockerfile.backend
│   ├── Dockerfile.web
│   ├── docker-compose.yml
│   └── docker-compose.prod.yml
│
└── package.json                    # Root package.json
```

## Core Components and Their Functions

### Authentication System
**Location**: `backend/src/controllers/authController.js`, `mobile/src/services/api/authService.js`
- Handles email/phone + password authentication
- Third-party OAuth integration (Google, Facebook, Apple)
- JWT token management and refresh
- User registration with email verification
- Password reset functionality

### Music Player Engine
**Location**: `mobile/src/services/audio/audioManager.js`
- Cross-platform audio playback
- Queue management and shuffle/repeat
- Background playback support
- CarPlay/Android Auto integration
- Offline playback capability
- Real-time progress tracking

### Playlist Management
**Location**: `backend/src/services/playlistService.js`, `mobile/src/store/slices/playlistSlice.js`
- CRUD operations for playlists
- Real-time collaborative editing
- Permission management (public/private/shared)
- Denominational categorization
- Auto-generated seasonal playlists

### Content Delivery System
**Location**: `backend/src/services/streamingService.js`
- Audio file streaming and CDN integration
- Adaptive bitrate streaming
- Offline download management
- Content caching strategies
- Geographic content delivery

### Community Features
**Location**: `backend/src/controllers/communityController.js`
- Testimony board with moderation
- Anonymous prayer request system
- User interaction tracking (likes, follows)
- Social sharing integration
- Community guidelines enforcement

### Kids Mode
**Location**: `mobile/src/screens/kids/`
- Age-appropriate content filtering
- Parental controls and time limits
- Simplified UI for children
- Educational content integration
- Safe browsing restrictions

### Subscription & Payment
**Location**: `backend/src/services/paymentService.js`
- Freemium model implementation
- Stripe payment processing
- Subscription lifecycle management
- Trial period handling
- Revenue sharing for artists

## State Management Architecture

### Frontend State (Redux/Zustand)
```javascript
// Global State Structure
{
  auth: {
    user: null,
    token: null,
    isAuthenticated: false,
    loginType: 'email' // email, google, facebook, apple
  },
  player: {
    currentSong: null,
    isPlaying: false,
    queue: [],
    currentIndex: 0,
    shuffle: false,
    repeat: 'off', // off, one, all
    volume: 1.0,
    progress: 0,
    isOfflineMode: false
  },
  playlists: {
    userPlaylists: [],
    sharedPlaylists: [],
    collaborativePlaylists: [],
    currentPlaylist: null,
    isLoading: false
  },
  user: {
    profile: null,
    preferences: {},
    subscriptionStatus: 'free', // free, premium
    followedArtists: [],
    recentActivity: []
  },
  kids: {
    isKidsMode: false,
    ageGroup: null, // toddler, child, teen
    parentalControls: {},
    allowedContent: []
  },
  community: {
    testimonies: [],
    prayerRequests: [],
    activeStreams: [],
    notifications: []
  },
  settings: {
    theme: 'light',
    language: 'en',
    audioQuality: 'high',
    offlineSettings: {},
    notificationPreferences: {}
  }
}
```

### Backend State (Database + Redis)
**PostgreSQL Tables**:
- Users, Artists, Songs, Albums, Playlists
- Subscriptions, Payments, Analytics
- Testimonies, PrayerRequests, LiveStreams
- UserActivity, Recommendations

**Redis Cache**:
- Session management
- Frequently accessed playlists
- Real-time collaboration data
- Streaming metadata
- Rate limiting counters

## Service Connections

### API Communication Flow
```
Mobile/Web App ↔ REST API ↔ Business Logic ↔ Database
                    ↓
              WebSocket Server (Real-time features)
                    ↓
              External Services (Stripe, AWS S3, FCM)
```

### Real-time Features
**WebSocket Connections**:
- Collaborative playlist editing
- Live stream chat and interactions
- Real-time prayer request updates
- Social activity notifications
- Live worship event streaming

### Audio Streaming Architecture
```
Audio Files (S3) → CDN (CloudFront) → Adaptive Streaming → Client Player
                                           ↓
                                    Offline Cache (Device Storage)
```

### Search and Discovery
**Elasticsearch Integration**:
- Full-text search across songs, artists, lyrics
- Recommendation engine based on listening history
- Mood-based content discovery
- Seasonal and themed content suggestions
- Voice search capability

## Platform-Specific Implementations

### Mobile (React Native)
- Native audio modules for iOS/Android
- Background task handling
- Push notification integration
- CarPlay/Android Auto support
- Offline synchronization

### Web (React)
- Web Audio API integration
- Progressive Web App features
- Desktop notification support
- Keyboard shortcuts
- Social media sharing

### Desktop (Electron)
- System tray integration
- Native menu bars
- File system access for downloads
- Hardware media key support
- Auto-updater functionality

### TV OS
- TV-optimized navigation
- Remote control support
- Big screen UI adaptations
- Family-friendly interface
- Voice control integration

## Security and Privacy

### Data Protection
- End-to-end encryption for sensitive data
- GDPR compliance for EU users
- COPPA compliance for kids mode
- Secure payment processing
- Privacy-focused analytics

### Content Moderation
- AI-powered content filtering
- Community reporting system
- Manual review processes
- Denominational content guidelines
- Parental control systems

This architecture provides a scalable, maintainable foundation for the Divine app across all platforms while maintaining the Christian values and community-focused features that make it unique.