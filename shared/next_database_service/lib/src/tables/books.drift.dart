// ignore_for_file: type=lint
import 'package:drift/drift.dart' as i0;
import 'package:next_database_service/src/tables/books.drift.dart' as i1;
import 'package:next_database_service/src/enums/read_status.dart' as i2;
import 'package:next_database_service/src/tables/books.dart' as i3;
import 'package:drift/src/runtime/query_builder/query_builder.dart' as i4;
import 'package:next_database_service/src/type_converters/list_converter.dart'
    as i5;

class $BooksTable extends i3.Books with i0.TableInfo<$BooksTable, i1.Book> {
  @override
  final i0.GeneratedDatabase attachedDatabase;
  final String? _alias;
  $BooksTable(this.attachedDatabase, [this._alias]);
  static const i0.VerificationMeta _idMeta = const i0.VerificationMeta('id');
  @override
  late final i0.GeneratedColumn<int> id = i0.GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: i0.DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          i0.GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const i0.VerificationMeta _titleMeta =
      const i0.VerificationMeta('title');
  @override
  late final i0.GeneratedColumn<String> title = i0.GeneratedColumn<String>(
      'title', aliasedName, true,
      type: i0.DriftSqlType.string, requiredDuringInsert: false);
  static const i0.VerificationMeta _publishedDateMeta =
      const i0.VerificationMeta('publishedDate');
  @override
  late final i0.GeneratedColumn<DateTime> publishedDate =
      i0.GeneratedColumn<DateTime>('published_date', aliasedName, true,
          type: i0.DriftSqlType.dateTime, requiredDuringInsert: false);
  static const i0.VerificationMeta _descriptionMeta =
      const i0.VerificationMeta('description');
  @override
  late final i0.GeneratedColumn<String> description =
      i0.GeneratedColumn<String>('description', aliasedName, true,
          type: i0.DriftSqlType.string, requiredDuringInsert: false);
  static const i0.VerificationMeta _pageCountMeta =
      const i0.VerificationMeta('pageCount');
  @override
  late final i0.GeneratedColumn<int> pageCount = i0.GeneratedColumn<int>(
      'page_count', aliasedName, true,
      type: i0.DriftSqlType.int, requiredDuringInsert: false);
  static const i0.VerificationMeta _smallThumbnailMeta =
      const i0.VerificationMeta('smallThumbnail');
  @override
  late final i0.GeneratedColumn<String> smallThumbnail =
      i0.GeneratedColumn<String>('small_thumbnail', aliasedName, true,
          type: i0.DriftSqlType.string, requiredDuringInsert: false);
  static const i0.VerificationMeta _previewLinkMeta =
      const i0.VerificationMeta('previewLink');
  @override
  late final i0.GeneratedColumn<String> previewLink =
      i0.GeneratedColumn<String>('preview_link', aliasedName, true,
          type: i0.DriftSqlType.string, requiredDuringInsert: false);
  static const i0.VerificationMeta _languageMeta =
      const i0.VerificationMeta('language');
  @override
  late final i0.GeneratedColumn<String> language = i0.GeneratedColumn<String>(
      'language', aliasedName, true,
      type: i0.DriftSqlType.string, requiredDuringInsert: false);
  static const i0.VerificationMeta _authorsMeta =
      const i0.VerificationMeta('authors');
  @override
  late final i0.GeneratedColumnWithTypeConverter<List<String>?, String>
      authors = i0.GeneratedColumn<String>('authors', aliasedName, true,
              type: i0.DriftSqlType.string, requiredDuringInsert: false)
          .withConverter<List<String>?>(i1.$BooksTable.$converterauthorsn);
  static const i0.VerificationMeta _categoriesMeta =
      const i0.VerificationMeta('categories');
  @override
  late final i0.GeneratedColumnWithTypeConverter<List<String>?, String>
      categories = i0.GeneratedColumn<String>('categories', aliasedName, true,
              type: i0.DriftSqlType.string, requiredDuringInsert: false)
          .withConverter<List<String>?>(i1.$BooksTable.$convertercategoriesn);
  static const i0.VerificationMeta _readMeta =
      const i0.VerificationMeta('read');
  @override
  late final i0.GeneratedColumnWithTypeConverter<i2.ReadStatus, int> read =
      i0.GeneratedColumn<int>('read', aliasedName, false,
              type: i0.DriftSqlType.int,
              requiredDuringInsert: false,
              defaultValue: i4.Constant(i2.ReadStatus.notRead.index))
          .withConverter<i2.ReadStatus>(i1.$BooksTable.$converterread);
  static const i0.VerificationMeta _userRatingMeta =
      const i0.VerificationMeta('userRating');
  @override
  late final i0.GeneratedColumn<int> userRating = i0.GeneratedColumn<int>(
      'user_rating', aliasedName, true,
      type: i0.DriftSqlType.int, requiredDuringInsert: false);
  static const i0.VerificationMeta _collectionIdMeta =
      const i0.VerificationMeta('collectionId');
  @override
  late final i0.GeneratedColumn<int> collectionId = i0.GeneratedColumn<int>(
      'collection_id', aliasedName, false,
      type: i0.DriftSqlType.int,
      requiredDuringInsert: true,
      defaultConstraints: i0.GeneratedColumn.constraintIsAlways(
          'REFERENCES user_collections (id) ON DELETE CASCADE'));
  static const i0.VerificationMeta _createdAtMeta =
      const i0.VerificationMeta('createdAt');
  @override
  late final i0.GeneratedColumn<DateTime> createdAt =
      i0.GeneratedColumn<DateTime>('created_at', aliasedName, false,
          type: i0.DriftSqlType.dateTime,
          requiredDuringInsert: false,
          defaultValue: i4.currentDateAndTime);
  @override
  List<i0.GeneratedColumn> get $columns => [
        id,
        title,
        publishedDate,
        description,
        pageCount,
        smallThumbnail,
        previewLink,
        language,
        authors,
        categories,
        read,
        userRating,
        collectionId,
        createdAt
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'books';
  @override
  i0.VerificationContext validateIntegrity(i0.Insertable<i1.Book> instance,
      {bool isInserting = false}) {
    final context = i0.VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('title')) {
      context.handle(
          _titleMeta, title.isAcceptableOrUnknown(data['title']!, _titleMeta));
    }
    if (data.containsKey('published_date')) {
      context.handle(
          _publishedDateMeta,
          publishedDate.isAcceptableOrUnknown(
              data['published_date']!, _publishedDateMeta));
    }
    if (data.containsKey('description')) {
      context.handle(
          _descriptionMeta,
          description.isAcceptableOrUnknown(
              data['description']!, _descriptionMeta));
    }
    if (data.containsKey('page_count')) {
      context.handle(_pageCountMeta,
          pageCount.isAcceptableOrUnknown(data['page_count']!, _pageCountMeta));
    }
    if (data.containsKey('small_thumbnail')) {
      context.handle(
          _smallThumbnailMeta,
          smallThumbnail.isAcceptableOrUnknown(
              data['small_thumbnail']!, _smallThumbnailMeta));
    }
    if (data.containsKey('preview_link')) {
      context.handle(
          _previewLinkMeta,
          previewLink.isAcceptableOrUnknown(
              data['preview_link']!, _previewLinkMeta));
    }
    if (data.containsKey('language')) {
      context.handle(_languageMeta,
          language.isAcceptableOrUnknown(data['language']!, _languageMeta));
    }
    context.handle(_authorsMeta, const i0.VerificationResult.success());
    context.handle(_categoriesMeta, const i0.VerificationResult.success());
    context.handle(_readMeta, const i0.VerificationResult.success());
    if (data.containsKey('user_rating')) {
      context.handle(
          _userRatingMeta,
          userRating.isAcceptableOrUnknown(
              data['user_rating']!, _userRatingMeta));
    }
    if (data.containsKey('collection_id')) {
      context.handle(
          _collectionIdMeta,
          collectionId.isAcceptableOrUnknown(
              data['collection_id']!, _collectionIdMeta));
    } else if (isInserting) {
      context.missing(_collectionIdMeta);
    }
    if (data.containsKey('created_at')) {
      context.handle(_createdAtMeta,
          createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta));
    }
    return context;
  }

  @override
  Set<i0.GeneratedColumn> get $primaryKey => {id};
  @override
  i1.Book map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return i1.Book(
      id: attachedDatabase.typeMapping
          .read(i0.DriftSqlType.int, data['${effectivePrefix}id'])!,
      title: attachedDatabase.typeMapping
          .read(i0.DriftSqlType.string, data['${effectivePrefix}title']),
      publishedDate: attachedDatabase.typeMapping.read(
          i0.DriftSqlType.dateTime, data['${effectivePrefix}published_date']),
      description: attachedDatabase.typeMapping
          .read(i0.DriftSqlType.string, data['${effectivePrefix}description']),
      pageCount: attachedDatabase.typeMapping
          .read(i0.DriftSqlType.int, data['${effectivePrefix}page_count']),
      smallThumbnail: attachedDatabase.typeMapping.read(
          i0.DriftSqlType.string, data['${effectivePrefix}small_thumbnail']),
      previewLink: attachedDatabase.typeMapping
          .read(i0.DriftSqlType.string, data['${effectivePrefix}preview_link']),
      language: attachedDatabase.typeMapping
          .read(i0.DriftSqlType.string, data['${effectivePrefix}language']),
      authors: i1.$BooksTable.$converterauthorsn.fromSql(attachedDatabase
          .typeMapping
          .read(i0.DriftSqlType.string, data['${effectivePrefix}authors'])),
      categories: i1.$BooksTable.$convertercategoriesn.fromSql(attachedDatabase
          .typeMapping
          .read(i0.DriftSqlType.string, data['${effectivePrefix}categories'])),
      read: i1.$BooksTable.$converterread.fromSql(attachedDatabase.typeMapping
          .read(i0.DriftSqlType.int, data['${effectivePrefix}read'])!),
      userRating: attachedDatabase.typeMapping
          .read(i0.DriftSqlType.int, data['${effectivePrefix}user_rating']),
      collectionId: attachedDatabase.typeMapping
          .read(i0.DriftSqlType.int, data['${effectivePrefix}collection_id'])!,
      createdAt: attachedDatabase.typeMapping.read(
          i0.DriftSqlType.dateTime, data['${effectivePrefix}created_at'])!,
    );
  }

  @override
  $BooksTable createAlias(String alias) {
    return $BooksTable(attachedDatabase, alias);
  }

  static i0.TypeConverter<List<String>, String> $converterauthors =
      const i5.ListConverter();
  static i0.TypeConverter<List<String>?, String?> $converterauthorsn =
      i0.NullAwareTypeConverter.wrap($converterauthors);
  static i0.TypeConverter<List<String>, String> $convertercategories =
      const i5.ListConverter();
  static i0.TypeConverter<List<String>?, String?> $convertercategoriesn =
      i0.NullAwareTypeConverter.wrap($convertercategories);
  static i0.JsonTypeConverter2<i2.ReadStatus, int, int> $converterread =
      const i0.EnumIndexConverter<i2.ReadStatus>(i2.ReadStatus.values);
}

