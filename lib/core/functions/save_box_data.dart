import 'package:bookly_app/core/models/book_model/book_model.dart';
import 'package:hive/hive.dart';

void saveBooksData(List<BookModel> books, String boxName) {
    var box = Hive.box(boxName);
    box.addAll(books);
  }