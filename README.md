# Movie Recommendation Chatbot
- Used Google gemini api instead of OpenAI api because it was asking for credits which could be purchased through money only. the free version no longer generates responses.
- A Flutter application that provides movie recommendations based on user diary entries. This app leverages the Google Gemini API to generate tailored movie suggestions, making it a fun and interactive way to discover new films.
- [movie_recommendation_chatbot_recording](https://github.com/may-tas/movie_recommendation_chatbot/blob/main/movie_recommendation_chatbot_recording.mp4).

## Table of Contents

- [Features](#features)
- [Technologies Used](#technologies-used)
- [Installation](#installation)

## Features

- Enter diary entries to receive movie recommendations.
- Modern and user-friendly interface.
- Utilizes Cubit for state management.
- Integrates with the Google Gemini API for content generation.

## Technologies Used

- **Flutter**: For building the cross-platform mobile application.
- **Dart**: Programming language used in the project.
- **Cubit**: State management solution for managing application state.
- **Google Gemini API**: For generating movie recommendations based on user input.

## Installation

1. Clone the repository:

   ```bash
   git clone https://github.com/your-username/movie_recommendation_chatbot.git

   ```

2. Navigate to the project directory:

   ```bash
   cd movie_recommendation_chatbot

   ```

3. Install dependencies:

   ```bash
   flutter pub get

   ```

4. Create a .env file in the root directory and add your API key:

   ```bash
   API_KEY = your_google_gemini_api_key

   ```

5. Run the application:

   ```bash
   flutter run
   ```
