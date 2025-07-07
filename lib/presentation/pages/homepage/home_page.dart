import 'package:dogs/presentation/bloc/dogs_bloc/breeds_cubit.dart';
import 'package:dogs/presentation/bloc/dogs_bloc/breeds_cubit_state.dart';
import 'package:dogs/presentation/pages/homepage/widgets/breed_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<String> breedKeys = [];

  @override
  void initState() {
    super.initState();
    context.read<BreedsCubit>().fetchDogBreeds();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
        centerTitle: true,
      ),
      body: BlocConsumer<BreedsCubit, BreedsCubitState>(
        listener: (context, state) {
          if (state is DBErrorState) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text("Failed to load breeds")),
            );
          }

          if (state is DBSuccessState) {
            if (state.message != null) {
              final json = state.message?.toJson() ?? {};
              setState(() {
                breedKeys = json.keys.toList()..sort();
              });
            }
          }
        },
        builder: (context, state) {
          if (state is DBLoginState) {
            return const Center(child: CircularProgressIndicator());
          }
          return ListView.builder(
            padding: const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 12,
            ),
            itemCount: breedKeys.length,
            itemBuilder: (context, index) {
              final breed = breedKeys[index];
              return BreedCard(breed: breed);
            },
          );
        },
      ),
    );
  }
}
