# Myflix
A Flutter application for movie discovery and streaming using [TMDB's](https://www.themoviedb.org/) API  and [Vidsrc](https://vidsrc.to/) API. Myflix is structured using a feature-based architecture in conjunction with the Model-View-ViewModel (MVVM) architecture.

## Features
- Discover popular, trending, top rated and upcoming movies in `HomePage`
- Access movie information, including the title, overview, release year, and TMDb rating in `MovieDetailsPage`
- Explore similar movies, if available, for any selected movie in `SimilarMoviesList`
- Stream a selected movie in `MovieWebView`
- Enable picture-in-picture mode in `MovieWebView`
- Add movies to your watchlist from `MovieDetailsPage` and view this list in `WatchListPage`. This data is stored locally using Hive.
- Search for movies in `SearchPage`
- Views for loading and error states across the app with retry options.
- Screen orientation locked to landscape mode during streaming.

## Getting Started
To build and run this app successfully, you need to take the following steps after cloning the project:

- Open the project in VScode
- Create a free [TMDB](https://www.themoviedb.org/signup) account
- Once logged in to TMBD, click on your avatar in the top right section
    - Click on `Settings`
    - Click on `API` in the sidebar by the left
    - Copy the API Read Access Token
- Back to VScode
Replace the placeholders and run:
```bash
flutter run --release --dart-define="BASE_URL=https://api.themoviedb.org/3/" --dart-define="TMDB_READ_ACCESS_TOKEN={your_read_access_token}"
```
OR (debug)
```bash
flutter run --dart-define="BASE_URL=https://api.themoviedb.org/3/" --dart-define="TMDB_READ_ACCESS_TOKEN={your_read_access_token}"
```
## Demo
https://github.com/UI-Light/myFlix/assets/63761764/e051e29e-dd6e-4d7c-a75d-2e27826dd613

## Screenshots 
<p float="left">
<img src="https://raw.githubusercontent.com/UI-Light/myFlix/main/screenshots/homepage.jpg"  width="32.5%"> 
<img src="https://raw.githubusercontent.com/UI-Light/myFlix/main/screenshots/details.jpg"  width="32.5%"> 
<img src="https://raw.githubusercontent.com/UI-Light/myFlix/main/screenshots/movie_webview.jpg"  width="32.5%"> 
</p>
<p float="left">
<img src="https://raw.githubusercontent.com/UI-Light/myFlix/main/screenshots/pip_mode.jpg"  width="32.5%"> 
<img src="https://raw.githubusercontent.com/UI-Light/myFlix/main/screenshots/watchlist.jpg"  width="32.5%"> 
<img src="https://raw.githubusercontent.com/UI-Light/myFlix/main/screenshots/search.jpg"  width="32.5%">
</p> 
