import 'package:dio/dio.dart';

import '../network/response/network_response.dart';
import '../network/retrofit/api_client.dart';
import '../network/retrofit/api_service.dart';

class BreedsRepository {
  late ApiClient _apiClient;

  BreedsRepository() {
    _apiClient = ApiService().apiClient;
  }

  Future<NetworkResponse> makeRequest(
      Future<dynamic> Function() apiCall) async {
    try {
      final response = await apiCall();
      return NetworkResponse(true, data: response);
    } on DioException catch (dioError) {
      final statusCode = dioError.response?.statusCode;
      final data = dioError.response?.data;

      print("DioException status: $statusCode");
      print("DioException full response: $data");

      String message = _extractErrorMessage(data);

      return NetworkResponse(false, error: message);
    } catch (e, stackTrace) {
      print("Unexpected error: $e");
      print("Stack trace: $stackTrace");
      return NetworkResponse(false, error: "An unexpected error occurred.");
    }
  }

  String _extractErrorMessage(dynamic data) {
    if (data == null) return "No response from server.";

    if (data is Map<String, dynamic>) {
      return data['message'] ??
          data['error_description'] ??
          data['error'] ??
          data['errorMessage'] ??
          "Unknown error occurred.";
    }

    if (data is String) {
      final lines = data.split('\n');
      final usefulLine = lines.firstWhere(
        (line) =>
            line.toLowerCase().contains("value cannot be null") ||
            line.toLowerCase().contains("error"),
        orElse: () => '',
      );
      return usefulLine.isNotEmpty
          ? usefulLine.trim()
          : "Server returned an error.";
    }
    return "Unexpected error format.";
  }

  Future<NetworkResponse> fetchBreeds() async {
    return makeRequest(
      () => _apiClient.fetchBreeds(),
    );
  }
}