class Book extends i0.DataClass implements i0.Insertable<i1.Book> {
  final int id;
  final String? title;
  final DateTime? publishedDate;
  final String? description;
  final int? pageCount;
  final String? smallThumbnail;
  final String? previewLink;
  final String? language;
  final List<String>? authors;
  final List<String>? categories;
  final i2.ReadStatus read;
  final int? userRating;
  final int collectionId;
  final DateTime createdAt;
  const Book(
      {required this.id,
      this.title,
      this.publishedDate,
      this.description,
      this.pageCount,
      this.smallThumbnail,
      this.previewLink,
      this.language,
      this.authors,
      this.categories,
      required this.read,
      this.userRating,
      required this.collectionId,
      required this.createdAt});
  @override
  Map<String, i0.Expression> toColumns(bool nullToAbsent) {
    final map = <String, i0.Expression>{};
    map['id'] = i0.Variable<int>(id);
    if (!nullToAbsent || title != null) {
      map['title'] = i0.Variable<String>(title);
    }
    if (!nullToAbsent || publishedDate != null) {
      map['published_date'] = i0.Variable<DateTime>(publishedDate);
    }
    if (!nullToAbsent || description != null) {
      map['description'] = i0.Variable<String>(description);
    }
    if (!nullToAbsent || pageCount != null) {
      map['page_count'] = i0.Variable<int>(pageCount);
    }
    if (!nullToAbsent || smallThumbnail != null) {
      map['small_thumbnail'] = i0.Variable<String>(smallThumbnail);
    }
    if (!nullToAbsent || previewLink != null) {
      map['preview_link'] = i0.Variable<String>(previewLink);
    }
    if (!nullToAbsent || language != null) {
      map['language'] = i0.Variable<String>(language);
    }
    if (!nullToAbsent || authors != null) {
      map['authors'] =
          i0.Variable<String>(i1.$BooksTable.$converterauthorsn.toSql(authors));
    }
    if (!nullToAbsent || categories != null) {
      map['categories'] = i0.Variable<String>(
          i1.$BooksTable.$convertercategoriesn.toSql(categories));
    }
    {
      map['read'] = i0.Variable<int>(i1.$BooksTable.$converterread.toSql(read));
    }
    if (!nullToAbsent || userRating != null) {
      map['user_rating'] = i0.Variable<int>(userRating);
    }
    map['collection_id'] = i0.Variable<int>(collectionId);
    map['created_at'] = i0.Variable<DateTime>(createdAt);
    return map;
  }

