import 'package:equatable/equatable.dart';

import 'doc.dart';

class BookModel extends Equatable {
  final int? numFound;
  final int? start;
  final bool? numFoundExact;
  final String? documentationUrl;
  final String? q;
  final dynamic offset;
  final List<Doc>? docs;

  const BookModel({
    this.numFound,
    this.start,
    this.numFoundExact,
    this.documentationUrl,
    this.q,
    this.offset,
    this.docs,
  });

  factory BookModel.fromJson(Map<String, dynamic> json) => BookModel(
    numFound: json['numFound'] as int?,
    start: json['start'] as int?,
    numFoundExact: json['numFoundExact'] as bool?,
    documentationUrl: json['documentation_url'] as String?,
    q: json['q'] as String?,
    offset: json['offset'] as dynamic,
    docs: (json['docs'] as List<dynamic>?)
        ?.map((e) => Doc.fromJson(e as Map<String, dynamic>))
        .toList(),
  );

  Map<String, dynamic> toJson() => {
    'numFound': numFound,
    'start': start,
    'numFoundExact': numFoundExact,
    'num_found': numFound,
    'documentation_url': documentationUrl,
    'q': q,
    'offset': offset,
    'docs': docs?.map((e) => e.toJson()).toList(),
  };

  @override
  List<Object?> get props {
    return [
      numFound,
      start,
      numFoundExact,
      numFound,
      documentationUrl,
      q,
      offset,
      docs,
    ];
  }
}
