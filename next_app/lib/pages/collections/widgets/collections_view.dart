import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:next_app/core/extensions/collection_types_ext.dart';

import '../bloc/collections_bloc.dart';
import 'selectable_collection_types.dart';

class CollectionsView extends StatelessWidget {
  const CollectionsView({
    super.key,
    this.action,
  });

  final Widget? action;

  @override
  Widget build(BuildContext context) {
    final titleScaler = MediaQuery.textScalerOf(context).scale(24) * 2;
    final dateScaler = MediaQuery.textScalerOf(context).scale(20);

    return Scaffold(
      body: SafeArea(
        child: BlocBuilder<CollectionsBloc, CollectionsState>(
          builder: (context, state) {
            final body = switch (state) {
              CollectionsInitial() => const SizedBox.shrink(),
              CollectionsEmpty() => const SizedBox.shrink(),
              CollectionsSuccess(:var type, :var collections) =>
                GridView.builder(
                  gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                    maxCrossAxisExtent: 300,
                    mainAxisExtent: titleScaler.ceil() + dateScaler.ceil() + 88,
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
                ),
            };

            return Column(
              children: [
                SelectableCollectionTypes(currentType: state.type),
                Expanded(child: body),
              ],
            );
          },
        ),
      ),
      floatingActionButton: action,
    );
  }
}
