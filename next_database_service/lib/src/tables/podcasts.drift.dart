// ignore_for_file: type=lint
import 'package:drift/drift.dart' as i0;
import 'package:next_database_service/src/tables/podcasts.drift.dart' as i1;
import 'package:next_database_service/src/enums/listen_status.dart' as i2;
import 'package:next_database_service/dtos/genre_dto.dart' as i3;
import 'package:next_database_service/src/tables/podcasts.dart' as i4;
import 'package:next_database_service/src/type_converters/genres_converter.dart'
    as i5;

class $PodcastsTable extends i4.Podcasts
    with i0.TableInfo<$PodcastsTable, i1.Podcast> {
  @override
  final i0.GeneratedDatabase attachedDatabase;
  final String? _alias;
  $PodcastsTable(this.attachedDatabase, [this._alias]);
  static const i0.VerificationMeta _idMeta = const i0.VerificationMeta('id');
  @override
  late final i0.GeneratedColumn<int> id = i0.GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: i0.DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          i0.GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const i0.VerificationMeta _artworkUrl60Meta =
      const i0.VerificationMeta('artworkUrl60');
  @override
  late final i0.GeneratedColumn<String> artworkUrl60 =
      i0.GeneratedColumn<String>('artwork_url60', aliasedName, true,
          type: i0.DriftSqlType.string, requiredDuringInsert: false);
  static const i0.VerificationMeta _trackNameMeta =
      const i0.VerificationMeta('trackName');
  @override
  late final i0.GeneratedColumn<String> trackName = i0.GeneratedColumn<String>(
      'track_name', aliasedName, true,
      type: i0.DriftSqlType.string, requiredDuringInsert: false);
  static const i0.VerificationMeta _descriptionMeta =
      const i0.VerificationMeta('description');
  @override
  late final i0.GeneratedColumn<String> description =
      i0.GeneratedColumn<String>('description', aliasedName, true,
          type: i0.DriftSqlType.string, requiredDuringInsert: false);
  static const i0.VerificationMeta _releaseDateMeta =
      const i0.VerificationMeta('releaseDate');
  @override
  late final i0.GeneratedColumn<DateTime> releaseDate =
      i0.GeneratedColumn<DateTime>('release_date', aliasedName, true,
          type: i0.DriftSqlType.dateTime, requiredDuringInsert: false);
  static const i0.VerificationMeta _collectionViewUrlMeta =
      const i0.VerificationMeta('collectionViewUrl');
  @override
  late final i0.GeneratedColumn<String> collectionViewUrl =
      i0.GeneratedColumn<String>('collection_view_url', aliasedName, true,
          type: i0.DriftSqlType.string, requiredDuringInsert: false);
  static const i0.VerificationMeta _trackViewUrlMeta =
      const i0.VerificationMeta('trackViewUrl');
  @override
  late final i0.GeneratedColumn<String> trackViewUrl =
      i0.GeneratedColumn<String>('track_view_url', aliasedName, true,
          type: i0.DriftSqlType.string, requiredDuringInsert: false);
  static const i0.VerificationMeta _trackTimeMillisMeta =
      const i0.VerificationMeta('trackTimeMillis');
  @override
  late final i0.GeneratedColumn<int> trackTimeMillis = i0.GeneratedColumn<int>(
      'track_time_millis', aliasedName, true,
      type: i0.DriftSqlType.int, requiredDuringInsert: false);
  static const i0.VerificationMeta _collectionNameMeta =
      const i0.VerificationMeta('collectionName');
  @override
  late final i0.GeneratedColumn<String> collectionName =
      i0.GeneratedColumn<String>('collection_name', aliasedName, true,
          type: i0.DriftSqlType.string, requiredDuringInsert: false);
  static const i0.VerificationMeta _listenedMeta =
      const i0.VerificationMeta('listened');
  @override
  late final i0.GeneratedColumnWithTypeConverter<i2.ListenStatus, int>
      listened = i0.GeneratedColumn<int>('listened', aliasedName, false,
              type: i0.DriftSqlType.int, requiredDuringInsert: true)
          .withConverter<i2.ListenStatus>(i1.$PodcastsTable.$converterlistened);
  static const i0.VerificationMeta _userRatingMeta =
      const i0.VerificationMeta('userRating');
  @override
  late final i0.GeneratedColumn<int> userRating = i0.GeneratedColumn<int>(
      'user_rating', aliasedName, true,
      type: i0.DriftSqlType.int, requiredDuringInsert: false);
  static const i0.VerificationMeta _genresMeta =
      const i0.VerificationMeta('genres');
  @override
  late final i0.GeneratedColumnWithTypeConverter<List<i3.GenreDto>?, String>
      genres = i0.GeneratedColumn<String>('genres', aliasedName, true,
              type: i0.DriftSqlType.string, requiredDuringInsert: false)
          .withConverter<List<i3.GenreDto>?>(
              i1.$PodcastsTable.$convertergenresn);
  static const i0.VerificationMeta _collectionIdMeta =
      const i0.VerificationMeta('collectionId');
  @override
  late final i0.GeneratedColumn<int> collectionId = i0.GeneratedColumn<int>(
      'collection_id', aliasedName, false,
      type: i0.DriftSqlType.int,
      requiredDuringInsert: true,
      defaultConstraints: i0.GeneratedColumn.constraintIsAlways(
          'REFERENCES user_collections (id) ON DELETE CASCADE'));
  @override
  List<i0.GeneratedColumn> get $columns => [
        id,
        artworkUrl60,
        trackName,
        description,
        releaseDate,
        collectionViewUrl,
        trackViewUrl,
        trackTimeMillis,
        collectionName,
        listened,
        userRating,
        genres,
        collectionId
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'podcasts';
  @override
  i0.VerificationContext validateIntegrity(i0.Insertable<i1.Podcast> instance,
      {bool isInserting = false}) {
    final context = i0.VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('artwork_url60')) {
      context.handle(
          _artworkUrl60Meta,
          artworkUrl60.isAcceptableOrUnknown(
              data['artwork_url60']!, _artworkUrl60Meta));
    }
    if (data.containsKey('track_name')) {
      context.handle(_trackNameMeta,
          trackName.isAcceptableOrUnknown(data['track_name']!, _trackNameMeta));
    }
    if (data.containsKey('description')) {
      context.handle(
          _descriptionMeta,
          description.isAcceptableOrUnknown(
              data['description']!, _descriptionMeta));
    }
    if (data.containsKey('release_date')) {
      context.handle(
          _releaseDateMeta,
          releaseDate.isAcceptableOrUnknown(
              data['release_date']!, _releaseDateMeta));
    }
    if (data.containsKey('collection_view_url')) {
      context.handle(
          _collectionViewUrlMeta,
          collectionViewUrl.isAcceptableOrUnknown(
              data['collection_view_url']!, _collectionViewUrlMeta));
    }
    if (data.containsKey('track_view_url')) {
      context.handle(
          _trackViewUrlMeta,
          trackViewUrl.isAcceptableOrUnknown(
              data['track_view_url']!, _trackViewUrlMeta));
    }
    if (data.containsKey('track_time_millis')) {
      context.handle(
          _trackTimeMillisMeta,
          trackTimeMillis.isAcceptableOrUnknown(
              data['track_time_millis']!, _trackTimeMillisMeta));
    }
    if (data.containsKey('collection_name')) {
      context.handle(
          _collectionNameMeta,
          collectionName.isAcceptableOrUnknown(
              data['collection_name']!, _collectionNameMeta));
    }
    context.handle(_listenedMeta, const i0.VerificationResult.success());
    if (data.containsKey('user_rating')) {
      context.handle(
          _userRatingMeta,
          userRating.isAcceptableOrUnknown(
              data['user_rating']!, _userRatingMeta));
    }
    context.handle(_genresMeta, const i0.VerificationResult.success());
    if (data.containsKey('collection_id')) {
      context.handle(
          _collectionIdMeta,
          collectionId.isAcceptableOrUnknown(
              data['collection_id']!, _collectionIdMeta));
    } else if (isInserting) {
      context.missing(_collectionIdMeta);
    }
    return context;
  }

  @override
  Set<i0.GeneratedColumn> get $primaryKey => {id};
  @override
  i1.Podcast map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return i1.Podcast(
      id: attachedDatabase.typeMapping
          .read(i0.DriftSqlType.int, data['${effectivePrefix}id'])!,
      artworkUrl60: attachedDatabase.typeMapping.read(
          i0.DriftSqlType.string, data['${effectivePrefix}artwork_url60']),
      trackName: attachedDatabase.typeMapping
          .read(i0.DriftSqlType.string, data['${effectivePrefix}track_name']),
      description: attachedDatabase.typeMapping
          .read(i0.DriftSqlType.string, data['${effectivePrefix}description']),
      releaseDate: attachedDatabase.typeMapping.read(
          i0.DriftSqlType.dateTime, data['${effectivePrefix}release_date']),
      collectionViewUrl: attachedDatabase.typeMapping.read(
          i0.DriftSqlType.string,
          data['${effectivePrefix}collection_view_url']),
      trackViewUrl: attachedDatabase.typeMapping.read(
          i0.DriftSqlType.string, data['${effectivePrefix}track_view_url']),
      trackTimeMillis: attachedDatabase.typeMapping.read(
          i0.DriftSqlType.int, data['${effectivePrefix}track_time_millis']),
      collectionName: attachedDatabase.typeMapping.read(
          i0.DriftSqlType.string, data['${effectivePrefix}collection_name']),
      listened: i1.$PodcastsTable.$converterlistened.fromSql(attachedDatabase
          .typeMapping
          .read(i0.DriftSqlType.int, data['${effectivePrefix}listened'])!),
      userRating: attachedDatabase.typeMapping
          .read(i0.DriftSqlType.int, data['${effectivePrefix}user_rating']),
      genres: i1.$PodcastsTable.$convertergenresn.fromSql(attachedDatabase
          .typeMapping
          .read(i0.DriftSqlType.string, data['${effectivePrefix}genres'])),
      collectionId: attachedDatabase.typeMapping
          .read(i0.DriftSqlType.int, data['${effectivePrefix}collection_id'])!,
    );
  }

  @override
  $PodcastsTable createAlias(String alias) {
    return $PodcastsTable(attachedDatabase, alias);
  }

  static i0.JsonTypeConverter2<i2.ListenStatus, int, int> $converterlistened =
      const i0.EnumIndexConverter<i2.ListenStatus>(i2.ListenStatus.values);
  static i0.TypeConverter<List<i3.GenreDto>, String> $convertergenres =
      const i5.GenresConverter();
  static i0.TypeConverter<List<i3.GenreDto>?, String?> $convertergenresn =
      i0.NullAwareTypeConverter.wrap($convertergenres);
}

