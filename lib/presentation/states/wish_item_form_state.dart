import 'package:freezed_annotation/freezed_annotation.dart';

part 'wish_item_form_state.freezed.dart';

@freezed
class WishItemFormState with _$WishItemFormState {
  const factory WishItemFormState({
    @Default('') String name,
    int? price,
    String? memo,
    @Default(false) bool isLoading,
    String? errorMessage,
  }) = _WishItemFormState;
}
