# Dog Breeds App 🐶 - BLoC Demo

Implementing features on Dog Api using **BLoC architecture**.

---

# 📱 Features

* View a list of dog breeds
* Select a breed to view related images
* Like/unlike images (optional enhancement)
* View favorite images with breed filters
* Error handling for network failures
* State management using BLoC
* Clean and scalable project architecture
---

# 🛠️ Tech Stack

* **Framework:** Flutter
* **Language:** Dart
* **State Management:** BLoC

---

# 🚀 Getting Started

## Prerequisites

Make sure you have the following installed:

* Android Studio
* Flutter SDK

```console
Flutter version: 3.16.9
```

---

## Installation

### 1. Clone the repository

```console
git clone git@github.com:moseskamira/dogs-breeds.git
```

### 2. Navigate to the project

```console
cd dogs-breeds
```

### 3. Install dependencies

```console
flutter pub get
```

---

# ▶️ Running the Application

```console
flutter run
```

---

# ⚙️ Code Generation

Run build runner for generated files:

```console
dart pub run build_runner watch --delete-conflicting-outputs
```

---

# 🍎 Generate iOS Build Config Only

```console
flutter build ios --release --config-only
```

---

# 🧱 Project Architecture

```text
lib/
│
├── data/
│   ├── models/
│   ├── repositories/
│   └── networks/
│
├── presentation/
│   ├── bloc/
│   ├── pages/
│   └── widgets/
│
├── shared/
│   ├── widgets/
│   └── providers/
│
├── router/
│   ├── route_paths/
│   └── go_router.dart
│
├── my_app/
└── main.dart
```

---

# 📂 Architecture Overview

### Data

Contains:

* Models
* Repositories
* Networks for remote data calls

### Presentation

This contains the following

* UI (pages and widgets)
* State management
* Business logic

### Shared

Reusable widgets and global providers.

## API

- [Dog CEO API](https://dog.ceo/dog-api)
---

## BreedImages:

![Breed Images](/images/images.png)


## Breeds:

![Breeds](/images/breeds.png)


## Favourites:

![Breeds](/images/fav.png)


# 👨‍💻 Author

**Kamira Moses**

Flutter & Mobile Applications Developer
