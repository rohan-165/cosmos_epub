// ignore_for_file: non_constant_identifier_names

import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class LocalChapterModel {
  String? Title;
  String? ContentFileName;
  String? Anchor;
  String? HtmlContent;
  bool? isSubChapters;

  LocalChapterModel({
    this.Title,
    this.ContentFileName,
    this.Anchor,
    this.HtmlContent,
    this.isSubChapters,
  });

  LocalChapterModel copyWith({
    String? Title,
    String? ContentFileName,
    String? Anchor,
    String? HtmlContent,
    bool? isSubChapters,
  }) {
    return LocalChapterModel(
      Title: Title ?? this.Title,
      ContentFileName: ContentFileName ?? this.ContentFileName,
      Anchor: Anchor ?? this.Anchor,
      HtmlContent: HtmlContent ?? this.HtmlContent,
      isSubChapters: isSubChapters ?? this.isSubChapters,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'Title': Title,
      'ContentFileName': ContentFileName,
      'Anchor': Anchor,
      'HtmlContent': HtmlContent,
      'isSubChapters': isSubChapters,
    };
  }

  factory LocalChapterModel.fromMap(Map<String, dynamic> map) {
    return LocalChapterModel(
      Title: map['Title'] != null ? map['Title'] as String : null,
      ContentFileName: map['ContentFileName'] != null
          ? map['ContentFileName'] as String
          : null,
      Anchor: map['Anchor'] != null ? map['Anchor'] as String : null,
      HtmlContent:
          map['HtmlContent'] != null ? map['HtmlContent'] as String : null,
      isSubChapters:
          map['isSubChapters'] != null ? map['isSubChapters'] as bool : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory LocalChapterModel.fromJson(String source) =>
      LocalChapterModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'LocalChapterModel(Title: $Title, ContentFileName: $ContentFileName, Anchor: $Anchor, HtmlContent: $HtmlContent, SubChapters: $isSubChapters)';
  }

  @override
  bool operator ==(covariant LocalChapterModel other) {
    if (identical(this, other)) return true;

    return other.Title == Title &&
        other.ContentFileName == ContentFileName &&
        other.Anchor == Anchor &&
        other.HtmlContent == HtmlContent &&
        other.isSubChapters == isSubChapters;
  }

  @override
  int get hashCode {
    return Title.hashCode ^
        ContentFileName.hashCode ^
        Anchor.hashCode ^
        HtmlContent.hashCode ^
        isSubChapters.hashCode;
  }
}
