import 'package:flutter/material.dart';

class AppDataProvider extends ChangeNotifier {
  final List<String> _favoriteImages = [];

  List<String> get favImages => _favoriteImages;

  void updateFavImages(String image, bool add) {
    if (add) {
      _favoriteImages.add(image);
    } else {
      _favoriteImages.remove(image);
    }
    notifyListeners();
  }

  void resetFavImages() {
    _favoriteImages.clear();
    notifyListeners();
  }
}