class Podcast extends i0.DataClass implements i0.Insertable<i1.Podcast> {
  final int id;
  final String? artworkUrl60;
  final String? trackName;
  final String? description;
  final DateTime? releaseDate;
  final String? collectionViewUrl;
  final String? trackViewUrl;
  final int? trackTimeMillis;
  final String? collectionName;
  final i2.ListenStatus listened;
  final int? userRating;
  final List<i3.GenreDto>? genres;
  final int collectionId;
  const Podcast(
      {required this.id,
      this.artworkUrl60,
      this.trackName,
      this.description,
      this.releaseDate,
      this.collectionViewUrl,
      this.trackViewUrl,
      this.trackTimeMillis,
      this.collectionName,
      required this.listened,
      this.userRating,
      this.genres,
      required this.collectionId});
  @override
  Map<String, i0.Expression> toColumns(bool nullToAbsent) {
    final map = <String, i0.Expression>{};
    map['id'] = i0.Variable<int>(id);
    if (!nullToAbsent || artworkUrl60 != null) {
      map['artwork_url60'] = i0.Variable<String>(artworkUrl60);
    }
    if (!nullToAbsent || trackName != null) {
      map['track_name'] = i0.Variable<String>(trackName);
    }
    if (!nullToAbsent || description != null) {
      map['description'] = i0.Variable<String>(description);
    }
    if (!nullToAbsent || releaseDate != null) {
      map['release_date'] = i0.Variable<DateTime>(releaseDate);
    }
    if (!nullToAbsent || collectionViewUrl != null) {
      map['collection_view_url'] = i0.Variable<String>(collectionViewUrl);
    }
    if (!nullToAbsent || trackViewUrl != null) {
      map['track_view_url'] = i0.Variable<String>(trackViewUrl);
    }
    if (!nullToAbsent || trackTimeMillis != null) {
      map['track_time_millis'] = i0.Variable<int>(trackTimeMillis);
    }
    if (!nullToAbsent || collectionName != null) {
      map['collection_name'] = i0.Variable<String>(collectionName);
    }
    {
      map['listened'] = i0.Variable<int>(
          i1.$PodcastsTable.$converterlistened.toSql(listened));
    }
    if (!nullToAbsent || userRating != null) {
      map['user_rating'] = i0.Variable<int>(userRating);
    }
    if (!nullToAbsent || genres != null) {
      map['genres'] = i0.Variable<String>(
          i1.$PodcastsTable.$convertergenresn.toSql(genres));
    }
    map['collection_id'] = i0.Variable<int>(collectionId);
    return map;
  }

