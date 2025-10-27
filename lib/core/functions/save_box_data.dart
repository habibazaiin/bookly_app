import 'package:bookly_app/core/models/book_model/book_model.dart';
import 'package:bookly_app/core/entities/book_entity.dart';
import 'package:hive/hive.dart';

void saveBooksData(List<BookEntity> books, String boxName) {
    var box = Hive.box<BookEntity>(boxName);
    box.addAll(books);
  }