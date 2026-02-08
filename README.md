# Weather BLoC 🌦️

A modern, high-performance weather application built with Flutter using the **BLoC (Business Logic Component)** pattern. This app provides real-time weather updates and forecasts with a sleek, responsive UI and support for both Light and Dark modes.

## 🚀 Features

- **Real-time Weather:** Get current weather conditions for any city.
- **5-Day Forecast:** Detailed weather predictions for the upcoming days.
- **Search Functionality:** Search for weather data by city name.
- **Theme Switching:** Seamless transition between Light and Dark modes.
- **Smooth Animations:** Enhanced user experience with `flutter_animate`.
- **Responsive Design:** Optimized for various screen sizes using Material 3.
- **Clean Architecture:** Separated layers for data, logic, and UI.

## 🛠️ Tech Stack

- **Framework:** [Flutter](https://flutter.dev/)
- **State Management:** [flutter_bloc](https://pub.dev/packages/flutter_bloc)
- **Networking:** [Dio](https://pub.dev/packages/dio)
- **Navigation:** [GoRouter](https://pub.dev/packages/go_router)
- **API:** [OpenWeatherMap API](https://openweathermap.org/api)
- **Animations:** [Flutter Animate](https://pub.dev/packages/flutter_animate)
- **Icons:** [FontAwesome Flutter](https://pub.dev/packages/font_awesome_flutter)
- **Font:** Poppins

## 📂 Project Structure

```text
lib/
├── data/
│   ├── repository/     # Data fetching logic (Dio)
│   └── secrets/        # API Keys and sensitive data
├── provider/           # Global State Management (Theme)
├── router/             # GoRouter Configuration
└── screens/
    ├── splash_screen/  # Initial loading screen
    └── weather/        # Main weather dashboard
        ├── bloc/       # Weather-specific business logic
        ├── model/      # Data models
        └── widgets/    # UI components
```

## ⚙️ Setup Instructions

### Prerequisites

- Flutter SDK installed (v3.8.1 or higher)
- A valid OpenWeatherMap API Key

### Installation

1.  **Clone the repository:**
    ```bash
    git clone https://github.com/your-username/weather_bloc.git
    cd weather_bloc
    ```

2.  **Install dependencies:**
    ```bash
    flutter pub get
    ```

3.  **Configure API Key:**
    Navigate to `lib/data/secrets/secrets.dart` and add your OpenWeatherMap API key:
    ```dart
    const String openWeatherAPIKey = 'YOUR_API_KEY_HERE';
    ```

4.  **Run the app:**
    ```bash
    flutter run
    ```

## 📸 Screenshots

| Splash Screen | Weather (Light) | Weather (Dark) |
| :---: | :---: | :---: |
| ![Splash](https://via.placeholder.com/200x400?text=Splash+Screen) | ![Light Mode](https://via.placeholder.com/200x400?text=Light+Mode) | ![Dark Mode](https://via.placeholder.com/200x400?text=Dark+Mode) |

*(Note: Replace placeholders with actual screenshots after pushing to GitHub)*

## 🤝 Contributing

Contributions are welcome! Please feel free to submit a Pull Request.

## 📄 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

---
Built with ❤️ by [Arpan Dutta](https://github.com/ArpanDutta)