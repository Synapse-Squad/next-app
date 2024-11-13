// ignore_for_file: type=lint
import 'package:drift/drift.dart' as i0;
import 'package:next_database_service/src/tables/movies.drift.dart' as i1;
import 'package:next_database_service/src/tables/movies.dart' as i2;

class $MoviesTable extends i2.Movies with i0.TableInfo<$MoviesTable, i1.Movie> {
  @override
  final i0.GeneratedDatabase attachedDatabase;
  final String? _alias;
  $MoviesTable(this.attachedDatabase, [this._alias]);
  static const i0.VerificationMeta _idMeta = const i0.VerificationMeta('id');
  @override
  late final i0.GeneratedColumn<int> id = i0.GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: i0.DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          i0.GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const i0.VerificationMeta _posterPathMeta =
      const i0.VerificationMeta('posterPath');
  @override
  late final i0.GeneratedColumn<String> posterPath = i0.GeneratedColumn<String>(
      'poster_path', aliasedName, false,
      type: i0.DriftSqlType.string, requiredDuringInsert: true);
  static const i0.VerificationMeta _overviewMeta =
      const i0.VerificationMeta('overview');
  @override
  late final i0.GeneratedColumn<String> overview = i0.GeneratedColumn<String>(
      'overview', aliasedName, false,
      type: i0.DriftSqlType.string, requiredDuringInsert: true);
  static const i0.VerificationMeta _titleMeta =
      const i0.VerificationMeta('title');
  @override
  late final i0.GeneratedColumn<String> title = i0.GeneratedColumn<String>(
      'title', aliasedName, false,
      type: i0.DriftSqlType.string, requiredDuringInsert: true);
  static const i0.VerificationMeta _releaseDateMeta =
      const i0.VerificationMeta('releaseDate');
  @override
  late final i0.GeneratedColumn<DateTime> releaseDate =
      i0.GeneratedColumn<DateTime>('release_date', aliasedName, false,
          type: i0.DriftSqlType.dateTime, requiredDuringInsert: true);
  static const i0.VerificationMeta _voteAverageMeta =
      const i0.VerificationMeta('voteAverage');
  @override
  late final i0.GeneratedColumn<double> voteAverage =
      i0.GeneratedColumn<double>('vote_average', aliasedName, false,
          type: i0.DriftSqlType.double, requiredDuringInsert: true);
  static const i0.VerificationMeta _watchedMeta =
      const i0.VerificationMeta('watched');
  @override
  late final i0.GeneratedColumn<int> watched = i0.GeneratedColumn<int>(
      'watched', aliasedName, false,
      type: i0.DriftSqlType.int, requiredDuringInsert: true);
  static const i0.VerificationMeta _userRatingMeta =
      const i0.VerificationMeta('userRating');
  @override
  late final i0.GeneratedColumn<int> userRating = i0.GeneratedColumn<int>(
      'user_rating', aliasedName, false,
      type: i0.DriftSqlType.int, requiredDuringInsert: true);
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
        posterPath,
        overview,
        title,
        releaseDate,
        voteAverage,
        watched,
        userRating,
        collectionId
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'movies';
  @override
  i0.VerificationContext validateIntegrity(i0.Insertable<i1.Movie> instance,
      {bool isInserting = false}) {
    final context = i0.VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('poster_path')) {
      context.handle(
          _posterPathMeta,
          posterPath.isAcceptableOrUnknown(
              data['poster_path']!, _posterPathMeta));
    } else if (isInserting) {
      context.missing(_posterPathMeta);
    }
    if (data.containsKey('overview')) {
      context.handle(_overviewMeta,
          overview.isAcceptableOrUnknown(data['overview']!, _overviewMeta));
    } else if (isInserting) {
      context.missing(_overviewMeta);
    }
    if (data.containsKey('title')) {
      context.handle(
          _titleMeta, title.isAcceptableOrUnknown(data['title']!, _titleMeta));
    } else if (isInserting) {
      context.missing(_titleMeta);
    }
    if (data.containsKey('release_date')) {
      context.handle(
          _releaseDateMeta,
          releaseDate.isAcceptableOrUnknown(
              data['release_date']!, _releaseDateMeta));
    } else if (isInserting) {
      context.missing(_releaseDateMeta);
    }
    if (data.containsKey('vote_average')) {
      context.handle(
          _voteAverageMeta,
          voteAverage.isAcceptableOrUnknown(
              data['vote_average']!, _voteAverageMeta));
    } else if (isInserting) {
      context.missing(_voteAverageMeta);
    }
    if (data.containsKey('watched')) {
      context.handle(_watchedMeta,
          watched.isAcceptableOrUnknown(data['watched']!, _watchedMeta));
    } else if (isInserting) {
      context.missing(_watchedMeta);
    }
    if (data.containsKey('user_rating')) {
      context.handle(
          _userRatingMeta,
          userRating.isAcceptableOrUnknown(
              data['user_rating']!, _userRatingMeta));
    } else if (isInserting) {
      context.missing(_userRatingMeta);
    }
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
  i1.Movie map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return i1.Movie(
      id: attachedDatabase.typeMapping
          .read(i0.DriftSqlType.int, data['${effectivePrefix}id'])!,
      posterPath: attachedDatabase.typeMapping
          .read(i0.DriftSqlType.string, data['${effectivePrefix}poster_path'])!,
      overview: attachedDatabase.typeMapping
          .read(i0.DriftSqlType.string, data['${effectivePrefix}overview'])!,
      title: attachedDatabase.typeMapping
          .read(i0.DriftSqlType.string, data['${effectivePrefix}title'])!,
      releaseDate: attachedDatabase.typeMapping.read(
          i0.DriftSqlType.dateTime, data['${effectivePrefix}release_date'])!,
      voteAverage: attachedDatabase.typeMapping.read(
          i0.DriftSqlType.double, data['${effectivePrefix}vote_average'])!,
      watched: attachedDatabase.typeMapping
          .read(i0.DriftSqlType.int, data['${effectivePrefix}watched'])!,
      userRating: attachedDatabase.typeMapping
          .read(i0.DriftSqlType.int, data['${effectivePrefix}user_rating'])!,
      collectionId: attachedDatabase.typeMapping
          .read(i0.DriftSqlType.int, data['${effectivePrefix}collection_id'])!,
    );
  }

  @override
  $MoviesTable createAlias(String alias) {
    return $MoviesTable(attachedDatabase, alias);
  }
}

