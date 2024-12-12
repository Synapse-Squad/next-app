import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:user_collections/user_collections.dart';

import '../../core/router/routes.dart';
import 'bloc/collections_bloc.dart';
import 'widgets/collections_view.dart';

class CollectionsPage extends StatelessWidget {
  const CollectionsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return CollectionsView(
      action: GestureDetector(
        onTap: () {
          CreateCollectionsRoute(
            (
              collectionsBloc: context.read<CollectionsBloc>(),
              createCollectionUseCase:
                  context.userCollectionsModule.createCollectionUseCase,
            ),
          ).push(context);
        },
        child: Card(
          color: Colors.white,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              'Add new list',
              style: TextStyle(color: Colors.black),
            ),
          ),
        ),
      ),
    );
  }
}