  i1.PodcastsCompanion toCompanion(bool nullToAbsent) {
    return i1.PodcastsCompanion(
      id: i0.Value(id),
      artworkUrl60: artworkUrl60 == null && nullToAbsent
          ? const i0.Value.absent()
          : i0.Value(artworkUrl60),
      trackName: trackName == null && nullToAbsent
          ? const i0.Value.absent()
          : i0.Value(trackName),
      description: description == null && nullToAbsent
          ? const i0.Value.absent()
          : i0.Value(description),
      releaseDate: releaseDate == null && nullToAbsent
          ? const i0.Value.absent()
          : i0.Value(releaseDate),
      collectionViewUrl: collectionViewUrl == null && nullToAbsent
          ? const i0.Value.absent()
          : i0.Value(collectionViewUrl),
      trackViewUrl: trackViewUrl == null && nullToAbsent
          ? const i0.Value.absent()
          : i0.Value(trackViewUrl),
      trackTimeMillis: trackTimeMillis == null && nullToAbsent
          ? const i0.Value.absent()
          : i0.Value(trackTimeMillis),
      collectionName: collectionName == null && nullToAbsent
          ? const i0.Value.absent()
          : i0.Value(collectionName),
      listened: i0.Value(listened),
      userRating: userRating == null && nullToAbsent
          ? const i0.Value.absent()
          : i0.Value(userRating),
      genres: genres == null && nullToAbsent
          ? const i0.Value.absent()
          : i0.Value(genres),
      collectionId: i0.Value(collectionId),
    );
  }