class Movie extends i0.DataClass implements i0.Insertable<i1.Movie> {
  final int id;
  final String posterPath;
  final String overview;
  final String title;
  final DateTime releaseDate;
  final double voteAverage;
  final int watched;
  final int userRating;
  final int collectionId;
  const Movie(
      {required this.id,
      required this.posterPath,
      required this.overview,
      required this.title,
      required this.releaseDate,
      required this.voteAverage,
      required this.watched,
      required this.userRating,
      required this.collectionId});
  @override
  Map<String, i0.Expression> toColumns(bool nullToAbsent) {
    final map = <String, i0.Expression>{};
    map['id'] = i0.Variable<int>(id);
    map['poster_path'] = i0.Variable<String>(posterPath);
    map['overview'] = i0.Variable<String>(overview);
    map['title'] = i0.Variable<String>(title);
    map['release_date'] = i0.Variable<DateTime>(releaseDate);
    map['vote_average'] = i0.Variable<double>(voteAverage);
    map['watched'] = i0.Variable<int>(watched);
    map['user_rating'] = i0.Variable<int>(userRating);
    map['collection_id'] = i0.Variable<int>(collectionId);
    return map;
  }

  i1.MoviesCompanion toCompanion(bool nullToAbsent) {
    return i1.MoviesCompanion(
      id: i0.Value(id),
      posterPath: i0.Value(posterPath),
      overview: i0.Value(overview),
      title: i0.Value(title),
      releaseDate: i0.Value(releaseDate),
      voteAverage: i0.Value(voteAverage),
      watched: i0.Value(watched),
      userRating: i0.Value(userRating),
      collectionId: i0.Value(collectionId),
    );
  }

