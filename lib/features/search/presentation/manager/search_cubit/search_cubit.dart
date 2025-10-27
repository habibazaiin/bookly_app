import 'package:bloc/bloc.dart';
import 'package:bookly_app/core/entities/book_entity.dart';
import 'package:bookly_app/core/errors/failure.dart';
import 'package:bookly_app/core/models/book_model/book_model.dart';
import 'package:bookly_app/core/use_case/use_case.dart';
import 'package:bookly_app/features/home/domain/repos/home_repo.dart';
import 'package:bookly_app/features/search/domain/use_case/fetch_result_search_use_case.dart';

import 'package:equatable/equatable.dart';

part 'search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  SearchCubit(this.fetchResultSearchUseCase) : super(SearchInitial());
  final FetchResultSearchUseCase fetchResultSearchUseCase;

  Future<void> getResultSearch({required String search}) async {
    emit(SearchLoading());
    var result = await fetchResultSearchUseCase.call(search, NoParam());
    result.fold(
      (failure) {
        emit(SearchFailure(errMessage: failure.errMessage));
      },
      (books) {
        emit(SearchSuccess(books: books));
      },
    );
  }
}