  factory Podcast.fromJson(Map<String, dynamic> json,
      {i0.ValueSerializer? serializer}) {
    serializer ??= i0.driftRuntimeOptions.defaultSerializer;
    return Podcast(
      id: serializer.fromJson<int>(json['id']),
      artworkUrl60: serializer.fromJson<String?>(json['artworkUrl60']),
      trackName: serializer.fromJson<String?>(json['trackName']),
      description: serializer.fromJson<String?>(json['description']),
      releaseDate: serializer.fromJson<DateTime?>(json['releaseDate']),
      collectionViewUrl:
          serializer.fromJson<String?>(json['collectionViewUrl']),
      trackViewUrl: serializer.fromJson<String?>(json['trackViewUrl']),
      trackTimeMillis: serializer.fromJson<int?>(json['trackTimeMillis']),
      collectionName: serializer.fromJson<String?>(json['collectionName']),
      listened: i1.$PodcastsTable.$converterlistened
          .fromJson(serializer.fromJson<int>(json['listened'])),
      userRating: serializer.fromJson<int?>(json['userRating']),
      genres: serializer.fromJson<List<i3.GenreDto>?>(json['genres']),
      collectionId: serializer.fromJson<int>(json['collectionId']),
    );
  }
  @override
  Map<String, dynamic> toJson({i0.ValueSerializer? serializer}) {
    serializer ??= i0.driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'artworkUrl60': serializer.toJson<String?>(artworkUrl60),
      'trackName': serializer.toJson<String?>(trackName),
      'description': serializer.toJson<String?>(description),
      'releaseDate': serializer.toJson<DateTime?>(releaseDate),
      'collectionViewUrl': serializer.toJson<String?>(collectionViewUrl),
      'trackViewUrl': serializer.toJson<String?>(trackViewUrl),
      'trackTimeMillis': serializer.toJson<int?>(trackTimeMillis),
      'collectionName': serializer.toJson<String?>(collectionName),
      'listened': serializer
          .toJson<int>(i1.$PodcastsTable.$converterlistened.toJson(listened)),
      'userRating': serializer.toJson<int?>(userRating),
      'genres': serializer.toJson<List<i3.GenreDto>?>(genres),
      'collectionId': serializer.toJson<int>(collectionId),
    };
  }

  i1.Podcast copyWith(
          {int? id,
          i0.Value<String?> artworkUrl60 = const i0.Value.absent(),
          i0.Value<String?> trackName = const i0.Value.absent(),
          i0.Value<String?> description = const i0.Value.absent(),
          i0.Value<DateTime?> releaseDate = const i0.Value.absent(),
          i0.Value<String?> collectionViewUrl = const i0.Value.absent(),
          i0.Value<String?> trackViewUrl = const i0.Value.absent(),
          i0.Value<int?> trackTimeMillis = const i0.Value.absent(),
          i0.Value<String?> collectionName = const i0.Value.absent(),
          i2.ListenStatus? listened,
          i0.Value<int?> userRating = const i0.Value.absent(),
          i0.Value<List<i3.GenreDto>?> genres = const i0.Value.absent(),
          int? collectionId}) =>
      i1.Podcast(
        id: id ?? this.id,
        artworkUrl60:
            artworkUrl60.present ? artworkUrl60.value : this.artworkUrl60,
        trackName: trackName.present ? trackName.value : this.trackName,
        description: description.present ? description.value : this.description,
        releaseDate: releaseDate.present ? releaseDate.value : this.releaseDate,
        collectionViewUrl: collectionViewUrl.present
            ? collectionViewUrl.value
            : this.collectionViewUrl,
        trackViewUrl:
            trackViewUrl.present ? trackViewUrl.value : this.trackViewUrl,
        trackTimeMillis: trackTimeMillis.present
            ? trackTimeMillis.value
            : this.trackTimeMillis,
        collectionName:
            collectionName.present ? collectionName.value : this.collectionName,
        listened: listened ?? this.listened,
        userRating: userRating.present ? userRating.value : this.userRating,
        genres: genres.present ? genres.value : this.genres,
        collectionId: collectionId ?? this.collectionId,
      );
  Podcast copyWithCompanion(i1.PodcastsCompanion data) {
    return Podcast(
      id: data.id.present ? data.id.value : this.id,
      artworkUrl60: data.artworkUrl60.present
          ? data.artworkUrl60.value
          : this.artworkUrl60,
      trackName: data.trackName.present ? data.trackName.value : this.trackName,
      description:
          data.description.present ? data.description.value : this.description,
      releaseDate:
          data.releaseDate.present ? data.releaseDate.value : this.releaseDate,
      collectionViewUrl: data.collectionViewUrl.present
          ? data.collectionViewUrl.value
          : this.collectionViewUrl,
      trackViewUrl: data.trackViewUrl.present
          ? data.trackViewUrl.value
          : this.trackViewUrl,
      trackTimeMillis: data.trackTimeMillis.present
          ? data.trackTimeMillis.value
          : this.trackTimeMillis,
      collectionName: data.collectionName.present
          ? data.collectionName.value
          : this.collectionName,
      listened: data.listened.present ? data.listened.value : this.listened,
      userRating:
          data.userRating.present ? data.userRating.value : this.userRating,
      genres: data.genres.present ? data.genres.value : this.genres,
      collectionId: data.collectionId.present
          ? data.collectionId.value
          : this.collectionId,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Podcast(')
          ..write('id: $id, ')
          ..write('artworkUrl60: $artworkUrl60, ')
          ..write('trackName: $trackName, ')
          ..write('description: $description, ')
          ..write('releaseDate: $releaseDate, ')
          ..write('collectionViewUrl: $collectionViewUrl, ')
          ..write('trackViewUrl: $trackViewUrl, ')
          ..write('trackTimeMillis: $trackTimeMillis, ')
          ..write('collectionName: $collectionName, ')
          ..write('listened: $listened, ')
          ..write('userRating: $userRating, ')
          ..write('genres: $genres, ')
          ..write('collectionId: $collectionId')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      id,
      artworkUrl60,
      trackName,
      description,
      releaseDate,
      collectionViewUrl,
      trackViewUrl,
      trackTimeMillis,
      collectionName,
      listened,
      userRating,
      genres,
      collectionId);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is i1.Podcast &&
          other.id == this.id &&
          other.artworkUrl60 == this.artworkUrl60 &&
          other.trackName == this.trackName &&
          other.description == this.description &&
          other.releaseDate == this.releaseDate &&
          other.collectionViewUrl == this.collectionViewUrl &&
          other.trackViewUrl == this.trackViewUrl &&
          other.trackTimeMillis == this.trackTimeMillis &&
          other.collectionName == this.collectionName &&
          other.listened == this.listened &&
          other.userRating == this.userRating &&
          other.genres == this.genres &&
          other.collectionId == this.collectionId);
}