  i1.BooksCompanion toCompanion(bool nullToAbsent) {
    return i1.BooksCompanion(
      id: i0.Value(id),
      title: title == null && nullToAbsent
          ? const i0.Value.absent()
          : i0.Value(title),
      publishedDate: publishedDate == null && nullToAbsent
          ? const i0.Value.absent()
          : i0.Value(publishedDate),
      description: description == null && nullToAbsent
          ? const i0.Value.absent()
          : i0.Value(description),
      pageCount: pageCount == null && nullToAbsent
          ? const i0.Value.absent()
          : i0.Value(pageCount),
      smallThumbnail: smallThumbnail == null && nullToAbsent
          ? const i0.Value.absent()
          : i0.Value(smallThumbnail),
      previewLink: previewLink == null && nullToAbsent
          ? const i0.Value.absent()
          : i0.Value(previewLink),
      language: language == null && nullToAbsent
          ? const i0.Value.absent()
          : i0.Value(language),
      authors: authors == null && nullToAbsent
          ? const i0.Value.absent()
          : i0.Value(authors),
      categories: categories == null && nullToAbsent
          ? const i0.Value.absent()
          : i0.Value(categories),
      read: i0.Value(read),
      userRating: userRating == null && nullToAbsent
          ? const i0.Value.absent()
          : i0.Value(userRating),
      collectionId: i0.Value(collectionId),
      createdAt: i0.Value(createdAt),
    );
  }

