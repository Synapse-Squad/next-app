// ignore_for_file: type=lint
import 'package:drift/drift.dart' as i0;
import 'package:next_database_service/src/tables/user_collections.drift.dart'
    as i1;
import 'package:domain/src/core/enums/collection_types.dart' as i2;
import 'package:next_database_service/src/tables/user_collections.dart' as i3;
import 'package:drift/src/runtime/query_builder/query_builder.dart' as i4;

class $UserCollectionsTable extends i3.UserCollections
    with i0.TableInfo<$UserCollectionsTable, i1.UserCollection> {
  @override
  final i0.GeneratedDatabase attachedDatabase;
  final String? _alias;
  $UserCollectionsTable(this.attachedDatabase, [this._alias]);
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
      'title', aliasedName, false,
      additionalChecks: i0.GeneratedColumn.checkTextLength(),
      type: i0.DriftSqlType.string,
      requiredDuringInsert: true);
  static const i0.VerificationMeta _typeIdMeta =
      const i0.VerificationMeta('typeId');
  @override
  late final i0.GeneratedColumnWithTypeConverter<i2.CollectionTypes, int>
      typeId = i0.GeneratedColumn<int>('type_id', aliasedName, false,
              type: i0.DriftSqlType.int, requiredDuringInsert: true)
          .withConverter<i2.CollectionTypes>(
              i1.$UserCollectionsTable.$convertertypeId);
  static const i0.VerificationMeta _createdAtMeta =
      const i0.VerificationMeta('createdAt');
  @override
  late final i0.GeneratedColumn<DateTime> createdAt =
      i0.GeneratedColumn<DateTime>('created_at', aliasedName, false,
          type: i0.DriftSqlType.dateTime,
          requiredDuringInsert: false,
          defaultValue: i4.currentDateAndTime);
  @override
  List<i0.GeneratedColumn> get $columns => [id, title, typeId, createdAt];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'user_collections';
  @override
  i0.VerificationContext validateIntegrity(
      i0.Insertable<i1.UserCollection> instance,
      {bool isInserting = false}) {
    final context = i0.VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('title')) {
      context.handle(
          _titleMeta, title.isAcceptableOrUnknown(data['title']!, _titleMeta));
    } else if (isInserting) {
      context.missing(_titleMeta);
    }
    context.handle(_typeIdMeta, const i0.VerificationResult.success());
    if (data.containsKey('created_at')) {
      context.handle(_createdAtMeta,
          createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta));
    }
    return context;
  }

  @override
  Set<i0.GeneratedColumn> get $primaryKey => {id};
  @override
  List<Set<i0.GeneratedColumn>> get uniqueKeys => [
        {title, typeId},
      ];
  @override
  i1.UserCollection map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return i1.UserCollection(
      id: attachedDatabase.typeMapping
          .read(i0.DriftSqlType.int, data['${effectivePrefix}id'])!,
      title: attachedDatabase.typeMapping
          .read(i0.DriftSqlType.string, data['${effectivePrefix}title'])!,
      typeId: i1.$UserCollectionsTable.$convertertypeId.fromSql(attachedDatabase
          .typeMapping
          .read(i0.DriftSqlType.int, data['${effectivePrefix}type_id'])!),
      createdAt: attachedDatabase.typeMapping.read(
          i0.DriftSqlType.dateTime, data['${effectivePrefix}created_at'])!,
    );
  }

  @override
  $UserCollectionsTable createAlias(String alias) {
    return $UserCollectionsTable(attachedDatabase, alias);
  }

  static i0.JsonTypeConverter2<i2.CollectionTypes, int, int> $convertertypeId =
      const i0.EnumIndexConverter<i2.CollectionTypes>(
          i2.CollectionTypes.values);
}

