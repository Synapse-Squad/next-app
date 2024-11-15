// ignore_for_file: type=lint
import 'package:drift/drift.dart' as i0;
import 'package:next_database_service/src/tables/albums.drift.dart' as i1;
import 'package:next_database_service/src/enums/listen_status.dart' as i2;
import 'package:next_database_service/src/tables/albums.dart' as i3;
import 'package:drift/src/runtime/query_builder/query_builder.dart' as i4;

class $AlbumsTable extends i3.Albums with i0.TableInfo<$AlbumsTable, i1.Album> {
  @override
  final i0.GeneratedDatabase attachedDatabase;
  final String? _alias;
  $AlbumsTable(this.attachedDatabase, [this._alias]);
  static const i0.VerificationMeta _idMeta = const i0.VerificationMeta('id');
  @override
  late final i0.GeneratedColumn<int> id = i0.GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: i0.DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          i0.GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const i0.VerificationMeta _artistNameMeta =
      const i0.VerificationMeta('artistName');
  @override
  late final i0.GeneratedColumn<String> artistName = i0.GeneratedColumn<String>(
      'artist_name', aliasedName, true,
      type: i0.DriftSqlType.string, requiredDuringInsert: false);
  static const i0.VerificationMeta _collectionNameMeta =
      const i0.VerificationMeta('collectionName');
  @override
  late final i0.GeneratedColumn<String> collectionName =
      i0.GeneratedColumn<String>('collection_name', aliasedName, true,
          type: i0.DriftSqlType.string, requiredDuringInsert: false);
  static const i0.VerificationMeta _collectionViewUrlMeta =
      const i0.VerificationMeta('collectionViewUrl');
  @override
  late final i0.GeneratedColumn<String> collectionViewUrl =
      i0.GeneratedColumn<String>('collection_view_url', aliasedName, true,
          type: i0.DriftSqlType.string, requiredDuringInsert: false);
  static const i0.VerificationMeta _artworkUrl60Meta =
      const i0.VerificationMeta('artworkUrl60');
  @override
  late final i0.GeneratedColumn<String> artworkUrl60 =
      i0.GeneratedColumn<String>('artwork_url60', aliasedName, true,
          type: i0.DriftSqlType.string, requiredDuringInsert: false);
  static const i0.VerificationMeta _trackCountMeta =
      const i0.VerificationMeta('trackCount');
  @override
  late final i0.GeneratedColumn<int> trackCount = i0.GeneratedColumn<int>(
      'track_count', aliasedName, true,
      type: i0.DriftSqlType.int, requiredDuringInsert: false);
  static const i0.VerificationMeta _copyrightMeta =
      const i0.VerificationMeta('copyright');
  @override
  late final i0.GeneratedColumn<String> copyright = i0.GeneratedColumn<String>(
      'copyright', aliasedName, true,
      type: i0.DriftSqlType.string, requiredDuringInsert: false);
  static const i0.VerificationMeta _releaseDateMeta =
      const i0.VerificationMeta('releaseDate');
  @override
  late final i0.GeneratedColumn<DateTime> releaseDate =
      i0.GeneratedColumn<DateTime>('release_date', aliasedName, true,
          type: i0.DriftSqlType.dateTime, requiredDuringInsert: false);
  static const i0.VerificationMeta _primaryGenreNameMeta =
      const i0.VerificationMeta('primaryGenreName');
  @override
  late final i0.GeneratedColumn<String> primaryGenreName =
      i0.GeneratedColumn<String>('primary_genre_name', aliasedName, true,
          type: i0.DriftSqlType.string, requiredDuringInsert: false);
  static const i0.VerificationMeta _listenedMeta =
      const i0.VerificationMeta('listened');
  @override
  late final i0.GeneratedColumnWithTypeConverter<i2.ListenStatus, int>
      listened = i0.GeneratedColumn<int>('listened', aliasedName, false,
              type: i0.DriftSqlType.int, requiredDuringInsert: true)
          .withConverter<i2.ListenStatus>(i1.$AlbumsTable.$converterlistened);
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
        artistName,
        collectionName,
        collectionViewUrl,
        artworkUrl60,
        trackCount,
        copyright,
        releaseDate,
        primaryGenreName,
        listened,
        userRating,
        collectionId,
        createdAt
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'albums';
  @override
  i0.VerificationContext validateIntegrity(i0.Insertable<i1.Album> instance,
      {bool isInserting = false}) {
    final context = i0.VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('artist_name')) {
      context.handle(
          _artistNameMeta,
          artistName.isAcceptableOrUnknown(
              data['artist_name']!, _artistNameMeta));
    }
    if (data.containsKey('collection_name')) {
      context.handle(
          _collectionNameMeta,
          collectionName.isAcceptableOrUnknown(
              data['collection_name']!, _collectionNameMeta));
    }
    if (data.containsKey('collection_view_url')) {
      context.handle(
          _collectionViewUrlMeta,
          collectionViewUrl.isAcceptableOrUnknown(
              data['collection_view_url']!, _collectionViewUrlMeta));
    }
    if (data.containsKey('artwork_url60')) {
      context.handle(
          _artworkUrl60Meta,
          artworkUrl60.isAcceptableOrUnknown(
              data['artwork_url60']!, _artworkUrl60Meta));
    }
    if (data.containsKey('track_count')) {
      context.handle(
          _trackCountMeta,
          trackCount.isAcceptableOrUnknown(
              data['track_count']!, _trackCountMeta));
    }
    if (data.containsKey('copyright')) {
      context.handle(_copyrightMeta,
          copyright.isAcceptableOrUnknown(data['copyright']!, _copyrightMeta));
    }
    if (data.containsKey('release_date')) {
      context.handle(
          _releaseDateMeta,
          releaseDate.isAcceptableOrUnknown(
              data['release_date']!, _releaseDateMeta));
    }
    if (data.containsKey('primary_genre_name')) {
      context.handle(
          _primaryGenreNameMeta,
          primaryGenreName.isAcceptableOrUnknown(
              data['primary_genre_name']!, _primaryGenreNameMeta));
    }
    context.handle(_listenedMeta, const i0.VerificationResult.success());
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
  i1.Album map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return i1.Album(
      id: attachedDatabase.typeMapping
          .read(i0.DriftSqlType.int, data['${effectivePrefix}id'])!,
      artistName: attachedDatabase.typeMapping
          .read(i0.DriftSqlType.string, data['${effectivePrefix}artist_name']),
      collectionName: attachedDatabase.typeMapping.read(
          i0.DriftSqlType.string, data['${effectivePrefix}collection_name']),
      collectionViewUrl: attachedDatabase.typeMapping.read(
          i0.DriftSqlType.string,
          data['${effectivePrefix}collection_view_url']),
      artworkUrl60: attachedDatabase.typeMapping.read(
          i0.DriftSqlType.string, data['${effectivePrefix}artwork_url60']),
      trackCount: attachedDatabase.typeMapping
          .read(i0.DriftSqlType.int, data['${effectivePrefix}track_count']),
      copyright: attachedDatabase.typeMapping
          .read(i0.DriftSqlType.string, data['${effectivePrefix}copyright']),
      releaseDate: attachedDatabase.typeMapping.read(
          i0.DriftSqlType.dateTime, data['${effectivePrefix}release_date']),
      primaryGenreName: attachedDatabase.typeMapping.read(
          i0.DriftSqlType.string, data['${effectivePrefix}primary_genre_name']),
      listened: i1.$AlbumsTable.$converterlistened.fromSql(attachedDatabase
          .typeMapping
          .read(i0.DriftSqlType.int, data['${effectivePrefix}listened'])!),
      userRating: attachedDatabase.typeMapping
          .read(i0.DriftSqlType.int, data['${effectivePrefix}user_rating']),
      collectionId: attachedDatabase.typeMapping
          .read(i0.DriftSqlType.int, data['${effectivePrefix}collection_id'])!,
      createdAt: attachedDatabase.typeMapping.read(
          i0.DriftSqlType.dateTime, data['${effectivePrefix}created_at'])!,
    );
  }

  @override
  $AlbumsTable createAlias(String alias) {
    return $AlbumsTable(attachedDatabase, alias);
  }

  static i0.JsonTypeConverter2<i2.ListenStatus, int, int> $converterlistened =
      const i0.EnumIndexConverter<i2.ListenStatus>(i2.ListenStatus.values);
}

