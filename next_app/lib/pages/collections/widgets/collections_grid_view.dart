import 'package:flutter/material.dart';
import 'package:next_app/core/extensions/collection_types_ext.dart';
import 'package:user_collections/user_collections.dart';

class CollectionsGridView extends StatelessWidget {
  const CollectionsGridView({
    super.key,
    required this.collections,
  });

  final List<CollectionEntity> collections;

  @override
  Widget build(BuildContext context) {
    final titleSize = MediaQuery.textScalerOf(context).scale(24) * 2;
    final dateSize = MediaQuery.textScalerOf(context).scale(20);

    return GridView.builder(
      padding: const EdgeInsets.only(bottom: 60),
      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: 300,
        mainAxisExtent: titleSize.ceil() + dateSize.ceil() + 88,
      ),
      itemBuilder: (context, index) {
        final collection = collections[index];

        return Container(
          padding: const EdgeInsets.all(8.0),
          margin: const EdgeInsets.all(8.0),
          decoration: BoxDecoration(
            color: Colors.white12,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              collection.type.icon,
              const SizedBox(height: 16),
              Text(
                collection.title,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  height: 24 / 20,
                ),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
              const SizedBox(height: 16), // 16
              Text(
                collection.createdAt.toIso8601String(),
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  height: 20 / 16,
                ),
                maxLines: 1,
              ),
            ],
          ),
        );
      },
      itemCount: collections.length,
    );
  }
}
