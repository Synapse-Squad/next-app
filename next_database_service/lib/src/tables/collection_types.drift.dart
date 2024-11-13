// ignore_for_file: type=lint
import 'package:drift/drift.dart' as i0;
import 'package:next_database_service/src/tables/collection_types.drift.dart'
    as i1;
import 'package:next_database_service/src/tables/collection_types.dart' as i2;

class $CollectionTypesTable extends i2.CollectionTypes
    with i0.TableInfo<$CollectionTypesTable, i1.CollectionType> {
  @override
  final i0.GeneratedDatabase attachedDatabase;
  final String? _alias;
  $CollectionTypesTable(this.attachedDatabase, [this._alias]);
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
      type: i0.DriftSqlType.string, requiredDuringInsert: true);
  @override
  List<i0.GeneratedColumn> get $columns => [id, title];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'collection_types';
  @override
  i0.VerificationContext validateIntegrity(
      i0.Insertable<i1.CollectionType> instance,
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
    return context;
  }

  @override
  Set<i0.GeneratedColumn> get $primaryKey => {id};
  @override
  i1.CollectionType map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return i1.CollectionType(
      id: attachedDatabase.typeMapping
          .read(i0.DriftSqlType.int, data['${effectivePrefix}id'])!,
      title: attachedDatabase.typeMapping
          .read(i0.DriftSqlType.string, data['${effectivePrefix}title'])!,
    );
  }

  @override
  $CollectionTypesTable createAlias(String alias) {
    return $CollectionTypesTable(attachedDatabase, alias);
  }
}

class CollectionType extends i0.DataClass
    implements i0.Insertable<i1.CollectionType> {
  final int id;
  final String title;
  const CollectionType({required this.id, required this.title});
  @override
  Map<String, i0.Expression> toColumns(bool nullToAbsent) {
    final map = <String, i0.Expression>{};
    map['id'] = i0.Variable<int>(id);
    map['title'] = i0.Variable<String>(title);
    return map;
  }

  i1.CollectionTypesCompanion toCompanion(bool nullToAbsent) {
    return i1.CollectionTypesCompanion(
      id: i0.Value(id),
      title: i0.Value(title),
    );
  }

  factory CollectionType.fromJson(Map<String, dynamic> json,
      {i0.ValueSerializer? serializer}) {
    serializer ??= i0.driftRuntimeOptions.defaultSerializer;
    return CollectionType(
      id: serializer.fromJson<int>(json['id']),
      title: serializer.fromJson<String>(json['title']),
    );
  }
  @override
  Map<String, dynamic> toJson({i0.ValueSerializer? serializer}) {
    serializer ??= i0.driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'title': serializer.toJson<String>(title),
    };
  }

  i1.CollectionType copyWith({int? id, String? title}) => i1.CollectionType(
        id: id ?? this.id,
        title: title ?? this.title,
      );
  CollectionType copyWithCompanion(i1.CollectionTypesCompanion data) {
    return CollectionType(
      id: data.id.present ? data.id.value : this.id,
      title: data.title.present ? data.title.value : this.title,
    );
  }

  @override
  String toString() {
    return (StringBuffer('CollectionType(')
          ..write('id: $id, ')
          ..write('title: $title')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, title);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is i1.CollectionType &&
          other.id == this.id &&
          other.title == this.title);
}

class CollectionTypesCompanion extends i0.UpdateCompanion<i1.CollectionType> {
  final i0.Value<int> id;
  final i0.Value<String> title;
  const CollectionTypesCompanion({
    this.id = const i0.Value.absent(),
    this.title = const i0.Value.absent(),
  });
  CollectionTypesCompanion.insert({
    this.id = const i0.Value.absent(),
    required String title,
  }) : title = i0.Value(title);
  static i0.Insertable<i1.CollectionType> custom({
    i0.Expression<int>? id,
    i0.Expression<String>? title,
  }) {
    return i0.RawValuesInsertable({
      if (id != null) 'id': id,
      if (title != null) 'title': title,
    });
  }

  i1.CollectionTypesCompanion copyWith(
      {i0.Value<int>? id, i0.Value<String>? title}) {
    return i1.CollectionTypesCompanion(
      id: id ?? this.id,
      title: title ?? this.title,
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
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('CollectionTypesCompanion(')
          ..write('id: $id, ')
          ..write('title: $title')
          ..write(')'))
        .toString();
  }
}
