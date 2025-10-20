import 'package:bookly_app/core/errors/failure.dart';
import 'package:bookly_app/core/use_case/use_case.dart';
import 'package:bookly_app/features/home/domain/entities/book_entity.dart';
import 'package:bookly_app/features/home/domain/repos/home_repo.dart';
import 'package:dartz/dartz.dart';

class FetchSimilarBooksUseCase extends UseCase<List<BookEntity>, String, int> {
  final HomeRepo homeRepo;

  FetchSimilarBooksUseCase({required this.homeRepo});

  @override
  Future<Either<Failure, List<BookEntity>>> call([String? param, int pageNumber = 0]) {
    return homeRepo.fetchSimilarBooks(category: param ?? '');
  }
}
