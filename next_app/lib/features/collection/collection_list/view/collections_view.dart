import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/collections_bloc.dart';
import 'widgets/selectable_collection_types.dart';

class CollectionsView extends StatelessWidget {
  const CollectionsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: BlocBuilder<CollectionsBloc, CollectionsState>(
          builder: (context, state) {
            final body = switch (state) {
              CollectionsInitial() => const SizedBox.shrink(),
              CollectionsEmpty() => const SizedBox.shrink(),
              CollectionsSuccess(:var type, :var collections) =>
                GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 1.5,
                  ),
                  itemBuilder: (context, index) {
                    final collection = collections[index];

                    return Card(
                      color: Colors.white12,
                      borderOnForeground: false,
                      shadowColor: Colors.transparent,
                      surfaceTintColor: Colors.white12,
                      elevation: 0,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              collection.title,
                              style: TextStyle(color: Colors.white),
                            ),
                            Text(
                              collection.type.name,
                              style: TextStyle(color: Colors.white),
                            ),
                            Text(
                              collection.createdAt.toIso8601String(),
                              style: TextStyle(color: Colors.white),
                            ),
                          ],
                        ),
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
    );
  }
}