class Album extends i0.DataClass implements i0.Insertable<i1.Album> {
  final int id;
  final String? artistName;
  final String? collectionName;
  final String? collectionViewUrl;
  final String? artworkUrl60;
  final int? trackCount;
  final String? copyright;
  final DateTime? releaseDate;
  final String? primaryGenreName;
  final i2.ListenStatus listened;
  final int? userRating;
  final int collectionId;
  final DateTime createdAt;
  const Album(
      {required this.id,
      this.artistName,
      this.collectionName,
      this.collectionViewUrl,
      this.artworkUrl60,
      this.trackCount,
      this.copyright,
      this.releaseDate,
      this.primaryGenreName,
      required this.listened,
      this.userRating,
      required this.collectionId,
      required this.createdAt});
  @override
  Map<String, i0.Expression> toColumns(bool nullToAbsent) {
    final map = <String, i0.Expression>{};
    map['id'] = i0.Variable<int>(id);
    if (!nullToAbsent || artistName != null) {
      map['artist_name'] = i0.Variable<String>(artistName);
    }
    if (!nullToAbsent || collectionName != null) {
      map['collection_name'] = i0.Variable<String>(collectionName);
    }
    if (!nullToAbsent || collectionViewUrl != null) {
      map['collection_view_url'] = i0.Variable<String>(collectionViewUrl);
    }
    if (!nullToAbsent || artworkUrl60 != null) {
      map['artwork_url60'] = i0.Variable<String>(artworkUrl60);
    }
    if (!nullToAbsent || trackCount != null) {
      map['track_count'] = i0.Variable<int>(trackCount);
    }
    if (!nullToAbsent || copyright != null) {
      map['copyright'] = i0.Variable<String>(copyright);
    }
    if (!nullToAbsent || releaseDate != null) {
      map['release_date'] = i0.Variable<DateTime>(releaseDate);
    }
    if (!nullToAbsent || primaryGenreName != null) {
      map['primary_genre_name'] = i0.Variable<String>(primaryGenreName);
    }
    {
      map['listened'] =
          i0.Variable<int>(i1.$AlbumsTable.$converterlistened.toSql(listened));
    }
    if (!nullToAbsent || userRating != null) {
      map['user_rating'] = i0.Variable<int>(userRating);
    }
    map['collection_id'] = i0.Variable<int>(collectionId);
    map['created_at'] = i0.Variable<DateTime>(createdAt);
    return map;
  }

