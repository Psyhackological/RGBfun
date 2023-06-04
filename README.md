# RGB Fun

## 1. Introduction

RGB Fun is a Flutter app that allows users to explore and save randomly generated colors. The motivation behind RGB Fun is to create a fun and engaging way to explore color spaces and possibly discover unique color combinations.

## 2. Features

- Generate a new random color by tapping anywhere on the screen
- The color currently on display can be added to or removed from favorites
- View a list of favorite colors, stored persistently between app launches
- Each color is displayed in hexadecimal representation

## 3. Dependencies

The RGB Fun app depends on a few external libraries:

- `provider`: (version ^6.0.5) Used for state management in the application.
- `path_provider`: (version ^2.0.2) Used to find the local path on the device to store favorite colors persistently.
- `hive`: (version ^2.2.3) A lightweight and key-value database, used to store favorite colors persistently.
- `hive_flutter`: (version ^1.1.0) Flutter-specific additions for Hive, used for initializing Hive in a Flutter environment.

## 4. Example Widgets & Functions

Some of the core widgets and functions used in this app include:

- `InkWell`: Provides interactivity to the full-screen color display, allowing users to tap anywhere on the screen to generate a new random color.
- `ListView`: Used in the Favorites Page to display a list of all saved favorite colors.
- `_colorToHexString`: A function that converts a `Color` object to a hexadecimal string representation.
- `Consumer<FavoritesModel>`: Listens to the `FavoritesModel` and rebuilds the `ListView` when the favorites list changes.
- `ChangeNotifierProvider`: Provides the `FavoritesModel` to widgets in the app that need to access or modify the list of favorite colors.

## 5. License

MIT License

Copyright (c) 2023 The RGB Fun Team

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
