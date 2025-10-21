import 'package:bookly_app/constants.dart';
import 'package:bookly_app/core/entities/book_entity.dart';
import 'package:hive_flutter/adapters.dart';

abstract class HomeLocalDataSource {
  List<BookEntity> fetchNewestBooks({int pageNumber = 0});
  List<BookEntity> fetchFeaturedBooks({int pageNumber = 0});
  List<BookEntity> fetchSimilarBooks({required String category, int pageNumber = 0});
}

class HomeLocalDataSourceImpl extends HomeLocalDataSource {
  @override
  List<BookEntity> fetchFeaturedBooks({int pageNumber = 0}) {
    var box = Hive.box<BookEntity>(kFeaturedBox);
    final allBooks = box.values.toList();

    const int booksPerPage = 10;
    final int start = pageNumber * booksPerPage;
    final int end = start + booksPerPage;

    if (start >= allBooks.length) {
      return [];
    }

    return allBooks.sublist(
      start,
      end > allBooks.length ? allBooks.length : end,
    );
  }

  @override
  List<BookEntity> fetchNewestBooks({int pageNumber = 0}) {
    var box = Hive.box<BookEntity>(kNewestBox);
    final allBooks = box.values.toList();

    const int booksPerPage = 10;
    final int start = pageNumber * booksPerPage;
    final int end = start + booksPerPage;

    if (start >= allBooks.length) {
      return [];
    }

    return allBooks.sublist(
      start,
      end > allBooks.length ? allBooks.length : end,
    );
  }

  @override
  List<BookEntity> fetchSimilarBooks({
    required String category,
    int pageNumber = 0,
  }) {
    var box = Hive.box<BookEntity>(kSimilarBox);
    final allBooks = box.values.toList();

    const int booksPerPage = 10;
    final int start = pageNumber * booksPerPage;
    final int end = start + booksPerPage;

    if (start >= allBooks.length) {
      return [];
    }

    return allBooks.sublist(
      start,
      end > allBooks.length ? allBooks.length : end,
    );
  }
}
