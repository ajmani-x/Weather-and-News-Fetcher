🌦️ Weather & News Fetcher

A simple Bash script that fetches real-time weather and latest news headlines directly from the terminal using cURL and public APIs.

📌 Features

Fetches current weather for any city

Fetches top news headlines

Simple and lightweight Bash script

Uses curl and public REST APIs

Beginner-friendly and easy to modify

🧰 Technologies Used

Bash (Shell Scripting)

cURL

REST APIs

JSON data (parsed using jq if installed)

OpenWeatherMap API

NewsAPI

📂 Files
fetcher.sh     # Main script

▶️ How to Run

Give execute permission:

chmod +x fetcher.sh


Run the script:

./fetcher.sh

🔑 API Keys

You need to add your API keys inside the script:

WEATHER_API_KEY="your_key"
NEWS_API_KEY="your_key"

🤝 Contributors

Feel free to contribute by improving features or adding new APIs.

📄 License

This project is licensed under MIT License.

⭐ Support

If you found this helpful, consider giving the repo a star ⭐!