class PodcastsCompanion extends i0.UpdateCompanion<i1.Podcast> {
  final i0.Value<int> id;
  final i0.Value<String?> artworkUrl60;
  final i0.Value<String?> trackName;
  final i0.Value<String?> description;
  final i0.Value<DateTime?> releaseDate;
  final i0.Value<String?> collectionViewUrl;
  final i0.Value<String?> trackViewUrl;
  final i0.Value<int?> trackTimeMillis;
  final i0.Value<String?> collectionName;
  final i0.Value<i2.ListenStatus> listened;
  final i0.Value<int?> userRating;
  final i0.Value<List<i3.GenreDto>?> genres;
  final i0.Value<int> collectionId;
  const PodcastsCompanion({
    this.id = const i0.Value.absent(),
    this.artworkUrl60 = const i0.Value.absent(),
    this.trackName = const i0.Value.absent(),
    this.description = const i0.Value.absent(),
    this.releaseDate = const i0.Value.absent(),
    this.collectionViewUrl = const i0.Value.absent(),
    this.trackViewUrl = const i0.Value.absent(),
    this.trackTimeMillis = const i0.Value.absent(),
    this.collectionName = const i0.Value.absent(),
    this.listened = const i0.Value.absent(),
    this.userRating = const i0.Value.absent(),
    this.genres = const i0.Value.absent(),
    this.collectionId = const i0.Value.absent(),
  });
  PodcastsCompanion.insert({
    this.id = const i0.Value.absent(),
    this.artworkUrl60 = const i0.Value.absent(),
    this.trackName = const i0.Value.absent(),
    this.description = const i0.Value.absent(),
    this.releaseDate = const i0.Value.absent(),
    this.collectionViewUrl = const i0.Value.absent(),
    this.trackViewUrl = const i0.Value.absent(),
    this.trackTimeMillis = const i0.Value.absent(),
    this.collectionName = const i0.Value.absent(),
    required i2.ListenStatus listened,
    this.userRating = const i0.Value.absent(),
    this.genres = const i0.Value.absent(),
    required int collectionId,
  })  : listened = i0.Value(listened),
        collectionId = i0.Value(collectionId);
  static i0.Insertable<i1.Podcast> custom({
    i0.Expression<int>? id,
    i0.Expression<String>? artworkUrl60,
    i0.Expression<String>? trackName,
    i0.Expression<String>? description,
    i0.Expression<DateTime>? releaseDate,
    i0.Expression<String>? collectionViewUrl,
    i0.Expression<String>? trackViewUrl,
    i0.Expression<int>? trackTimeMillis,
    i0.Expression<String>? collectionName,
    i0.Expression<int>? listened,
    i0.Expression<int>? userRating,
    i0.Expression<String>? genres,
    i0.Expression<int>? collectionId,
  }) {
    return i0.RawValuesInsertable({
      if (id != null) 'id': id,
      if (artworkUrl60 != null) 'artwork_url60': artworkUrl60,
      if (trackName != null) 'track_name': trackName,
      if (description != null) 'description': description,
      if (releaseDate != null) 'release_date': releaseDate,
      if (collectionViewUrl != null) 'collection_view_url': collectionViewUrl,
      if (trackViewUrl != null) 'track_view_url': trackViewUrl,
      if (trackTimeMillis != null) 'track_time_millis': trackTimeMillis,
      if (collectionName != null) 'collection_name': collectionName,
      if (listened != null) 'listened': listened,
      if (userRating != null) 'user_rating': userRating,
      if (genres != null) 'genres': genres,
      if (collectionId != null) 'collection_id': collectionId,
    });
  }

