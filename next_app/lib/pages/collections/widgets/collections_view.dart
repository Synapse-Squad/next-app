import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/collections_bloc.dart';
import 'collections_grid_view.dart';
import 'selectable_collection_types.dart';

class CollectionsView extends StatelessWidget {
  const CollectionsView({
    super.key,
    this.action,
  });

  final Widget? action;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: BlocBuilder<CollectionsBloc, CollectionsState>(
          builder: (context, state) {
            final body = switch (state) {
              DataInitial() ||
              DataEmpty() ||
              DataFailure() =>
                const SizedBox.shrink(),
              DataInProgress() => CupertinoActivityIndicator(),
              DataSuccess(:var data) => CollectionsGridView(collections: data),
            };

            return Column(
              children: [
                SelectableCollectionTypes(
                  onChanged: (value) {
                    if (value != null) {
                      context
                          .read<CollectionsBloc>()
                          .add(CollectionsRequired(type: value));
                    }
                  },
                ),
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
