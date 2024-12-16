import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:next_design_system/next_design_system.dart';

import '../bloc/collections_bloc.dart';
import 'collection_type_selector.dart';
import 'collections_list_view.dart';

class CollectionsView extends StatelessWidget {
  const CollectionsView({
    super.key,
    this.action,
  });

  final Widget? action;

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      appBar: AppBar(
        forceMaterialTransparency: true,
        title: AppText(
          'Home',
          style: context.typography.titleLarge,
          color: context.typographyTheme.title,
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.search,
              color: Colors.white,
            ),
            padding: const EdgeInsets.all(8),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.grid_view,
              color: Colors.white,
            ),
            padding: const EdgeInsets.all(8),
          ),
        ],
      ),
      body: SafeArea(
        child: BlocBuilder<CollectionsBloc, CollectionsState>(
          builder: (context, state) {
            final body = switch (state) {
              CollectionsLoadInitial() ||
              CollectionsEmpty() ||
              CollectionsLoadFailure() =>
                const SizedBox.shrink(),
              CollectionsLoadInProgress() =>
                const Center(child: const CircularProgressIndicator()),
              CollectionsLoadSuccess(:var collections) =>
                CollectionsListView(collections: collections),
            };

            return Column(
              children: [
                CollectionTypeSelector(
                  onChanged: (value) {
                    if (value != null) {
                      context
                          .read<CollectionsBloc>()
                          .add(CollectionsRequired(type: value));
                    }
                  },
                ),
                const SizedBox(height: AppSpacing.xl3),
                Expanded(child: body),
              ],
            );
          },
        ),
      ),
    );
  }
}
