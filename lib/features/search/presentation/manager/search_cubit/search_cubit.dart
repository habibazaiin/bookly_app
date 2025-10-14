import 'package:bloc/bloc.dart';
import 'package:bookly_app/core/errors/failure.dart';
import 'package:bookly_app/core/models/book_model/book_model.dart';
import 'package:bookly_app/features/home/domain/repos/home_repo.dart';
import 'package:bookly_app/features/search/data/repos/search_repo.dart';
import 'package:equatable/equatable.dart';

part 'search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  SearchCubit(this.searchRepo) : super(SearchInitial());
  final SearchRepo searchRepo;

  Future<void> getResultSearch({required String search}) async {
    emit(SearchLoading());
    var result = await searchRepo.fetchResultSearch(search: search);
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
