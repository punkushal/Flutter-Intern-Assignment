# Flutter Intern Assinment For Recreating S.Rocks.Music Home UI

A modern music services app home UI built with Flutter that showcases various music production services with a sleek dark theme UI.

## 📱 Features

- **Beautiful UI**: Dark theme with gradient hero section
- **Dynamic Content**: Services loaded from Firebase Firestore
- **Responsive Design**: Works on all screen sizes
- **Navigation**: Tap any service card to navigate to details
- **State Management**: Uses Provider pattern
- **MVVM Architecture**: Clean code structure

## 🏗️ Architecture

```
Presentation Layer (Views & Widgets)
       ↓
ViewModel Layer (Business Logic)
       ↓
Repository Layer (Data Access)
       ↓
Firebase Firestore (Database)
```

## 🚀 Getting Started

### Prerequisites
- Flutter SDK (latest stable version)
- Firebase account
- Android Studio / VS Code


## 📁 Project Structure

```
lib/
├── main.dart                 # App entry point
├── core/                     # Core utilities & constants
│   ├── constants/           # Colors, strings, dimensions
├── data/                     # Data layer
│   ├── models/              # Data models
│   └── repositories/        # Data access logic
├── view/                    # UI layer
│   ├── screens/             # App screens
│   └── widgets/             # Screen-specific widgets
└── ├── view_models/         # Business logic
```

## 🔧 Key Technologies

- **Flutter**: Cross-platform mobile framework
- **Firebase Firestore**: Real-time database
- **Provider**: State management
- **MVVM Pattern**: Architecture pattern
