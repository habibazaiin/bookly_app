import 'package:bookly_app/core/entities/book_entity.dart';

String getText(BookEntity bookEntity) {
    if (bookEntity.previewLink == null) {
      return 'Not available';
    } else {
      return 'Preview';
    }
  }