import 'package:flutter/material.dart';

import '../../breedimages/breed_images_page.dart';

class BreedCard extends StatelessWidget {
  final String breed;
  const BreedCard({super.key, required this.breed});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      margin: const EdgeInsets.symmetric(vertical: 6),
      child: ListTile(
        title: Text(breed[0].toUpperCase() + breed.substring(1)),
        trailing: const Icon(Icons.arrow_forward_ios),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => BreedImagesPage(breedName: breed),
            ),
          );
        },
      ),
    );
  }
}
