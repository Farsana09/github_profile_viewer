# GitHub Profile Viewer

A Flutter-based Android application that allows users to search GitHub profiles, view user details, and explore repositories with offline support and proper state management.

## Features
- **User Search**: Search for any GitHub username
- **Profile Tab**:
  - Profile image display
  - User bio summary
  - Repository count
- **Repositories Tab**:
  - List of all repositories with filtering
  - Opens repositories in Custom Chrome Tabs
- **State Management**: Provider for efficient state handling

## Screenshots
<!-- Add screenshots here -->
| Search Screen | Profile Tab | Repositories Tab |
|---------------|------------|------------------|
| ![Search](screenshots/search.png) | ![Profile](screenshots/profile.png) | ![Repos](screenshots/repos.png) |

## Technical Stack
- **Framework**: Flutter
- **State Management**: Provider
- **HTTP Client**: Dio
- **URL Handling**: url_launcher + flutter_custom_tabs

## Installation
1. Clone the repository:
   ```bash
   git clone https://github.com/Farsanao9/github_user.git
