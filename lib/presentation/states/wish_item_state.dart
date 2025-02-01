import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:wish_list_app/data/database/database.dart';

part 'wish_item_state.freezed.dart';

@freezed
class WishItemState with _$WishItemState {
  const factory WishItemState({
    @Default(<WishItem>[]) List<WishItem> wishItems,
    @Default(false) bool isLoading,
    String? errorMessage,
  }) = _WishItemState;
}
