import 'package:drift/drift.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:wish_list_app/data/database/database.dart';
import 'package:wish_list_app/presentation/states/wish_item_form_state.dart';
import 'package:wish_list_app/utils/notifications/notification_manager.dart';

part 'wish_item_form_view_model.g.dart';

@riverpod
class WishItemFormViewModel extends _$WishItemFormViewModel {
  @override
  WishItemFormState build() => const WishItemFormState();

  void updateName(String name) {
    state = state.copyWith(name: name);
  }

  void updatePrice(String? priceString) {
    final price = int.tryParse(priceString ?? '');
    state = state.copyWith(price: price);
  }

  void updateMemo(String? memo) {
    state = state.copyWith(memo: memo);
  }

  Future<bool> submit() async {
    if (state.name.isEmpty) {
      state = state.copyWith(errorMessage: '商品名を入力してください');
      return false;
    }

    state = state.copyWith(isLoading: true, errorMessage: null);

    try {
      final database = ref.read(appDatabaseProvider);
      final notificationManager = ref.read(notificationManagerProvider);

      final companion = WishItemsCompanion(
        name: Value(state.name),
        price: state.price != null ? Value(state.price!) : const Value.absent(),
        memo: state.memo != null ? Value(state.memo!) : const Value.absent(),
        createdAt: Value(DateTime.now()),
        lastCheckedAt: Value(DateTime.now()),
      );

      final id = await database.addWishItem(companion);

      await notificationManager.scheduleCheckNotification(
        id: id,
        itemName: state.name,
      );

      return true;
    } catch (e) {
      state = state.copyWith(
        errorMessage: e.toString(),
        isLoading: false,
      );
      return false;
    }
  }
}
