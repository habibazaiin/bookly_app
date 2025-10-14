import 'package:bookly_app/core/errors/failure.dart';
import 'package:bookly_app/core/models/book_model/book_model.dart';
import 'package:bookly_app/core/use_case/use_case.dart';
import 'package:bookly_app/features/home/domain/repos/home_repo.dart';
import 'package:dartz/dartz.dart';

class FetchSimilarBooksUseCase extends UseCase<List<BookModel>, String> {
  final HomeRepo homeRepo;

  FetchSimilarBooksUseCase({required this.homeRepo});

  @override
  Future<Either<Failure, List<BookModel>>> call([String? param]) {
    return homeRepo.fetchSimilarBooks(category: param ?? '');
  }
}