  factory Movie.fromJson(Map<String, dynamic> json,
      {i0.ValueSerializer? serializer}) {
    serializer ??= i0.driftRuntimeOptions.defaultSerializer;
    return Movie(
      id: serializer.fromJson<int>(json['id']),
      posterPath: serializer.fromJson<String>(json['posterPath']),
      overview: serializer.fromJson<String>(json['overview']),
      title: serializer.fromJson<String>(json['title']),
      releaseDate: serializer.fromJson<DateTime>(json['releaseDate']),
      voteAverage: serializer.fromJson<double>(json['voteAverage']),
      watched: serializer.fromJson<int>(json['watched']),
      userRating: serializer.fromJson<int>(json['userRating']),
      collectionId: serializer.fromJson<int>(json['collectionId']),
    );
  }
  @override
  Map<String, dynamic> toJson({i0.ValueSerializer? serializer}) {
    serializer ??= i0.driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'posterPath': serializer.toJson<String>(posterPath),
      'overview': serializer.toJson<String>(overview),
      'title': serializer.toJson<String>(title),
      'releaseDate': serializer.toJson<DateTime>(releaseDate),
      'voteAverage': serializer.toJson<double>(voteAverage),
      'watched': serializer.toJson<int>(watched),
      'userRating': serializer.toJson<int>(userRating),
      'collectionId': serializer.toJson<int>(collectionId),
    };
  }

  i1.Movie copyWith(
          {int? id,
          String? posterPath,
          String? overview,
          String? title,
          DateTime? releaseDate,
          double? voteAverage,
          int? watched,
          int? userRating,
          int? collectionId}) =>
      i1.Movie(
        id: id ?? this.id,
        posterPath: posterPath ?? this.posterPath,
        overview: overview ?? this.overview,
        title: title ?? this.title,
        releaseDate: releaseDate ?? this.releaseDate,
        voteAverage: voteAverage ?? this.voteAverage,
        watched: watched ?? this.watched,
        userRating: userRating ?? this.userRating,
        collectionId: collectionId ?? this.collectionId,
      );
  Movie copyWithCompanion(i1.MoviesCompanion data) {
    return Movie(
      id: data.id.present ? data.id.value : this.id,
      posterPath:
          data.posterPath.present ? data.posterPath.value : this.posterPath,
      overview: data.overview.present ? data.overview.value : this.overview,
      title: data.title.present ? data.title.value : this.title,
      releaseDate:
          data.releaseDate.present ? data.releaseDate.value : this.releaseDate,
      voteAverage:
          data.voteAverage.present ? data.voteAverage.value : this.voteAverage,
      watched: data.watched.present ? data.watched.value : this.watched,
      userRating:
          data.userRating.present ? data.userRating.value : this.userRating,
      collectionId: data.collectionId.present
          ? data.collectionId.value
          : this.collectionId,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Movie(')
          ..write('id: $id, ')
          ..write('posterPath: $posterPath, ')
          ..write('overview: $overview, ')
          ..write('title: $title, ')
          ..write('releaseDate: $releaseDate, ')
          ..write('voteAverage: $voteAverage, ')
          ..write('watched: $watched, ')
          ..write('userRating: $userRating, ')
          ..write('collectionId: $collectionId')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, posterPath, overview, title, releaseDate,
      voteAverage, watched, userRating, collectionId);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is i1.Movie &&
          other.id == this.id &&
          other.posterPath == this.posterPath &&
          other.overview == this.overview &&
          other.title == this.title &&
          other.releaseDate == this.releaseDate &&
          other.voteAverage == this.voteAverage &&
          other.watched == this.watched &&
          other.userRating == this.userRating &&
          other.collectionId == this.collectionId);
}