class UserCollection extends i0.DataClass
    implements i0.Insertable<i1.UserCollection> {
  final int id;
  final String title;
  final i2.CollectionTypes typeId;
  final DateTime createdAt;
  const UserCollection(
      {required this.id,
      required this.title,
      required this.typeId,
      required this.createdAt});
  @override
  Map<String, i0.Expression> toColumns(bool nullToAbsent) {
    final map = <String, i0.Expression>{};
    map['id'] = i0.Variable<int>(id);
    map['title'] = i0.Variable<String>(title);
    {
      map['type_id'] = i0.Variable<int>(
          i1.$UserCollectionsTable.$convertertypeId.toSql(typeId));
    }
    map['created_at'] = i0.Variable<DateTime>(createdAt);
    return map;
  }

  i1.UserCollectionsCompanion toCompanion(bool nullToAbsent) {
    return i1.UserCollectionsCompanion(
      id: i0.Value(id),
      title: i0.Value(title),
      typeId: i0.Value(typeId),
      createdAt: i0.Value(createdAt),
    );
  }

  factory UserCollection.fromJson(Map<String, dynamic> json,
      {i0.ValueSerializer? serializer}) {
    serializer ??= i0.driftRuntimeOptions.defaultSerializer;
    return UserCollection(
      id: serializer.fromJson<int>(json['id']),
      title: serializer.fromJson<String>(json['title']),
      typeId: i1.$UserCollectionsTable.$convertertypeId
          .fromJson(serializer.fromJson<int>(json['typeId'])),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({i0.ValueSerializer? serializer}) {
    serializer ??= i0.driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'title': serializer.toJson<String>(title),
      'typeId': serializer.toJson<int>(
          i1.$UserCollectionsTable.$convertertypeId.toJson(typeId)),
      'createdAt': serializer.toJson<DateTime>(createdAt),
    };
  }

  i1.UserCollection copyWith(
          {int? id,
          String? title,
          i2.CollectionTypes? typeId,
          DateTime? createdAt}) =>
      i1.UserCollection(
        id: id ?? this.id,
        title: title ?? this.title,
        typeId: typeId ?? this.typeId,
        createdAt: createdAt ?? this.createdAt,
      );
  UserCollection copyWithCompanion(i1.UserCollectionsCompanion data) {
    return UserCollection(
      id: data.id.present ? data.id.value : this.id,
      title: data.title.present ? data.title.value : this.title,
      typeId: data.typeId.present ? data.typeId.value : this.typeId,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('UserCollection(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('typeId: $typeId, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, title, typeId, createdAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is i1.UserCollection &&
          other.id == this.id &&
          other.title == this.title &&
          other.typeId == this.typeId &&
          other.createdAt == this.createdAt);
}

class UserCollectionsCompanion extends i0.UpdateCompanion<i1.UserCollection> {
  final i0.Value<int> id;
  final i0.Value<String> title;
  final i0.Value<i2.CollectionTypes> typeId;
  final i0.Value<DateTime> createdAt;
  const UserCollectionsCompanion({
    this.id = const i0.Value.absent(),
    this.title = const i0.Value.absent(),
    this.typeId = const i0.Value.absent(),
    this.createdAt = const i0.Value.absent(),
  });
  UserCollectionsCompanion.insert({
    this.id = const i0.Value.absent(),
    required String title,
    required i2.CollectionTypes typeId,
    this.createdAt = const i0.Value.absent(),
  })  : title = i0.Value(title),
        typeId = i0.Value(typeId);
  static i0.Insertable<i1.UserCollection> custom({
    i0.Expression<int>? id,
    i0.Expression<String>? title,
    i0.Expression<int>? typeId,
    i0.Expression<DateTime>? createdAt,
  }) {
    return i0.RawValuesInsertable({
      if (id != null) 'id': id,
      if (title != null) 'title': title,
      if (typeId != null) 'type_id': typeId,
      if (createdAt != null) 'created_at': createdAt,
    });
  }

  i1.UserCollectionsCompanion copyWith(
      {i0.Value<int>? id,
      i0.Value<String>? title,
      i0.Value<i2.CollectionTypes>? typeId,
      i0.Value<DateTime>? createdAt}) {
    return i1.UserCollectionsCompanion(
      id: id ?? this.id,
      title: title ?? this.title,
      typeId: typeId ?? this.typeId,
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
    if (typeId.present) {
      map['type_id'] = i0.Variable<int>(
          i1.$UserCollectionsTable.$convertertypeId.toSql(typeId.value));
    }
    if (createdAt.present) {
      map['created_at'] = i0.Variable<DateTime>(createdAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('UserCollectionsCompanion(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('typeId: $typeId, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }
}
