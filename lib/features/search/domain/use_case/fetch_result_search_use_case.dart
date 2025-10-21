import 'package:bookly_app/core/entities/book_entity.dart';
import 'package:bookly_app/core/errors/failure.dart';
import 'package:bookly_app/core/use_case/use_case.dart';
import 'package:bookly_app/features/search/domain/repos/search_repo.dart';
import 'package:dartz/dartz.dart';

class FetchResultSearchUseCase
    extends UseCase<List<BookEntity>, String, NoParam> {
  final SearchRepo searchRepo;

  FetchResultSearchUseCase({required this.searchRepo});
  @override
  Future<Either<Failure, List<BookEntity>>> call([
    String? search,
    NoParam? param2,
  ]) {
    return searchRepo.fetchResultSearch(search: search ?? '');
  }
}
