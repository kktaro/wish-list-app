import 'dart:io';

import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'tables/wish_item_table.dart';

part 'database.g.dart';

@Riverpod(keepAlive: true)
AppDatabase appDatabase(AppDatabaseRef ref) {
  return AppDatabase();
}

@DriftDatabase(tables: [WishItems])
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(_openConnection());

  @override
  int get schemaVersion => 1;

  // 買いたいものリストの取得
  Future<List<WishItem>> getAllWishItems() {
    return select(wishItems).get();
  }

  // 買いたいものの追加
  Future<int> addWishItem(WishItemsCompanion entry) {
    return into(wishItems).insert(entry);
  }

  // 買いたいものの更新
  Future<bool> updateWishItem(WishItemsCompanion entry) {
    return update(wishItems).replace(entry);
  }

  // 買いたいものの削除
  Future<int> deleteWishItem(int id) {
    return (delete(wishItems)..where((t) => t.id.equals(id))).go();
  }

  // 最終確認日の更新
  Future<bool> updateLastCheckedAt(WishItem item) {
    return update(wishItems).replace(item.copyWith(
      lastCheckedAt: DateTime.now(),
    ));
  }

  // 通知対象のアイテムを取得（最終確認日から1ヶ月以上経過したもの）
  Future<List<WishItem>> getNotificationTargetItems() {
    final oneMonthAgo = DateTime.now().subtract(const Duration(days: 30));
    return (select(wishItems)..where((t) => t.lastCheckedAt.isSmallerThanValue(oneMonthAgo))).get();
  }
}

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, 'wish_list.db'));
    return NativeDatabase.createInBackground(file);
  });
}