  factory Book.fromJson(Map<String, dynamic> json,
      {i0.ValueSerializer? serializer}) {
    serializer ??= i0.driftRuntimeOptions.defaultSerializer;
    return Book(
      id: serializer.fromJson<int>(json['id']),
      title: serializer.fromJson<String?>(json['title']),
      publishedDate: serializer.fromJson<DateTime?>(json['publishedDate']),
      description: serializer.fromJson<String?>(json['description']),
      pageCount: serializer.fromJson<int?>(json['pageCount']),
      smallThumbnail: serializer.fromJson<String?>(json['smallThumbnail']),
      previewLink: serializer.fromJson<String?>(json['previewLink']),
      language: serializer.fromJson<String?>(json['language']),
      authors: serializer.fromJson<List<String>?>(json['authors']),
      categories: serializer.fromJson<List<String>?>(json['categories']),
      read: i1.$BooksTable.$converterread
          .fromJson(serializer.fromJson<int>(json['read'])),
      userRating: serializer.fromJson<int?>(json['userRating']),
      collectionId: serializer.fromJson<int>(json['collectionId']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({i0.ValueSerializer? serializer}) {
    serializer ??= i0.driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'title': serializer.toJson<String?>(title),
      'publishedDate': serializer.toJson<DateTime?>(publishedDate),
      'description': serializer.toJson<String?>(description),
      'pageCount': serializer.toJson<int?>(pageCount),
      'smallThumbnail': serializer.toJson<String?>(smallThumbnail),
      'previewLink': serializer.toJson<String?>(previewLink),
      'language': serializer.toJson<String?>(language),
      'authors': serializer.toJson<List<String>?>(authors),
      'categories': serializer.toJson<List<String>?>(categories),
      'read':
          serializer.toJson<int>(i1.$BooksTable.$converterread.toJson(read)),
      'userRating': serializer.toJson<int?>(userRating),
      'collectionId': serializer.toJson<int>(collectionId),
      'createdAt': serializer.toJson<DateTime>(createdAt),
    };
  }

  i1.Book copyWith(
          {int? id,
          i0.Value<String?> title = const i0.Value.absent(),
          i0.Value<DateTime?> publishedDate = const i0.Value.absent(),
          i0.Value<String?> description = const i0.Value.absent(),
          i0.Value<int?> pageCount = const i0.Value.absent(),
          i0.Value<String?> smallThumbnail = const i0.Value.absent(),
          i0.Value<String?> previewLink = const i0.Value.absent(),
          i0.Value<String?> language = const i0.Value.absent(),
          i0.Value<List<String>?> authors = const i0.Value.absent(),
          i0.Value<List<String>?> categories = const i0.Value.absent(),
          i2.ReadStatus? read,
          i0.Value<int?> userRating = const i0.Value.absent(),
          int? collectionId,
          DateTime? createdAt}) =>
      i1.Book(
        id: id ?? this.id,
        title: title.present ? title.value : this.title,
        publishedDate:
            publishedDate.present ? publishedDate.value : this.publishedDate,
        description: description.present ? description.value : this.description,
        pageCount: pageCount.present ? pageCount.value : this.pageCount,
        smallThumbnail:
            smallThumbnail.present ? smallThumbnail.value : this.smallThumbnail,
        previewLink: previewLink.present ? previewLink.value : this.previewLink,
        language: language.present ? language.value : this.language,
        authors: authors.present ? authors.value : this.authors,
        categories: categories.present ? categories.value : this.categories,
        read: read ?? this.read,
        userRating: userRating.present ? userRating.value : this.userRating,
        collectionId: collectionId ?? this.collectionId,
        createdAt: createdAt ?? this.createdAt,
      );
  Book copyWithCompanion(i1.BooksCompanion data) {
    return Book(
      id: data.id.present ? data.id.value : this.id,
      title: data.title.present ? data.title.value : this.title,
      publishedDate: data.publishedDate.present
          ? data.publishedDate.value
          : this.publishedDate,
      description:
          data.description.present ? data.description.value : this.description,
      pageCount: data.pageCount.present ? data.pageCount.value : this.pageCount,
      smallThumbnail: data.smallThumbnail.present
          ? data.smallThumbnail.value
          : this.smallThumbnail,
      previewLink:
          data.previewLink.present ? data.previewLink.value : this.previewLink,
      language: data.language.present ? data.language.value : this.language,
      authors: data.authors.present ? data.authors.value : this.authors,
      categories:
          data.categories.present ? data.categories.value : this.categories,
      read: data.read.present ? data.read.value : this.read,
      userRating:
          data.userRating.present ? data.userRating.value : this.userRating,
      collectionId: data.collectionId.present
          ? data.collectionId.value
          : this.collectionId,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Book(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('publishedDate: $publishedDate, ')
          ..write('description: $description, ')
          ..write('pageCount: $pageCount, ')
          ..write('smallThumbnail: $smallThumbnail, ')
          ..write('previewLink: $previewLink, ')
          ..write('language: $language, ')
          ..write('authors: $authors, ')
          ..write('categories: $categories, ')
          ..write('read: $read, ')
          ..write('userRating: $userRating, ')
          ..write('collectionId: $collectionId, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      id,
      title,
      publishedDate,
      description,
      pageCount,
      smallThumbnail,
      previewLink,
      language,
      authors,
      categories,
      read,
      userRating,
      collectionId,
      createdAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is i1.Book &&
          other.id == this.id &&
          other.title == this.title &&
          other.publishedDate == this.publishedDate &&
          other.description == this.description &&
          other.pageCount == this.pageCount &&
          other.smallThumbnail == this.smallThumbnail &&
          other.previewLink == this.previewLink &&
          other.language == this.language &&
          other.authors == this.authors &&
          other.categories == this.categories &&
          other.read == this.read &&
          other.userRating == this.userRating &&
          other.collectionId == this.collectionId &&
          other.createdAt == this.createdAt);
}

class BooksCompanion extends i0.UpdateCompanion<i1.Book> {
  final i0.Value<int> id;
  final i0.Value<String?> title;
  final i0.Value<DateTime?> publishedDate;
  final i0.Value<String?> description;
  final i0.Value<int?> pageCount;
  final i0.Value<String?> smallThumbnail;
  final i0.Value<String?> previewLink;
  final i0.Value<String?> language;
  final i0.Value<List<String>?> authors;
  final i0.Value<List<String>?> categories;
  final i0.Value<i2.ReadStatus> read;
  final i0.Value<int?> userRating;
  final i0.Value<int> collectionId;
  final i0.Value<DateTime> createdAt;
  const BooksCompanion({
    this.id = const i0.Value.absent(),
    this.title = const i0.Value.absent(),
    this.publishedDate = const i0.Value.absent(),
    this.description = const i0.Value.absent(),
    this.pageCount = const i0.Value.absent(),
    this.smallThumbnail = const i0.Value.absent(),
    this.previewLink = const i0.Value.absent(),
    this.language = const i0.Value.absent(),
    this.authors = const i0.Value.absent(),
    this.categories = const i0.Value.absent(),
    this.read = const i0.Value.absent(),
    this.userRating = const i0.Value.absent(),
    this.collectionId = const i0.Value.absent(),
    this.createdAt = const i0.Value.absent(),
  });
  BooksCompanion.insert({
    this.id = const i0.Value.absent(),
    this.title = const i0.Value.absent(),
    this.publishedDate = const i0.Value.absent(),
    this.description = const i0.Value.absent(),
    this.pageCount = const i0.Value.absent(),
    this.smallThumbnail = const i0.Value.absent(),
    this.previewLink = const i0.Value.absent(),
    this.language = const i0.Value.absent(),
    this.authors = const i0.Value.absent(),
    this.categories = const i0.Value.absent(),
    this.read = const i0.Value.absent(),
    this.userRating = const i0.Value.absent(),
    required int collectionId,
    this.createdAt = const i0.Value.absent(),
  }) : collectionId = i0.Value(collectionId);
  static i0.Insertable<i1.Book> custom({
    i0.Expression<int>? id,
    i0.Expression<String>? title,
    i0.Expression<DateTime>? publishedDate,
    i0.Expression<String>? description,
    i0.Expression<int>? pageCount,
    i0.Expression<String>? smallThumbnail,
    i0.Expression<String>? previewLink,
    i0.Expression<String>? language,
    i0.Expression<String>? authors,
    i0.Expression<String>? categories,
    i0.Expression<int>? read,
    i0.Expression<int>? userRating,
    i0.Expression<int>? collectionId,
    i0.Expression<DateTime>? createdAt,
  }) {
    return i0.RawValuesInsertable({
      if (id != null) 'id': id,
      if (title != null) 'title': title,
      if (publishedDate != null) 'published_date': publishedDate,
      if (description != null) 'description': description,
      if (pageCount != null) 'page_count': pageCount,
      if (smallThumbnail != null) 'small_thumbnail': smallThumbnail,
      if (previewLink != null) 'preview_link': previewLink,
      if (language != null) 'language': language,
      if (authors != null) 'authors': authors,
      if (categories != null) 'categories': categories,
      if (read != null) 'read': read,
      if (userRating != null) 'user_rating': userRating,
      if (collectionId != null) 'collection_id': collectionId,
      if (createdAt != null) 'created_at': createdAt,
    });
  }

  i1.BooksCompanion copyWith(
      {i0.Value<int>? id,
      i0.Value<String?>? title,
      i0.Value<DateTime?>? publishedDate,
      i0.Value<String?>? description,
      i0.Value<int?>? pageCount,
      i0.Value<String?>? smallThumbnail,
      i0.Value<String?>? previewLink,
      i0.Value<String?>? language,
      i0.Value<List<String>?>? authors,
      i0.Value<List<String>?>? categories,
      i0.Value<i2.ReadStatus>? read,
      i0.Value<int?>? userRating,
      i0.Value<int>? collectionId,
      i0.Value<DateTime>? createdAt}) {
    return i1.BooksCompanion(
      id: id ?? this.id,
      title: title ?? this.title,
      publishedDate: publishedDate ?? this.publishedDate,
      description: description ?? this.description,
      pageCount: pageCount ?? this.pageCount,
      smallThumbnail: smallThumbnail ?? this.smallThumbnail,
      previewLink: previewLink ?? this.previewLink,
      language: language ?? this.language,
      authors: authors ?? this.authors,
      categories: categories ?? this.categories,
      read: read ?? this.read,
      userRating: userRating ?? this.userRating,
      collectionId: collectionId ?? this.collectionId,
      createdAt: createdAt ?? this.createdAt,
    );
  }

  @override
  Map<String, i0.Expression> toColumns(bool nullToAbsent) {
    final map = <String, i0.Expression>{};
    if (id.present) {
      map['id'] = i0.Variable<int>(id.value);
    }
    if (title.present) {
      map['title'] = i0.Variable<String>(title.value);
    }
    if (publishedDate.present) {
      map['published_date'] = i0.Variable<DateTime>(publishedDate.value);
    }
    if (description.present) {
      map['description'] = i0.Variable<String>(description.value);
    }
    if (pageCount.present) {
      map['page_count'] = i0.Variable<int>(pageCount.value);
    }
    if (smallThumbnail.present) {
      map['small_thumbnail'] = i0.Variable<String>(smallThumbnail.value);
    }
    if (previewLink.present) {
      map['preview_link'] = i0.Variable<String>(previewLink.value);
    }
    if (language.present) {
      map['language'] = i0.Variable<String>(language.value);
    }
    if (authors.present) {
      map['authors'] = i0.Variable<String>(
          i1.$BooksTable.$converterauthorsn.toSql(authors.value));
    }
    if (categories.present) {
      map['categories'] = i0.Variable<String>(
          i1.$BooksTable.$convertercategoriesn.toSql(categories.value));
    }
    if (read.present) {
      map['read'] =
          i0.Variable<int>(i1.$BooksTable.$converterread.toSql(read.value));
    }
    if (userRating.present) {
      map['user_rating'] = i0.Variable<int>(userRating.value);
    }
    if (collectionId.present) {
      map['collection_id'] = i0.Variable<int>(collectionId.value);
    }
    if (createdAt.present) {
      map['created_at'] = i0.Variable<DateTime>(createdAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('BooksCompanion(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('publishedDate: $publishedDate, ')
          ..write('description: $description, ')
          ..write('pageCount: $pageCount, ')
          ..write('smallThumbnail: $smallThumbnail, ')
          ..write('previewLink: $previewLink, ')
          ..write('language: $language, ')
          ..write('authors: $authors, ')
          ..write('categories: $categories, ')
          ..write('read: $read, ')
          ..write('userRating: $userRating, ')
          ..write('collectionId: $collectionId, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }
}
