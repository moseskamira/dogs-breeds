import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../router/route_paths.dart';

class BreedWidget extends StatelessWidget {
  final String breed;

  const BreedWidget({super.key, required this.breed});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        context.push(RoutePath.imagesPage, extra: breed);
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(4),
          border: Border.all(width: 1, color: Colors.blueGrey),
        ),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              breed[0].toUpperCase() + breed.substring(1),
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ),
    );
  }
}