  i1.AlbumsCompanion toCompanion(bool nullToAbsent) {
    return i1.AlbumsCompanion(
      id: i0.Value(id),
      artistName: artistName == null && nullToAbsent
          ? const i0.Value.absent()
          : i0.Value(artistName),
      collectionName: collectionName == null && nullToAbsent
          ? const i0.Value.absent()
          : i0.Value(collectionName),
      collectionViewUrl: collectionViewUrl == null && nullToAbsent
          ? const i0.Value.absent()
          : i0.Value(collectionViewUrl),
      artworkUrl60: artworkUrl60 == null && nullToAbsent
          ? const i0.Value.absent()
          : i0.Value(artworkUrl60),
      trackCount: trackCount == null && nullToAbsent
          ? const i0.Value.absent()
          : i0.Value(trackCount),
      copyright: copyright == null && nullToAbsent
          ? const i0.Value.absent()
          : i0.Value(copyright),
      releaseDate: releaseDate == null && nullToAbsent
          ? const i0.Value.absent()
          : i0.Value(releaseDate),
      primaryGenreName: primaryGenreName == null && nullToAbsent
          ? const i0.Value.absent()
          : i0.Value(primaryGenreName),
      listened: i0.Value(listened),
      userRating: userRating == null && nullToAbsent
          ? const i0.Value.absent()
          : i0.Value(userRating),
      collectionId: i0.Value(collectionId),
      createdAt: i0.Value(createdAt),
    );
  }

