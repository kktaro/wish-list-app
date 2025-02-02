import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:wish_list_app/presentation/view_models/wish_item_form_view_model.dart';

class WishItemFormPage extends ConsumerWidget {
  const WishItemFormPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(wishItemFormViewModelProvider);
    final notifier = ref.read(wishItemFormViewModelProvider.notifier);

    return Scaffold(
      appBar: AppBar(
        title: const Text('アイテムの追加'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            if (state.errorMessage != null)
              Padding(
                padding: const EdgeInsets.only(bottom: 16.0),
                child: Text(
                  state.errorMessage!,
                  style: TextStyle(color: Theme.of(context).colorScheme.error),
                ),
              ),
            TextFormField(
              decoration: const InputDecoration(
                labelText: '商品名',
                border: OutlineInputBorder(),
              ),
              onChanged: notifier.updateName,
            ),
            const SizedBox(height: 16),
            TextFormField(
              decoration: const InputDecoration(
                labelText: '価格',
                border: OutlineInputBorder(),
                prefixText: '¥',
              ),
              keyboardType: TextInputType.number,
              inputFormatters: [FilteringTextInputFormatter.digitsOnly],
              onChanged: notifier.updatePrice,
            ),
            const SizedBox(height: 16),
            TextFormField(
              decoration: const InputDecoration(
                labelText: 'メモ',
                border: OutlineInputBorder(),
              ),
              maxLines: 3,
              onChanged: notifier.updateMemo,
            ),
            const SizedBox(height: 24),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: state.isLoading
                    ? null
                    : () async {
                        final success = await notifier.submit();
                        if (success && context.mounted) {
                          Navigator.pop(context);
                        }
                      },
                child: state.isLoading
                    ? const SizedBox(
                        height: 24,
                        width: 24,
                        child: CircularProgressIndicator(),
                      )
                    : const Text('保存'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
