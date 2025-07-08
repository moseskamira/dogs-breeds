import 'package:dogs/data/repositories/breeds_repository.dart';
import 'package:dogs/presentation/bloc/app_data_provider.dart';
import 'package:dogs/presentation/bloc/dogs_bloc/breeds_cubit.dart';
import 'package:dogs/presentation/routes/go_router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider(create: (_) => BreedsRepository()),
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => BreedsCubit(
              repository: context.read<BreedsRepository>(),
            ),
          ),
        ],
        child: ChangeNotifierProvider(
          create: (_) => AppDataProvider(),
          child: MaterialApp.router(
            title: 'Dog Breeds',
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
              useMaterial3: true,
            ),
            themeMode: ThemeMode.light,
            routerDelegate: appRouter.routerDelegate,
            routeInformationParser: appRouter.routeInformationParser,
            backButtonDispatcher: appRouter.backButtonDispatcher,
            routeInformationProvider: appRouter.routeInformationProvider,
          ),
        ),
      ),
    );
  }
}
