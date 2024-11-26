import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../features/collection/collection.dart';
import '../routing/routes.dart';
import 'scope/collections_scope.dart';

class CollectionsPage extends StatelessWidget {
  const CollectionsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return CollectionsScope(
      builder: (context) {
        return CollectionsView(
          action: GestureDetector(
            onTap: () {
              CreateCollectionsRoute(
                (
                  collectionsBloc: context.read<CollectionsBloc>(),
                  createBloc: context.read<CreateCollectionBloc>(),
                ),
              ).push(context);
            },
            child: Card(
              color: Colors.white12,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'Add new list',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