  factory Album.fromJson(Map<String, dynamic> json,
      {i0.ValueSerializer? serializer}) {
    serializer ??= i0.driftRuntimeOptions.defaultSerializer;
    return Album(
      id: serializer.fromJson<int>(json['id']),
      artistName: serializer.fromJson<String?>(json['artistName']),
      collectionName: serializer.fromJson<String?>(json['collectionName']),
      collectionViewUrl:
          serializer.fromJson<String?>(json['collectionViewUrl']),
      artworkUrl60: serializer.fromJson<String?>(json['artworkUrl60']),
      trackCount: serializer.fromJson<int?>(json['trackCount']),
      copyright: serializer.fromJson<String?>(json['copyright']),
      releaseDate: serializer.fromJson<DateTime?>(json['releaseDate']),
      primaryGenreName: serializer.fromJson<String?>(json['primaryGenreName']),
      listened: i1.$AlbumsTable.$converterlistened
          .fromJson(serializer.fromJson<int>(json['listened'])),
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
      'artistName': serializer.toJson<String?>(artistName),
      'collectionName': serializer.toJson<String?>(collectionName),
      'collectionViewUrl': serializer.toJson<String?>(collectionViewUrl),
      'artworkUrl60': serializer.toJson<String?>(artworkUrl60),
      'trackCount': serializer.toJson<int?>(trackCount),
      'copyright': serializer.toJson<String?>(copyright),
      'releaseDate': serializer.toJson<DateTime?>(releaseDate),
      'primaryGenreName': serializer.toJson<String?>(primaryGenreName),
      'listened': serializer
          .toJson<int>(i1.$AlbumsTable.$converterlistened.toJson(listened)),
      'userRating': serializer.toJson<int?>(userRating),
      'collectionId': serializer.toJson<int>(collectionId),
      'createdAt': serializer.toJson<DateTime>(createdAt),
    };
  }

