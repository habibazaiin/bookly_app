import 'package:bookly_app/features/home/domain/entities/book_entity.dart';
import 'package:bookly_app/features/home/domain/use_case/fetch_similar_books_use_case.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'similar_books_state.dart';

class SimilarBooksCubit extends Cubit<SimilarBooksState> {
  SimilarBooksCubit(this.similarBooksUseCase) : super(SimilarBooksInitial());
  final FetchSimilarBooksUseCase similarBooksUseCase;

  Future<void> getSimilarBooks({required String category}) async {
    emit(SimilarBooksLoading());

    var result = await similarBooksUseCase.call(category);
    result.fold(
      (failure) {
        emit(SimilarBooksFailure(errMessage: failure.errMessage));
      },
      (books) {
        emit(SimilarBooksSuccess(books: books));
      },
    );
  }
}