class MoviesCompanion extends i0.UpdateCompanion<i1.Movie> {
  final i0.Value<int> id;
  final i0.Value<String> posterPath;
  final i0.Value<String> overview;
  final i0.Value<String> title;
  final i0.Value<DateTime> releaseDate;
  final i0.Value<double> voteAverage;
  final i0.Value<int> watched;
  final i0.Value<int> userRating;
  final i0.Value<int> collectionId;
  const MoviesCompanion({
    this.id = const i0.Value.absent(),
    this.posterPath = const i0.Value.absent(),
    this.overview = const i0.Value.absent(),
    this.title = const i0.Value.absent(),
    this.releaseDate = const i0.Value.absent(),
    this.voteAverage = const i0.Value.absent(),
    this.watched = const i0.Value.absent(),
    this.userRating = const i0.Value.absent(),
    this.collectionId = const i0.Value.absent(),
  });
  MoviesCompanion.insert({
    this.id = const i0.Value.absent(),
    required String posterPath,
    required String overview,
    required String title,
    required DateTime releaseDate,
    required double voteAverage,
    required int watched,
    required int userRating,
    required int collectionId,
  })  : posterPath = i0.Value(posterPath),
        overview = i0.Value(overview),
        title = i0.Value(title),
        releaseDate = i0.Value(releaseDate),
        voteAverage = i0.Value(voteAverage),
        watched = i0.Value(watched),
        userRating = i0.Value(userRating),
        collectionId = i0.Value(collectionId);
  static i0.Insertable<i1.Movie> custom({
    i0.Expression<int>? id,
    i0.Expression<String>? posterPath,
    i0.Expression<String>? overview,
    i0.Expression<String>? title,
    i0.Expression<DateTime>? releaseDate,
    i0.Expression<double>? voteAverage,
    i0.Expression<int>? watched,
    i0.Expression<int>? userRating,
    i0.Expression<int>? collectionId,
  }) {
    return i0.RawValuesInsertable({
      if (id != null) 'id': id,
      if (posterPath != null) 'poster_path': posterPath,
      if (overview != null) 'overview': overview,
      if (title != null) 'title': title,
      if (releaseDate != null) 'release_date': releaseDate,
      if (voteAverage != null) 'vote_average': voteAverage,
      if (watched != null) 'watched': watched,
      if (userRating != null) 'user_rating': userRating,
      if (collectionId != null) 'collection_id': collectionId,
    });
  }

  i1.MoviesCompanion copyWith(
      {i0.Value<int>? id,
      i0.Value<String>? posterPath,
      i0.Value<String>? overview,
      i0.Value<String>? title,
      i0.Value<DateTime>? releaseDate,
      i0.Value<double>? voteAverage,
      i0.Value<int>? watched,
      i0.Value<int>? userRating,
      i0.Value<int>? collectionId}) {
    return i1.MoviesCompanion(
      id: id ?? this.id,
      posterPath: posterPath ?? this.posterPath,
      overview: overview ?? this.overview,
      title: title ?? this.title,
      releaseDate: releaseDate ?? this.releaseDate,
      voteAverage: voteAverage ?? this.voteAverage,
      watched: watched ?? this.watched,
      userRating: userRating ?? this.userRating,
      collectionId: collectionId ?? this.collectionId,
    );
  }

  @override
  Map<String, i0.Expression> toColumns(bool nullToAbsent) {
    final map = <String, i0.Expression>{};
    if (id.present) {
      map['id'] = i0.Variable<int>(id.value);
    }
    if (posterPath.present) {
      map['poster_path'] = i0.Variable<String>(posterPath.value);
    }
    if (overview.present) {
      map['overview'] = i0.Variable<String>(overview.value);
    }
    if (title.present) {
      map['title'] = i0.Variable<String>(title.value);
    }
    if (releaseDate.present) {
      map['release_date'] = i0.Variable<DateTime>(releaseDate.value);
    }
    if (voteAverage.present) {
      map['vote_average'] = i0.Variable<double>(voteAverage.value);
    }
    if (watched.present) {
      map['watched'] = i0.Variable<int>(watched.value);
    }
    if (userRating.present) {
      map['user_rating'] = i0.Variable<int>(userRating.value);
    }
    if (collectionId.present) {
      map['collection_id'] = i0.Variable<int>(collectionId.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('MoviesCompanion(')
          ..write('id: $id, ')
          ..write('posterPath: $posterPath, ')
          ..write('overview: $overview, ')
          ..write('title: $title, ')
          ..write('releaseDate: $releaseDate, ')
          ..write('voteAverage: $voteAverage, ')
          ..write('watched: $watched, ')
          ..write('userRating: $userRating, ')
          ..write('collectionId: $collectionId')
          ..write(')'))
        .toString();
  }
}
