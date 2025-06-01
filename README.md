# WatchList

## Description
WatchList is a SwiftUI application for tracking movies or TV shows you want to watch.

## Building and Running
1. Clone the repository
2. Open `WatchList.xcodeproj` in Xcode
3. Select your target device/simulator
4. Press ⌘R to build and run

## Architecture
The app uses MVVM (Model-View-ViewModel) architecture:
- **Models**: Represent the data 
- **Views**: SwiftUI components that display the UI
- **ViewModels**: Mediate between Models and Views, handling presentation logic

This architecture was chosen because:
- It provides clear separation of concerns
- Works naturally with SwiftUI's data flow
- Makes the code more testable and maintainable

## Dependencies
- iOS 15.6+
- Xcode 16.2+

## Assumptions
- The app assumes an internet connection for fetching movie/TV show data
- Designed for iPhone

## Features
- **Movie Search**  
  - Search for movies by title with real-time results  
  - Dynamic search as you type  
  - Clear search results option  

- **Favorites Management**  
  - Add/remove movies to/from your favorites  
  - Heart icon toggle for quick favoriting  
  - Dedicated favorites section   
