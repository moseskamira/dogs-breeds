import 'package:dogs/data/models/breeds_response_message.dart';
import 'package:dogs/presentation/bloc/dogs_bloc/breeds_cubit.dart';
import 'package:dogs/presentation/bloc/dogs_bloc/breeds_cubit_state.dart';
import 'package:dogs/presentation/pages/breedimages/widgets/image_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BreedImagesPage extends StatefulWidget {
  final String breedName;

  const BreedImagesPage({
    super.key,
    required this.breedName,
  });

  @override
  State<BreedImagesPage> createState() => _BreedImagesPageState();
}

class _BreedImagesPageState extends State<BreedImagesPage> {
  BreedsResponseMessage? responseMessage;
  List<String> breedImages = [];

  String? selectedBreed;

  @override
  void initState() {
    super.initState();
    initializeValues();
  }

  void initializeValues() {
    selectedBreed = widget.breedName;
    if (selectedBreed == null) return;
    context.read<BreedsCubit>().fetchBreedImages(selectedBreed!);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Breed Images'),
        centerTitle: true,
      ),
      body: BlocConsumer<BreedsCubit, BreedsCubitState>(
        listener: (context, state) {
          if (state is GBIErrorState) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text("Failed to load breed images")),
            );
          }

          if (state is GBISuccessState) {
            setState(() {
              breedImages = state.response.message ?? [];
            });
          }
        },
        builder: (context, state) {
          if (state is GBILoginState) {
            return const Center(child: CircularProgressIndicator());
          }

          return Padding(
            padding: const EdgeInsets.all(12.0),
            child: breedImages.isEmpty
                ? const Center(child: Text('No images available.'))
                : GridView.builder(
                    itemCount: breedImages.length,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
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
          );
        },
      ),
    );
  }
}
