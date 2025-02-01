import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:wish_list_app/data/database/database.dart';
import 'package:wish_list_app/presentation/states/wish_item_state.dart';
import 'package:wish_list_app/utils/notifications/notification_manager.dart';

part 'home_view_model.g.dart';

@riverpod
class HomeViewModel extends _$HomeViewModel {
  @override
  WishItemState build() {
    _loadWishItems();
    return const WishItemState();
  }

  Future<void> _loadWishItems() async {
    final database = ref.read(appDatabaseProvider);
    try {
      final wishItems = await database.getAllWishItems();
      state = state.copyWith(wishItems: wishItems, isLoading: false);
    } catch (e) {
      state = state.copyWith(
        errorMessage: e.toString(),
        isLoading: false,
      );
    }
  }

  Future<void> addWishItem(WishItemsCompanion entry) async {
    final database = ref.read(appDatabaseProvider);
    final notificationManager = ref.read(notificationManagerProvider);

    try {
      final id = await database.addWishItem(entry);

      // 通知のスケジュール
      await notificationManager.scheduleCheckNotification(
        id: id,
        itemName: entry.name.value,
      );

      await _loadWishItems();
    } catch (e) {
      state = state.copyWith(errorMessage: e.toString());
    }
  }

  Future<void> deleteWishItem(int id) async {
    final database = ref.read(appDatabaseProvider);
    final notificationManager = ref.read(notificationManagerProvider);

    try {
      await database.deleteWishItem(id);
      await notificationManager.cancelNotification(id);

      await _loadWishItems();
    } catch (e) {
      state = state.copyWith(errorMessage: e.toString());
    }
  }

  Future<void> updateLastCheckedAt(WishItem item) async {
    final database = ref.read(appDatabaseProvider);

    try {
      await database.updateLastCheckedAt(item);

      await _loadWishItems();
    } catch (e) {
      state = state.copyWith(errorMessage: e.toString());
    }
  }
}
