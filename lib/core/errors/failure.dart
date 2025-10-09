import 'package:dio/dio.dart';

abstract class Failure {
  final String errMessage;
  Failure(this.errMessage);
}

class ServerFailure extends Failure {
  ServerFailure(super.errMessage);

  factory ServerFailure.fromDioError(DioException dioException) {
    switch (dioException.type) {
      case DioExceptionType.connectionTimeout:
        return ServerFailure('Connection timeout with API server.');

      case DioExceptionType.sendTimeout:
        return ServerFailure('Send timeout with API server.');

      case DioExceptionType.receiveTimeout:
        return ServerFailure('Receive timeout with API server.');

      case DioExceptionType.badCertificate:
        return ServerFailure('Bad certificate from API server.');

      case DioExceptionType.badResponse:
        // 👇 Handle status codes
        return ServerFailure.fromResponse(
          dioException.response?.statusCode,
          dioException.response?.data,
        );

      case DioExceptionType.cancel:
        return ServerFailure('Request to API server was cancelled.');

      case DioExceptionType.connectionError:
        return ServerFailure('No internet connection or connection error.');

      case DioExceptionType.unknown:
        return ServerFailure('Unexpected error, please try again later.');
    }
  }

  // 👇 Handle HTTP response status codes
  factory ServerFailure.fromResponse(int? statusCode, dynamic response) {
    if (statusCode == null) {
      return ServerFailure('Unknown error occurred.');
    }

    switch (statusCode) {
      case 400:
        return ServerFailure('Bad request. Please check your input.');
      case 401:
        return ServerFailure('Unauthorized. Please check your credentials.');
      case 403:
        return ServerFailure(
          'Forbidden. You don’t have access to this resource.',
        );
      case 404:
        return ServerFailure('Resource not found. Please try again later.');
      case 500:
        return ServerFailure('Internal server error. Please try again later.');
      default:
        return ServerFailure(
          'Oops! Error [$statusCode]: ${response?['error'] ?? 'Something went wrong.'}',
        );
    }
  }
}
