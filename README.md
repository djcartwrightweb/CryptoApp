# Swiftful Thinking Crypto App

This repository is a SwiftUI-based cryptocurrency tracking app, a follow-along to the [Swiftful Thinking YouTube tutorial series](https://www.youtube.com/@SwiftfulThinking). It allows users to track cryptocurrency prices, view detailed statistics, and manage their portfolio holdings in a sleek, modern interface.

## Features
- Real-time cryptocurrency price tracking.
- Interactive charts for visualizing price trends.
- Portfolio management to track your holdings.
- Dark and light mode support.
- Clean and responsive UI built with SwiftUI.

## Requirements
- **Xcode 14+**
- **iOS 15+**
- Basic understanding of SwiftUI and Combine.

## Tools and Frameworks
- SwiftUI for building the user interface.
- Combine for reactive programming and data handling.
- URLSession for network requests to fetch cryptocurrency data.
- Codable for parsing JSON data.
- CoreData or other persistence solutions for saving user data (optional).

## Steps to Complete the App
1. **Set Up Networking**: Use `URLSession` or Combine's `dataTaskPublisher` to fetch cryptocurrency data from a public API like [CoinGecko](https://www.coingecko.com/en/api) or a similar service.
2. **Model Data**: Define models conforming to `Codable` to parse API responses (e.g., `CoinModel` and `PostModel2`).
3. **Build the Views**: Create views using SwiftUI for:
   - A home screen displaying the list of coins.
   - A detail screen for individual coin stats and charts.
   - A portfolio management view.
4. **Manage State**: Use `@State`, `@StateObject`, or `@EnvironmentObject` to handle app-wide data, such as user portfolio and API responses.
5. **Handle Persistence**: Save user portfolio data locally using `CoreData` or `UserDefaults`.
6. **Add Charts**: Integrate SwiftUI Charts (iOS 16+) or a third-party library for price trend visualization.
7. **Polish with Animations**: Add SwiftUI animations for a smoother user experience.

## Resources
- [Swiftful Thinking YouTube Channel](https://www.youtube.com/@SwiftfulThinking)
- [Apple Developer Documentation](https://developer.apple.com/documentation)
- [CoinGecko API Documentation](https://www.coingecko.com/en/api)
- [Swift.org](https://swift.org/documentation/)

---

