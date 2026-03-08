import 'package:dogs/presentation/widgets/image_widget.dart';
import 'package:dogs/shared/providers/app_data_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FavPage extends StatelessWidget {
  const FavPage({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<AppDataProvider>();
    final breedImages = provider.favImages;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Favourites'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: breedImages.isEmpty
            ? const Center(child: Text('No images available.'))
            : GridView.builder(
                itemCount: breedImages.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  mainAxisSpacing: 10,
                  crossAxisSpacing: 10,
                  childAspectRatio: 0.75,
                ),
                itemBuilder: (context, index) {
                  final imageUrl = breedImages[index];
                  return ImageWidget(imageUrl: imageUrl);
                },
              ),
      ),
    );
  }
}
