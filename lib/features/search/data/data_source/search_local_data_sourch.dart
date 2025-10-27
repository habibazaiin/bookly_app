import 'package:bookly_app/constants.dart';
import 'package:bookly_app/core/entities/book_entity.dart';
import 'package:hive_flutter/hive_flutter.dart';

abstract class SearchLocalDataSource {
  List<BookEntity> fetchResultSearch({required String search});
}

class SearchLocalDataSourchImpl extends SearchLocalDataSource {
  @override
  List<BookEntity> fetchResultSearch({required String search}) {
    var box = Hive.box<BookEntity>(kSearchBox);
    return box.values.toList();
  }
}
