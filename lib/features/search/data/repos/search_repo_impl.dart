import 'package:bookly_app/core/entities/book_entity.dart';
import 'package:bookly_app/core/errors/failure.dart';
import 'package:bookly_app/core/utils/api_service.dart';
import 'package:bookly_app/core/models/book_model/book_model.dart';
import 'package:bookly_app/features/search/data/data_source/search_local_data_sourch.dart';
import 'package:bookly_app/features/search/data/data_source/search_remote_data_source.dart';
import 'package:bookly_app/features/search/domain/repos/search_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class SearchRepoImpl extends SearchRepo {
  final SearchLocalDataSource searchLocalDataSource;
  final SearchRemoteDataSource searchRemoteDataSource;

  SearchRepoImpl({
    required this.searchLocalDataSource,
    required this.searchRemoteDataSource,
  });
  @override
  Future<Either<Failure, List<BookEntity>>> fetchResultSearch({
    required String search,
  }) async {
    try {
      List<BookEntity> books;
      books = searchLocalDataSource.fetchResultSearch(search: search);
      if (books.isNotEmpty) {
        return right(books);
      }
      books = await searchRemoteDataSource.fetchResultSearch(search: search);
      return right(books);
    } on Exception catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }
}
