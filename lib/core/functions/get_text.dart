import 'package:bookly_app/features/home/domain/entities/book_entity.dart';

String getText(BookEntity bookEntity) {
    if (bookEntity.previewLink == null) {
      return 'Not available';
    } else {
      return 'Preview';
    }
  }