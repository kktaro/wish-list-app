import 'package:flutter/material.dart';
import 'package:wish_list_app/data/database/database.dart';

class WishItemListTile extends StatelessWidget {
  const WishItemListTile({
    super.key,
    required this.item,
    required this.onEdit,
    required this.onDelete,
  });

  final WishItem item;
  final VoidCallback onEdit;
  final VoidCallback onDelete;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(item.name),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (item.price != null)
            Text(
              '¥${item.price}',
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          if (item.memo != null && item.memo!.isNotEmpty)
            Text(
              item.memo!,
              style: Theme.of(context).textTheme.bodySmall,
            ),
          Text(
            '最終確認日: ${_formatDate(item.lastCheckedAt)}',
            style: Theme.of(context).textTheme.bodySmall,
          ),
        ],
      ),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          IconButton(
            icon: const Icon(Icons.edit),
            onPressed: onEdit,
          ),
          IconButton(
            icon: const Icon(Icons.delete),
            onPressed: onDelete,
          ),
        ],
      ),
    );
  }

  String _formatDate(DateTime date) {
    return '${date.year}/${date.month}/${date.day}';
  }
}
