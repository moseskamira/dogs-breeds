import 'package:cached_network_image/cached_network_image.dart';
import 'package:dogs/data/models/breeds_response_message.dart';
import 'package:dogs/presentation/bloc/dogs_bloc/breeds_cubit.dart';
import 'package:dogs/presentation/bloc/dogs_bloc/breeds_cubit_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  BreedsResponseMessage? responseMessage;
  List<String> breedImages = [];
  List<String> breedKeys = [];
  String? selectedBreed;

  @override
  void initState() {
    super.initState();
    context.read<BreedsCubit>().fetchDogBreeds();
  }

  void _onBreedChanged(String? breed) {
    if (breed == null) return;
    setState(() {
      selectedBreed = breed;
      breedImages.clear();
    });
    context.read<BreedsCubit>().fetchBreedImages(breed);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: BlocConsumer<BreedsCubit, BreedsCubitState>(
        listener: (context, state) {
          if (state is DBErrorState) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text("Failed to load breeds")),
            );
          }

          if (state is DBSuccessState) {
            responseMessage = state.message;

            // Convert JSON keys to a dropdown list
            final json = responseMessage?.toJson() ?? {};
            breedKeys = json.keys.toList()..sort();

            // Automatically fetch images for the first breed
            if (breedKeys.isNotEmpty) {
              selectedBreed = breedKeys.first;
              context.read<BreedsCubit>().fetchBreedImages(selectedBreed!);
            }
          }

          if (state is GBISuccessState) {
            setState(() {
              breedImages = state.response.message ?? [];
            });
          }
        },
        builder: (context, state) {
          if (state is DBLoginState) {
            return const Center(child: CircularProgressIndicator());
          }

          return Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              children: [
                DropdownButton<String>(
                  value: selectedBreed,
                  isExpanded: true,
                  hint: const Text("Select Dog Breed"),
                  items: breedKeys.map((String breed) {
                    return DropdownMenuItem<String>(
                      value: breed,
                      child: Text(breed),
                    );
                  }).toList(),
                  onChanged: _onBreedChanged,
                ),
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
