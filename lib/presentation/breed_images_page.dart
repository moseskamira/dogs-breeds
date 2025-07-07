import 'package:cached_network_image/cached_network_image.dart';
import 'package:dogs/data/models/breeds_response_message.dart';
import 'package:dogs/presentation/bloc/dogs_bloc/breeds_cubit.dart';
import 'package:dogs/presentation/bloc/dogs_bloc/breeds_cubit_state.dart';
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
        title: Text('Breed Images'),
        centerTitle: true,
      ),
      body: BlocConsumer<BreedsCubit, BreedsCubitState>(
        listener: (context, state) {
          if (state is GBIErrorState) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text("Failed to load breeds")),
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
            child: Column(
              children: [
                const SizedBox(height: 10),
                breedImages.isEmpty
                    ? const Expanded(
                        child: Center(child: Text('No images available.')),
                      )
                    : Expanded(
                        child: ListView.builder(
                          itemCount: breedImages.length,
                          itemBuilder: (context, index) {
                            final imageUrl = breedImages[index];
                            return Padding(
                              padding:
                                  const EdgeInsets.symmetric(vertical: 8.0),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(12),
                                child: CachedNetworkImage(
                                  imageUrl: imageUrl,
                                  placeholder: (context, url) => const Center(
                                    child: CircularProgressIndicator(),
                                  ),
                                  errorWidget: (context, url, error) =>
                                      const Icon(Icons.error),
                                  fit: BoxFit.cover,
                                  height: 200,
                                  width: double.infinity,
                                ),
                              ),
                            );
                          },
                        ),
                      ),
              ],
            ),
          );
        },
      ),
    );
  }
}