  i1.Album copyWith(
          {int? id,
          i0.Value<String?> artistName = const i0.Value.absent(),
          i0.Value<String?> collectionName = const i0.Value.absent(),
          i0.Value<String?> collectionViewUrl = const i0.Value.absent(),
          i0.Value<String?> artworkUrl60 = const i0.Value.absent(),
          i0.Value<int?> trackCount = const i0.Value.absent(),
          i0.Value<String?> copyright = const i0.Value.absent(),
          i0.Value<DateTime?> releaseDate = const i0.Value.absent(),
          i0.Value<String?> primaryGenreName = const i0.Value.absent(),
          i2.ListenStatus? listened,
          i0.Value<int?> userRating = const i0.Value.absent(),
          int? collectionId,
          DateTime? createdAt}) =>
      i1.Album(
        id: id ?? this.id,
        artistName: artistName.present ? artistName.value : this.artistName,
        collectionName:
            collectionName.present ? collectionName.value : this.collectionName,
        collectionViewUrl: collectionViewUrl.present
            ? collectionViewUrl.value
            : this.collectionViewUrl,
        artworkUrl60:
            artworkUrl60.present ? artworkUrl60.value : this.artworkUrl60,
        trackCount: trackCount.present ? trackCount.value : this.trackCount,
        copyright: copyright.present ? copyright.value : this.copyright,
        releaseDate: releaseDate.present ? releaseDate.value : this.releaseDate,
        primaryGenreName: primaryGenreName.present
            ? primaryGenreName.value
            : this.primaryGenreName,
        listened: listened ?? this.listened,
        userRating: userRating.present ? userRating.value : this.userRating,
        collectionId: collectionId ?? this.collectionId,
        createdAt: createdAt ?? this.createdAt,
      );
  Album copyWithCompanion(i1.AlbumsCompanion data) {
    return Album(
      id: data.id.present ? data.id.value : this.id,
      artistName:
          data.artistName.present ? data.artistName.value : this.artistName,
      collectionName: data.collectionName.present
          ? data.collectionName.value
          : this.collectionName,
      collectionViewUrl: data.collectionViewUrl.present
          ? data.collectionViewUrl.value
          : this.collectionViewUrl,
      artworkUrl60: data.artworkUrl60.present
          ? data.artworkUrl60.value
          : this.artworkUrl60,
      trackCount:
          data.trackCount.present ? data.trackCount.value : this.trackCount,
      copyright: data.copyright.present ? data.copyright.value : this.copyright,
      releaseDate:
          data.releaseDate.present ? data.releaseDate.value : this.releaseDate,
      primaryGenreName: data.primaryGenreName.present
          ? data.primaryGenreName.value
          : this.primaryGenreName,
      listened: data.listened.present ? data.listened.value : this.listened,
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
    return (StringBuffer('Album(')
          ..write('id: $id, ')
          ..write('artistName: $artistName, ')
          ..write('collectionName: $collectionName, ')
          ..write('collectionViewUrl: $collectionViewUrl, ')
          ..write('artworkUrl60: $artworkUrl60, ')
          ..write('trackCount: $trackCount, ')
          ..write('copyright: $copyright, ')
          ..write('releaseDate: $releaseDate, ')
          ..write('primaryGenreName: $primaryGenreName, ')
          ..write('listened: $listened, ')
          ..write('userRating: $userRating, ')
          ..write('collectionId: $collectionId, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      id,
      artistName,
      collectionName,
      collectionViewUrl,
      artworkUrl60,
      trackCount,
      copyright,
      releaseDate,
      primaryGenreName,
      listened,
      userRating,
      collectionId,
      createdAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is i1.Album &&
          other.id == this.id &&
          other.artistName == this.artistName &&
          other.collectionName == this.collectionName &&
          other.collectionViewUrl == this.collectionViewUrl &&
          other.artworkUrl60 == this.artworkUrl60 &&
          other.trackCount == this.trackCount &&
          other.copyright == this.copyright &&
          other.releaseDate == this.releaseDate &&
          other.primaryGenreName == this.primaryGenreName &&
          other.listened == this.listened &&
          other.userRating == this.userRating &&
          other.collectionId == this.collectionId &&
          other.createdAt == this.createdAt);
}

class AlbumsCompanion extends i0.UpdateCompanion<i1.Album> {
  final i0.Value<int> id;
  final i0.Value<String?> artistName;
  final i0.Value<String?> collectionName;
  final i0.Value<String?> collectionViewUrl;
  final i0.Value<String?> artworkUrl60;
  final i0.Value<int?> trackCount;
  final i0.Value<String?> copyright;
  final i0.Value<DateTime?> releaseDate;
  final i0.Value<String?> primaryGenreName;
  final i0.Value<i2.ListenStatus> listened;
  final i0.Value<int?> userRating;
  final i0.Value<int> collectionId;
  final i0.Value<DateTime> createdAt;
  const AlbumsCompanion({
    this.id = const i0.Value.absent(),
    this.artistName = const i0.Value.absent(),
    this.collectionName = const i0.Value.absent(),
    this.collectionViewUrl = const i0.Value.absent(),
    this.artworkUrl60 = const i0.Value.absent(),
    this.trackCount = const i0.Value.absent(),
    this.copyright = const i0.Value.absent(),
    this.releaseDate = const i0.Value.absent(),
    this.primaryGenreName = const i0.Value.absent(),
    this.listened = const i0.Value.absent(),
    this.userRating = const i0.Value.absent(),
    this.collectionId = const i0.Value.absent(),
    this.createdAt = const i0.Value.absent(),
  });
  AlbumsCompanion.insert({
    this.id = const i0.Value.absent(),
    this.artistName = const i0.Value.absent(),
    this.collectionName = const i0.Value.absent(),
    this.collectionViewUrl = const i0.Value.absent(),
    this.artworkUrl60 = const i0.Value.absent(),
    this.trackCount = const i0.Value.absent(),
    this.copyright = const i0.Value.absent(),
    this.releaseDate = const i0.Value.absent(),
    this.primaryGenreName = const i0.Value.absent(),
    required i2.ListenStatus listened,
    this.userRating = const i0.Value.absent(),
    required int collectionId,
    this.createdAt = const i0.Value.absent(),
  })  : listened = i0.Value(listened),
        collectionId = i0.Value(collectionId);
  static i0.Insertable<i1.Album> custom({
    i0.Expression<int>? id,
    i0.Expression<String>? artistName,
    i0.Expression<String>? collectionName,
    i0.Expression<String>? collectionViewUrl,
    i0.Expression<String>? artworkUrl60,
    i0.Expression<int>? trackCount,
    i0.Expression<String>? copyright,
    i0.Expression<DateTime>? releaseDate,
    i0.Expression<String>? primaryGenreName,
    i0.Expression<int>? listened,
    i0.Expression<int>? userRating,
    i0.Expression<int>? collectionId,
    i0.Expression<DateTime>? createdAt,
  }) {
    return i0.RawValuesInsertable({
      if (id != null) 'id': id,
      if (artistName != null) 'artist_name': artistName,
      if (collectionName != null) 'collection_name': collectionName,
      if (collectionViewUrl != null) 'collection_view_url': collectionViewUrl,
      if (artworkUrl60 != null) 'artwork_url60': artworkUrl60,
      if (trackCount != null) 'track_count': trackCount,
      if (copyright != null) 'copyright': copyright,
      if (releaseDate != null) 'release_date': releaseDate,
      if (primaryGenreName != null) 'primary_genre_name': primaryGenreName,
      if (listened != null) 'listened': listened,
      if (userRating != null) 'user_rating': userRating,
      if (collectionId != null) 'collection_id': collectionId,
      if (createdAt != null) 'created_at': createdAt,
    });
  }

  i1.AlbumsCompanion copyWith(
      {i0.Value<int>? id,
      i0.Value<String?>? artistName,
      i0.Value<String?>? collectionName,
      i0.Value<String?>? collectionViewUrl,
      i0.Value<String?>? artworkUrl60,
      i0.Value<int?>? trackCount,
      i0.Value<String?>? copyright,
      i0.Value<DateTime?>? releaseDate,
      i0.Value<String?>? primaryGenreName,
      i0.Value<i2.ListenStatus>? listened,
      i0.Value<int?>? userRating,
      i0.Value<int>? collectionId,
      i0.Value<DateTime>? createdAt}) {
    return i1.AlbumsCompanion(
      id: id ?? this.id,
      artistName: artistName ?? this.artistName,
      collectionName: collectionName ?? this.collectionName,
      collectionViewUrl: collectionViewUrl ?? this.collectionViewUrl,
      artworkUrl60: artworkUrl60 ?? this.artworkUrl60,
      trackCount: trackCount ?? this.trackCount,
      copyright: copyright ?? this.copyright,
      releaseDate: releaseDate ?? this.releaseDate,
      primaryGenreName: primaryGenreName ?? this.primaryGenreName,
      listened: listened ?? this.listened,
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
    if (artistName.present) {
      map['artist_name'] = i0.Variable<String>(artistName.value);
    }
    if (collectionName.present) {
      map['collection_name'] = i0.Variable<String>(collectionName.value);
    }
    if (collectionViewUrl.present) {
      map['collection_view_url'] = i0.Variable<String>(collectionViewUrl.value);
    }
    if (artworkUrl60.present) {
      map['artwork_url60'] = i0.Variable<String>(artworkUrl60.value);
    }
    if (trackCount.present) {
      map['track_count'] = i0.Variable<int>(trackCount.value);
    }
    if (copyright.present) {
      map['copyright'] = i0.Variable<String>(copyright.value);
    }
    if (releaseDate.present) {
      map['release_date'] = i0.Variable<DateTime>(releaseDate.value);
    }
    if (primaryGenreName.present) {
      map['primary_genre_name'] = i0.Variable<String>(primaryGenreName.value);
    }
    if (listened.present) {
      map['listened'] = i0.Variable<int>(
          i1.$AlbumsTable.$converterlistened.toSql(listened.value));
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
    return (StringBuffer('AlbumsCompanion(')
          ..write('id: $id, ')
          ..write('artistName: $artistName, ')
          ..write('collectionName: $collectionName, ')
          ..write('collectionViewUrl: $collectionViewUrl, ')
          ..write('artworkUrl60: $artworkUrl60, ')
          ..write('trackCount: $trackCount, ')
          ..write('copyright: $copyright, ')
          ..write('releaseDate: $releaseDate, ')
          ..write('primaryGenreName: $primaryGenreName, ')
          ..write('listened: $listened, ')
          ..write('userRating: $userRating, ')
          ..write('collectionId: $collectionId, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }
}
