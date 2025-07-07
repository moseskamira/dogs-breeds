import 'package:dogs/data/models/breeds_response_message.dart';
import 'package:dogs/data/network/response/breeds_response.dart';
import 'package:dogs/data/repositories/breeds_repository.dart';
import 'package:dogs/presentation/bloc/dogs_bloc/breeds_cubit_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BreedsCubit extends Cubit<BreedsCubitState> {
  final BreedsRepository repository;

  BreedsCubit({required this.repository}) : super(InitialState());

  void fetchDogBreeds() async {
    emit(DBLoginState());
    var response = await repository.fetchBreeds();
    if (response.success) {
      final dynamicResp = response.data;
      BreedsResponse breedsResponse = BreedsResponse.fromJson(dynamicResp);
      BreedsResponseMessage? responseMessage = breedsResponse.message;

      emit(DBSuccessState(message: responseMessage));
    } else {
      emit(DBErrorState(message: response.error));
    }
  }
}
