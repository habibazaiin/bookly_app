import 'package:bookly_app/constants.dart';
import 'package:bookly_app/core/entities/book_entity.dart';
import 'package:bookly_app/core/functions/save_box_data.dart';
import 'package:bookly_app/core/models/book_model/book_model.dart';
import 'package:bookly_app/core/utils/api_service.dart';

abstract class SearchRemoteDataSource {
  Future<List<BookEntity>> fetchResultSearch({required String search});
}

class SearchRemoteDataSourceImpl extends SearchRemoteDataSource {

  final ApiService apiService;

  SearchRemoteDataSourceImpl({required this.apiService});
  @override
  Future<List<BookEntity>> fetchResultSearch({required String search}) async {
    var data = await apiService.get(endPoint: 'volumes?Filtering=free-ebooks&Sorting=newest &q=$search');
    List<BookEntity> books = [];
    for (var item in data['item']) {
      books.add(BookModel.fromJson(item));
    }
    saveBooksData(books, kSearchBox);
    return books;
  }

} 
