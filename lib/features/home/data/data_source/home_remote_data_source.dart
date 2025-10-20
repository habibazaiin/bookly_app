import 'package:bookly_app/constants.dart';
import 'package:bookly_app/core/functions/save_box_data.dart';
import 'package:bookly_app/core/models/book_model/book_model.dart';
import 'package:bookly_app/core/utils/api_service.dart';
import 'package:bookly_app/features/home/domain/entities/book_entity.dart';

abstract class HomeRemoteDataSource {
  Future<List<BookEntity>> fetchNewestBooks({int pageNumber = 0});
  Future<List<BookEntity>> fetchFeaturedBooks({int pageNumber = 0});
  Future<List<BookEntity>> fetchSimilarBooks({required String category, int pageNumber = 0});
}

class HomeRemoteDataSourceImpl extends HomeRemoteDataSource {
  final ApiService apiService;

  HomeRemoteDataSourceImpl({required this.apiService});
  @override
  Future<List<BookEntity>> fetchFeaturedBooks({int pageNumber = 0}) async {
    var data = await apiService.get(
      endPoint:
          'volumes?Filtering=free-ebooks&Sorting=relevance &q=subject:Programming&startIndex=${pageNumber * 10}',
    );

    List<BookModel> books = [];

    for (var item in data['items']) {
      books.add(BookModel.fromJson(item));
    }
    saveBooksData(books, kFeaturedBox);
    return books;
  }

  @override
  Future<List<BookEntity>> fetchNewestBooks({int pageNumber = 0}) async {
    var data = await apiService.get(
      endPoint:
          'volumes?Filtering=free-ebooks&Sorting=newest &q=computer science&startIndex=${pageNumber * 10}',
    );

    List<BookModel> books = [];

    for (var item in data['items']) {
      books.add(BookModel.fromJson(item));
    }
    saveBooksData(books, kNewestBox);
    return books;
  }

  @override
  Future<List<BookEntity>> fetchSimilarBooks({required String category, int pageNumber = 0}) async {
    var data = await apiService.get(
      endPoint:
          'volumes?Filtering=free-ebooks&Sorting=relevance &q=subject:$category&startIndex=${pageNumber * 10}',
    );
    List<BookModel> books = [];
    for (var item in data['items']) {
      books.add(BookModel.fromJson(item));
    }
    saveBooksData(books, kSimilarBox);
    return books;
  }
}
