// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// ignore_for_file: type=lint
class $WishItemsTable extends WishItems
    with TableInfo<$WishItemsTable, WishItem> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $WishItemsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
      'name', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _priceMeta = const VerificationMeta('price');
  @override
  late final GeneratedColumn<int> price = GeneratedColumn<int>(
      'price', aliasedName, true,
      type: DriftSqlType.int, requiredDuringInsert: false);
  static const VerificationMeta _memoMeta = const VerificationMeta('memo');
  @override
  late final GeneratedColumn<String> memo = GeneratedColumn<String>(
      'memo', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _createdAtMeta =
      const VerificationMeta('createdAt');
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
      'created_at', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _lastCheckedAtMeta =
      const VerificationMeta('lastCheckedAt');
  @override
  late final GeneratedColumn<DateTime> lastCheckedAt =
      GeneratedColumn<DateTime>('last_checked_at', aliasedName, false,
          type: DriftSqlType.dateTime, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns =>
      [id, name, price, memo, createdAt, lastCheckedAt];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'wish_items';
  @override
  VerificationContext validateIntegrity(Insertable<WishItem> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('price')) {
      context.handle(
          _priceMeta, price.isAcceptableOrUnknown(data['price']!, _priceMeta));
    }
    if (data.containsKey('memo')) {
      context.handle(
          _memoMeta, memo.isAcceptableOrUnknown(data['memo']!, _memoMeta));
    }
    if (data.containsKey('created_at')) {
      context.handle(_createdAtMeta,
          createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta));
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    if (data.containsKey('last_checked_at')) {
      context.handle(
          _lastCheckedAtMeta,
          lastCheckedAt.isAcceptableOrUnknown(
              data['last_checked_at']!, _lastCheckedAtMeta));
    } else if (isInserting) {
      context.missing(_lastCheckedAtMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  WishItem map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return WishItem(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name'])!,
      price: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}price']),
      memo: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}memo']),
      createdAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}created_at'])!,
      lastCheckedAt: attachedDatabase.typeMapping.read(
          DriftSqlType.dateTime, data['${effectivePrefix}last_checked_at'])!,
    );
  }

  @override
  $WishItemsTable createAlias(String alias) {
    return $WishItemsTable(attachedDatabase, alias);
  }
}

