import 'package:hive/hive.dart';
part 'book_entity.g.dart';

@HiveType(typeId: 0)
class BookEntity {
  @HiveField(0)
  final String bookId;
  @HiveField(1)
  final String? image;
  @HiveField(2)
  final String title;
  @HiveField(3)
  final String subTitle;
  @HiveField(4)
  final String? authorName;
  @HiveField(5)
  final num? price;
  @HiveField(6)
  final num? rating;
  @HiveField(7)
  final num? ratingCount;
  @HiveField(8)
  final String? previewLink;
  @HiveField(9)
  final String? category;

  BookEntity({
    required this.previewLink,
    required this.category,
    required this.bookId,
    required this.image,
    required this.title,
    required this.subTitle,
    required this.authorName,
    required this.price,
    required this.rating,
    required this.ratingCount,
  });
}
