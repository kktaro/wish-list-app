// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'wish_item_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$WishItemState {
  List<WishItem> get wishItems => throw _privateConstructorUsedError;
  bool get isLoading => throw _privateConstructorUsedError;
  String? get errorMessage => throw _privateConstructorUsedError;

  /// Create a copy of WishItemState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $WishItemStateCopyWith<WishItemState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WishItemStateCopyWith<$Res> {
  factory $WishItemStateCopyWith(
          WishItemState value, $Res Function(WishItemState) then) =
      _$WishItemStateCopyWithImpl<$Res, WishItemState>;
  @useResult
  $Res call({List<WishItem> wishItems, bool isLoading, String? errorMessage});
}

/// @nodoc
class _$WishItemStateCopyWithImpl<$Res, $Val extends WishItemState>
    implements $WishItemStateCopyWith<$Res> {
  _$WishItemStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of WishItemState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? wishItems = null,
    Object? isLoading = null,
    Object? errorMessage = freezed,
  }) {
    return _then(_value.copyWith(
      wishItems: null == wishItems
          ? _value.wishItems
          : wishItems // ignore: cast_nullable_to_non_nullable
              as List<WishItem>,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      errorMessage: freezed == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$WishItemStateImplCopyWith<$Res>
    implements $WishItemStateCopyWith<$Res> {
  factory _$$WishItemStateImplCopyWith(
          _$WishItemStateImpl value, $Res Function(_$WishItemStateImpl) then) =
      __$$WishItemStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<WishItem> wishItems, bool isLoading, String? errorMessage});
}

/// @nodoc
class __$$WishItemStateImplCopyWithImpl<$Res>
    extends _$WishItemStateCopyWithImpl<$Res, _$WishItemStateImpl>
    implements _$$WishItemStateImplCopyWith<$Res> {
  __$$WishItemStateImplCopyWithImpl(
      _$WishItemStateImpl _value, $Res Function(_$WishItemStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of WishItemState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? wishItems = null,
    Object? isLoading = null,
    Object? errorMessage = freezed,
  }) {
    return _then(_$WishItemStateImpl(
      wishItems: null == wishItems
          ? _value._wishItems
          : wishItems // ignore: cast_nullable_to_non_nullable
              as List<WishItem>,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      errorMessage: freezed == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$WishItemStateImpl implements _WishItemState {
  const _$WishItemStateImpl(
      {final List<WishItem> wishItems = const <WishItem>[],
      this.isLoading = false,
      this.errorMessage})
      : _wishItems = wishItems;

  final List<WishItem> _wishItems;
  @override
  @JsonKey()
  List<WishItem> get wishItems {
    if (_wishItems is EqualUnmodifiableListView) return _wishItems;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_wishItems);
  }

  @override
  @JsonKey()
  final bool isLoading;
  @override
  final String? errorMessage;

  @override
  String toString() {
    return 'WishItemState(wishItems: $wishItems, isLoading: $isLoading, errorMessage: $errorMessage)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$WishItemStateImpl &&
            const DeepCollectionEquality()
                .equals(other._wishItems, _wishItems) &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage));
  }

  @override
  int get hashCode => Object.hash(runtimeType,
      const DeepCollectionEquality().hash(_wishItems), isLoading, errorMessage);

  /// Create a copy of WishItemState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$WishItemStateImplCopyWith<_$WishItemStateImpl> get copyWith =>
      __$$WishItemStateImplCopyWithImpl<_$WishItemStateImpl>(this, _$identity);
}

abstract class _WishItemState implements WishItemState {
  const factory _WishItemState(
      {final List<WishItem> wishItems,
      final bool isLoading,
      final String? errorMessage}) = _$WishItemStateImpl;

  @override
  List<WishItem> get wishItems;
  @override
  bool get isLoading;
  @override
  String? get errorMessage;

  /// Create a copy of WishItemState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$WishItemStateImplCopyWith<_$WishItemStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