class WishItem extends DataClass implements Insertable<WishItem> {
  final int id;
  final String name;
  final int? price;
  final String? memo;
  final DateTime createdAt;
  final DateTime lastCheckedAt;
  const WishItem(
      {required this.id,
      required this.name,
      this.price,
      this.memo,
      required this.createdAt,
      required this.lastCheckedAt});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['name'] = Variable<String>(name);
    if (!nullToAbsent || price != null) {
      map['price'] = Variable<int>(price);
    }
    if (!nullToAbsent || memo != null) {
      map['memo'] = Variable<String>(memo);
    }
    map['created_at'] = Variable<DateTime>(createdAt);
    map['last_checked_at'] = Variable<DateTime>(lastCheckedAt);
    return map;
  }

  WishItemsCompanion toCompanion(bool nullToAbsent) {
    return WishItemsCompanion(
      id: Value(id),
      name: Value(name),
      price:
          price == null && nullToAbsent ? const Value.absent() : Value(price),
      memo: memo == null && nullToAbsent ? const Value.absent() : Value(memo),
      createdAt: Value(createdAt),
      lastCheckedAt: Value(lastCheckedAt),
    );
  }

  factory WishItem.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return WishItem(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      price: serializer.fromJson<int?>(json['price']),
      memo: serializer.fromJson<String?>(json['memo']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      lastCheckedAt: serializer.fromJson<DateTime>(json['lastCheckedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String>(name),
      'price': serializer.toJson<int?>(price),
      'memo': serializer.toJson<String?>(memo),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'lastCheckedAt': serializer.toJson<DateTime>(lastCheckedAt),
    };
  }

  WishItem copyWith(
          {int? id,
          String? name,
          Value<int?> price = const Value.absent(),
          Value<String?> memo = const Value.absent(),
          DateTime? createdAt,
          DateTime? lastCheckedAt}) =>
      WishItem(
        id: id ?? this.id,
        name: name ?? this.name,
        price: price.present ? price.value : this.price,
        memo: memo.present ? memo.value : this.memo,
        createdAt: createdAt ?? this.createdAt,
        lastCheckedAt: lastCheckedAt ?? this.lastCheckedAt,
      );
  WishItem copyWithCompanion(WishItemsCompanion data) {
    return WishItem(
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
      price: data.price.present ? data.price.value : this.price,
      memo: data.memo.present ? data.memo.value : this.memo,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      lastCheckedAt: data.lastCheckedAt.present
          ? data.lastCheckedAt.value
          : this.lastCheckedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('WishItem(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('price: $price, ')
          ..write('memo: $memo, ')
          ..write('createdAt: $createdAt, ')
          ..write('lastCheckedAt: $lastCheckedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, name, price, memo, createdAt, lastCheckedAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is WishItem &&
          other.id == this.id &&
          other.name == this.name &&
          other.price == this.price &&
          other.memo == this.memo &&
          other.createdAt == this.createdAt &&
          other.lastCheckedAt == this.lastCheckedAt);
}

class WishItemsCompanion extends UpdateCompanion<WishItem> {
  final Value<int> id;
  final Value<String> name;
  final Value<int?> price;
  final Value<String?> memo;
  final Value<DateTime> createdAt;
  final Value<DateTime> lastCheckedAt;
  const WishItemsCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.price = const Value.absent(),
    this.memo = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.lastCheckedAt = const Value.absent(),
  });
  WishItemsCompanion.insert({
    this.id = const Value.absent(),
    required String name,
    this.price = const Value.absent(),
    this.memo = const Value.absent(),
    required DateTime createdAt,
    required DateTime lastCheckedAt,
  })  : name = Value(name),
        createdAt = Value(createdAt),
        lastCheckedAt = Value(lastCheckedAt);
  static Insertable<WishItem> custom({
    Expression<int>? id,
    Expression<String>? name,
    Expression<int>? price,
    Expression<String>? memo,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? lastCheckedAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (price != null) 'price': price,
      if (memo != null) 'memo': memo,
      if (createdAt != null) 'created_at': createdAt,
      if (lastCheckedAt != null) 'last_checked_at': lastCheckedAt,
    });
  }

  WishItemsCompanion copyWith(
      {Value<int>? id,
      Value<String>? name,
      Value<int?>? price,
      Value<String?>? memo,
      Value<DateTime>? createdAt,
      Value<DateTime>? lastCheckedAt}) {
    return WishItemsCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      price: price ?? this.price,
      memo: memo ?? this.memo,
      createdAt: createdAt ?? this.createdAt,
      lastCheckedAt: lastCheckedAt ?? this.lastCheckedAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (price.present) {
      map['price'] = Variable<int>(price.value);
    }
    if (memo.present) {
      map['memo'] = Variable<String>(memo.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (lastCheckedAt.present) {
      map['last_checked_at'] = Variable<DateTime>(lastCheckedAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('WishItemsCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('price: $price, ')
          ..write('memo: $memo, ')
          ..write('createdAt: $createdAt, ')
          ..write('lastCheckedAt: $lastCheckedAt')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $WishItemsTable wishItems = $WishItemsTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [wishItems];
}

typedef $$WishItemsTableCreateCompanionBuilder = WishItemsCompanion Function({
  Value<int> id,
  required String name,
  Value<int?> price,
  Value<String?> memo,
  required DateTime createdAt,
  required DateTime lastCheckedAt,
});
typedef $$WishItemsTableUpdateCompanionBuilder = WishItemsCompanion Function({
  Value<int> id,
  Value<String> name,
  Value<int?> price,
  Value<String?> memo,
  Value<DateTime> createdAt,
  Value<DateTime> lastCheckedAt,
});

class $$WishItemsTableFilterComposer
    extends Composer<_$AppDatabase, $WishItemsTable> {
  $$WishItemsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get name => $composableBuilder(
      column: $table.name, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get price => $composableBuilder(
      column: $table.price, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get memo => $composableBuilder(
      column: $table.memo, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get lastCheckedAt => $composableBuilder(
      column: $table.lastCheckedAt, builder: (column) => ColumnFilters(column));
}

class $$WishItemsTableOrderingComposer
    extends Composer<_$AppDatabase, $WishItemsTable> {
  $$WishItemsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get name => $composableBuilder(
      column: $table.name, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get price => $composableBuilder(
      column: $table.price, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get memo => $composableBuilder(
      column: $table.memo, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get lastCheckedAt => $composableBuilder(
      column: $table.lastCheckedAt,
      builder: (column) => ColumnOrderings(column));
}

class $$WishItemsTableAnnotationComposer
    extends Composer<_$AppDatabase, $WishItemsTable> {
  $$WishItemsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<int> get price =>
      $composableBuilder(column: $table.price, builder: (column) => column);

  GeneratedColumn<String> get memo =>
      $composableBuilder(column: $table.memo, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get lastCheckedAt => $composableBuilder(
      column: $table.lastCheckedAt, builder: (column) => column);
}

class $$WishItemsTableTableManager extends RootTableManager<
    _$AppDatabase,
    $WishItemsTable,
    WishItem,
    $$WishItemsTableFilterComposer,
    $$WishItemsTableOrderingComposer,
    $$WishItemsTableAnnotationComposer,
    $$WishItemsTableCreateCompanionBuilder,
    $$WishItemsTableUpdateCompanionBuilder,
    (WishItem, BaseReferences<_$AppDatabase, $WishItemsTable, WishItem>),
    WishItem,
    PrefetchHooks Function()> {
  $$WishItemsTableTableManager(_$AppDatabase db, $WishItemsTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$WishItemsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$WishItemsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$WishItemsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<String> name = const Value.absent(),
            Value<int?> price = const Value.absent(),
            Value<String?> memo = const Value.absent(),
            Value<DateTime> createdAt = const Value.absent(),
            Value<DateTime> lastCheckedAt = const Value.absent(),
          }) =>
              WishItemsCompanion(
            id: id,
            name: name,
            price: price,
            memo: memo,
            createdAt: createdAt,
            lastCheckedAt: lastCheckedAt,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required String name,
            Value<int?> price = const Value.absent(),
            Value<String?> memo = const Value.absent(),
            required DateTime createdAt,
            required DateTime lastCheckedAt,
          }) =>
              WishItemsCompanion.insert(
            id: id,
            name: name,
            price: price,
            memo: memo,
            createdAt: createdAt,
            lastCheckedAt: lastCheckedAt,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$WishItemsTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $WishItemsTable,
    WishItem,
    $$WishItemsTableFilterComposer,
    $$WishItemsTableOrderingComposer,
    $$WishItemsTableAnnotationComposer,
    $$WishItemsTableCreateCompanionBuilder,
    $$WishItemsTableUpdateCompanionBuilder,
    (WishItem, BaseReferences<_$AppDatabase, $WishItemsTable, WishItem>),
    WishItem,
    PrefetchHooks Function()>;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$WishItemsTableTableManager get wishItems =>
      $$WishItemsTableTableManager(_db, _db.wishItems);
}

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$appDatabaseHash() => r'3d3a397d2ea952fc020fce0506793a5564e93530';

/// See also [appDatabase].
@ProviderFor(appDatabase)
final appDatabaseProvider = Provider<AppDatabase>.internal(
  appDatabase,
  name: r'appDatabaseProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$appDatabaseHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef AppDatabaseRef = ProviderRef<AppDatabase>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
