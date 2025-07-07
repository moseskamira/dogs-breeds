import 'package:dio/dio.dart';

import 'api_client.dart';

class ApiService {
  static final ApiService _instance = ApiService._internal();
  late final Dio dio;
  late final ApiClient apiClient;

  factory ApiService() {
    return _instance;
  }

  ApiService._internal() {
    dio = Dio();
    apiClient = ApiClient(dio);
  }
}
