# Dog Breeds App 🐶

A Flutter application showcasing a catalog of dog breeds with images fetched from the Dog CEO API.
This project demonstrates clean architecture, proper state management using `flutter_bloc`, and
robust UI design using best practices.

## Features

- ✅ View a list of dog breeds
- ✅ Select a breed to view related images
- ✅ Like/unlike images (optional enhancement)
- ✅ View favorite images with breed filters
- ✅ Error handling for network failures

## Architecture

- Clean Architecture (Data, Domain, Presentation layers)
- State Management: `flutter_bloc`
- Dependency Injection: `provider`
- Networking: `retrofit` + `dio`
- Caching: `cached_network_image`

## API

- [Dog CEO API](https://dog.ceo/dog-api)

## Getting Started

1. Clone the repo
2. cd into root directory
3. Run `flutter pub get`
4. Run `flutter run`

> ⚠️ Ensure all plugins are initialized properly before building (especially `path_provider`).

## BreedImages:

![Breed Images](/images/images.png)


## Breeds:

![Breeds](/images/breeds.png)
