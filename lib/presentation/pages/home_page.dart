import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:wish_list_app/presentation/view_models/home_view_model.dart';
import 'package:wish_list_app/presentation/widgets/wish_item_list_tile.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final wishItemsAsyncValue = ref.watch(homeViewModelProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('買いたいものリスト'),
      ),
      body: wishItemsAsyncValue.when(
        data: (state) {
          if (state.wishItems.isEmpty) {
            return const Center(
              child: Text('買いたいものリストが空です'),
            );
          }

          return ListView.builder(
            itemCount: state.wishItems.length,
            itemBuilder: (context, index) {
              final item = state.wishItems[index];
              return WishItemListTile(
                item: item,
                onEdit: () {
                  // TODO: 編集画面への遷移を実装
                },
                onDelete: () async {
                  final shouldDelete = await showDialog<bool>(
                    context: context,
                    builder: (context) => AlertDialog(
                      title: const Text('確認'),
                      content: Text('${item.name}を削除しますか？'),
                      actions: [
                        TextButton(
                          onPressed: () => Navigator.pop(context, false),
                          child: const Text('キャンセル'),
                        ),
                        TextButton(
                          onPressed: () => Navigator.pop(context, true),
                          child: const Text('削除'),
                        ),
                      ],
                    ),
                  );

                  if (shouldDelete == true) {
                    ref.read(homeViewModelProvider.notifier).deleteWishItem(item.id);
                  }
                },
              );
            },
          );
        },
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (error, stackTrace) => Center(child: Text('エラーが発生しました: $error')),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // TODO: 追加画面への遷移を実装
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
