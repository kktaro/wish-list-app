import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:wish_list_app/data/database/database.dart';
import 'package:wish_list_app/presentation/states/wish_item_state.dart';
import 'package:wish_list_app/utils/notifications/notification_manager.dart';

part 'home_view_model.g.dart';

@riverpod
class HomeViewModel extends _$HomeViewModel {
  @override
  Future<WishItemState> build() async {
    final database = ref.read(appDatabaseProvider);
    final wishItems = await database.getAllWishItems();
    return WishItemState(wishItems: wishItems);
  }

  Future<void> addWishItem(WishItemsCompanion entry) async {
    final database = ref.read(appDatabaseProvider);
    final notificationManager = ref.read(notificationManagerProvider);

    state = const AsyncLoading();

    state = await AsyncValue.guard(() async {
      final id = await database.addWishItem(entry);

      // 通知のスケジュール
      await notificationManager.scheduleCheckNotification(
        id: id,
        itemName: entry.name.value,
      );

      final wishItems = await database.getAllWishItems();
      return WishItemState(wishItems: wishItems);
    });
  }

  Future<void> deleteWishItem(int id) async {
    final database = ref.read(appDatabaseProvider);
    final notificationManager = ref.read(notificationManagerProvider);

    state = const AsyncLoading();

    state = await AsyncValue.guard(() async {
      await database.deleteWishItem(id);
      await notificationManager.cancelNotification(id);

      final wishItems = await database.getAllWishItems();
      return WishItemState(wishItems: wishItems);
    });
  }

  Future<void> updateLastCheckedAt(WishItem item) async {
    final database = ref.read(appDatabaseProvider);

    state = const AsyncLoading();

    state = await AsyncValue.guard(() async {
      await database.updateLastCheckedAt(item);

      final wishItems = await database.getAllWishItems();
      return WishItemState(wishItems: wishItems);
    });
  }
}