  i1.PodcastsCompanion copyWith(
      {i0.Value<int>? id,
      i0.Value<String?>? artworkUrl60,
      i0.Value<String?>? trackName,
      i0.Value<String?>? description,
      i0.Value<DateTime?>? releaseDate,
      i0.Value<String?>? collectionViewUrl,
      i0.Value<String?>? trackViewUrl,
      i0.Value<int?>? trackTimeMillis,
      i0.Value<String?>? collectionName,
      i0.Value<i2.ListenStatus>? listened,
      i0.Value<int?>? userRating,
      i0.Value<List<i3.GenreDto>?>? genres,
      i0.Value<int>? collectionId}) {
    return i1.PodcastsCompanion(
      id: id ?? this.id,
      artworkUrl60: artworkUrl60 ?? this.artworkUrl60,
      trackName: trackName ?? this.trackName,
      description: description ?? this.description,
      releaseDate: releaseDate ?? this.releaseDate,
      collectionViewUrl: collectionViewUrl ?? this.collectionViewUrl,
      trackViewUrl: trackViewUrl ?? this.trackViewUrl,
      trackTimeMillis: trackTimeMillis ?? this.trackTimeMillis,
      collectionName: collectionName ?? this.collectionName,
      listened: listened ?? this.listened,
      userRating: userRating ?? this.userRating,
      genres: genres ?? this.genres,
      collectionId: collectionId ?? this.collectionId,
    );
  }

