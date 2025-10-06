import 'package:equatable/equatable.dart';

class Doc extends Equatable {
  final List<String>? authorKey;
  final List<String>? authorName;
  final String? coverEditionKey;
  final int? coverI;
  final String? ebookAccess;
  final int? editionCount;
  final int? firstPublishYear;
  final bool? hasFulltext;
  final List<String>? ia;
  final String? iaCollectionS;
  final String? key;
  final List<String>? language;
  final String? lendingEditionS;
  final String? lendingIdentifierS;
  final bool? publicScanB;
  final String? title;
  final List<String>? idStandardEbooks;
  final String? subtitle;

  const Doc({
    this.authorKey,
    this.authorName,
    this.coverEditionKey,
    this.coverI,
    this.ebookAccess,
    this.editionCount,
    this.firstPublishYear,
    this.hasFulltext,
    this.ia,
    this.iaCollectionS,
    this.key,
    this.language,
    this.lendingEditionS,
    this.lendingIdentifierS,
    this.publicScanB,
    this.title,
    this.idStandardEbooks,
    this.subtitle,
  });

  factory Doc.fromJson(Map<String, dynamic> json) => Doc(
    authorKey: json['author_key'] as List<String>?,
    authorName: json['author_name'] as List<String>?,
    coverEditionKey: json['cover_edition_key'] as String?,
    coverI: json['cover_i'] as int?,
    ebookAccess: json['ebook_access'] as String?,
    editionCount: json['edition_count'] as int?,
    firstPublishYear: json['first_publish_year'] as int?,
    hasFulltext: json['has_fulltext'] as bool?,
    ia: json['ia'] as List<String>?,
    iaCollectionS: json['ia_collection_s'] as String?,
    key: json['key'] as String?,
    language: json['language'] as List<String>?,
    lendingEditionS: json['lending_edition_s'] as String?,
    lendingIdentifierS: json['lending_identifier_s'] as String?,
    publicScanB: json['public_scan_b'] as bool?,
    title: json['title'] as String?,
    idStandardEbooks: json['id_standard_ebooks'] as List<String>?,
    subtitle: json['subtitle'] as String?,
  );

  Map<String, dynamic> toJson() => {
    'author_key': authorKey,
    'author_name': authorName,
    'cover_edition_key': coverEditionKey,
    'cover_i': coverI,
    'ebook_access': ebookAccess,
    'edition_count': editionCount,
    'first_publish_year': firstPublishYear,
    'has_fulltext': hasFulltext,
    'ia': ia,
    'ia_collection_s': iaCollectionS,
    'key': key,
    'language': language,
    'lending_edition_s': lendingEditionS,
    'lending_identifier_s': lendingIdentifierS,
    'public_scan_b': publicScanB,
    'title': title,
    'id_standard_ebooks': idStandardEbooks,
    'subtitle': subtitle,
  };

  @override
  List<Object?> get props {
    return [
      authorKey,
      authorName,
      coverEditionKey,
      coverI,
      ebookAccess,
      editionCount,
      firstPublishYear,
      hasFulltext,
      ia,
      iaCollectionS,
      key,
      language,
      lendingEditionS,
      lendingIdentifierS,
      publicScanB,
      title,
      idStandardEbooks,
      subtitle,
    ];
  }
}
