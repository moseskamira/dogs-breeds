import 'package:equatable/equatable.dart';

import '../../../data/models/breeds_response_message.dart';
import '../../../data/network/response/breed_images_response.dart';

abstract class BreedsCubitState extends Equatable {
  const BreedsCubitState();
}

class InitialState extends BreedsCubitState {
  @override
  List<Object> get props => [];
}

class DBLoginState extends BreedsCubitState {
  @override
  List<Object> get props => [];
}

class GBILoginState extends BreedsCubitState {
  @override
  List<Object> get props => [];
}

class DBSuccessState extends BreedsCubitState {
  final BreedsResponseMessage? message;

  const DBSuccessState({required this.message});

  @override
  List<Object> get props => [];
}

class GBISuccessState extends BreedsCubitState {
  final BreedImagesResponse response;

  const GBISuccessState({required this.response});

  @override
  List<Object> get props => [];
}

class DBErrorState extends BreedsCubitState {
  final String? message;

  const DBErrorState({this.message});

  @override
  List<Object> get props => [];
}

class GBIErrorState extends BreedsCubitState {
  final String? message;

  const GBIErrorState({this.message});

  @override
  List<Object> get props => [];
}
