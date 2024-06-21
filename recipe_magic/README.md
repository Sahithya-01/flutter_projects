# Recipe Magic App

## Overview

Welcome to the Recipe Magic App! This project showcases a Flutter application designed to display various recipes to users. The app is designed to work seamlessly on both iOS and Android platforms. This project is an excellent example for beginners and anyone looking to learn about Flutter. It covers various fundamental concepts such as Widgets, State Management, Authentication, Network Requests, Responsive Design, Navigation, and more.

## Features

- **User Authentication**: Secure login functionality with error handling.
- **Home Page**: Filter recipes by categories such as breakfast, lunch, dinner, and snacks.
- **Recipe Details**: Display detailed information about each recipe including images, ingredients, and instructions.
- **Responsive Design**: Ensures a consistent user experience across different devices and screen sizes.
- **State Management**: Efficiently manage the state of the app.
- **Network Requests**: Fetch data using `dio` package.
- **Error Handling**: Display errors using `status_alert` package.

## Packages Used

- [`dummyjson`](https://pub.dev/packages/dummyjson): For fetching recipe data and fake users.
- [`dio`](https://pub.dev/packages/dio): For making HTTP requests.
- [`status_alert`](https://pub.dev/packages/status_alert): For displaying alerts and error messages.

## Getting Started

### Prerequisites

- [Flutter SDK](https://flutter.dev/docs/get-started/install)
- [Android Studio](https://developer.android.com/studio) or [Xcode](https://developer.apple.com/xcode/) (for iOS development)

### Installation

1. Clone the repository:
   ```bash
   git clone https://github.com/yourusername/recipe-app.git
   cd recipe-app
   ```

2. Install dependencies:
   ```bash
   flutter pub get
   ```

3. Run the application:
   ```bash
   flutter run
   ```


## Usage

### Authentication

- On launching the app, users are presented with a login screen.
- Users need to enter their credentials to log in. If the login fails, an error message is displayed using the `status_alert` package.

### Home Page

- After successful login, users are redirected to the home page.
- Users can filter recipes based on categories like breakfast, lunch, dinner, and snacks.

### Recipe Details

- Clicking on a recipe displays detailed information about the recipe, including an image, ingredients, and cooking instructions.

## Learnings

This project covers various aspects of Flutter development:
- Utilizing various Flutter widgets such as Forms, Lists, Grid Views, Scaffolds, Buttons, Text, Images, Columns, and Rows.
- Implementing state management and navigation.
- Making network requests and handling responses.
- Designing a responsive UI for both iOS and Android platforms.