  @override
  Map<String, i0.Expression> toColumns(bool nullToAbsent) {
    final map = <String, i0.Expression>{};
    if (id.present) {
      map['id'] = i0.Variable<int>(id.value);
    }
    if (artworkUrl60.present) {
      map['artwork_url60'] = i0.Variable<String>(artworkUrl60.value);
    }
    if (trackName.present) {
      map['track_name'] = i0.Variable<String>(trackName.value);
    }
    if (description.present) {
      map['description'] = i0.Variable<String>(description.value);
    }
    if (releaseDate.present) {
      map['release_date'] = i0.Variable<DateTime>(releaseDate.value);
    }
    if (collectionViewUrl.present) {
      map['collection_view_url'] = i0.Variable<String>(collectionViewUrl.value);
    }
    if (trackViewUrl.present) {
      map['track_view_url'] = i0.Variable<String>(trackViewUrl.value);
    }
    if (trackTimeMillis.present) {
      map['track_time_millis'] = i0.Variable<int>(trackTimeMillis.value);
    }
    if (collectionName.present) {
      map['collection_name'] = i0.Variable<String>(collectionName.value);
    }
    if (listened.present) {
      map['listened'] = i0.Variable<int>(
          i1.$PodcastsTable.$converterlistened.toSql(listened.value));
    }
    if (userRating.present) {
      map['user_rating'] = i0.Variable<int>(userRating.value);
    }
    if (genres.present) {
      map['genres'] = i0.Variable<String>(
          i1.$PodcastsTable.$convertergenresn.toSql(genres.value));
    }
    if (collectionId.present) {
      map['collection_id'] = i0.Variable<int>(collectionId.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('PodcastsCompanion(')
          ..write('id: $id, ')
          ..write('artworkUrl60: $artworkUrl60, ')
          ..write('trackName: $trackName, ')
          ..write('description: $description, ')
          ..write('releaseDate: $releaseDate, ')
          ..write('collectionViewUrl: $collectionViewUrl, ')
          ..write('trackViewUrl: $trackViewUrl, ')
          ..write('trackTimeMillis: $trackTimeMillis, ')
          ..write('collectionName: $collectionName, ')
          ..write('listened: $listened, ')
          ..write('userRating: $userRating, ')
          ..write('genres: $genres, ')
          ..write('collectionId: $collectionId')
          ..write(')'))
        .toString();
  }
}
