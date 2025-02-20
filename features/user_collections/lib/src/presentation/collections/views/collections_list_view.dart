import 'package:flutter/material.dart';
import 'package:next_database_service/next_database_service.dart';
import 'package:next_design_system/next_design_system.dart';

import '../../../application/entities/collection_entity.dart';

class CollectionsListView extends StatelessWidget {
  const CollectionsListView({
    super.key,
    required this.collections,
  });

  final List<CollectionEntity> collections;

  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        (context, index) {
          final collection = collections[index];

          return Padding(
            padding: const EdgeInsets.only(bottom: 12),
            child: AppListTile(
              leading: Container(
                width: 48,
                height: 48,
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  // color: Color.fromRGBO(33, 34, 36, 0.1), - for light
                  color: const Color(0xFF212224), // for dark
                  borderRadius: BorderRadius.circular(4),
                ),
                child: Center(
                  child: Icon(
                    switch (collection.type) {
                      CollectionTypes.book => Icons.book,
                      CollectionTypes.podcast => Icons.podcasts_outlined,
                      CollectionTypes.album => Icons.music_note,
                      CollectionTypes.movie => Icons.movie,
                      _ => Icons.all_inclusive,
                    },
                    size: 18,
                    // color: Colors.black, - for light
                    color: Colors.white, // for dark
                  ),
                ),
              ),
              title: collection.title,
              subtitle: 'N movies',
            ),
          );
        },
        childCount: collections.length,
      ),
    );
  }
}
