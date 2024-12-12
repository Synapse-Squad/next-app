import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:next_app/core/extensions/localizations_ext.dart';
import 'package:user_collections/user_collections.dart';

import '../collections/bloc/collections_bloc.dart';
import 'bloc/create_collection_bloc.dart';
import 'widgets/create_collection_view.dart';

class CreateCollectionPage extends StatelessWidget {
  const CreateCollectionPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<CreateCollectionBloc, CreateCollectionState>(
      listener: (BuildContext context, state) {
        print(state);
        if (state is DataSuccess) {
          context.read<CollectionsBloc>().add(CollectionsRequired());
          context.pop();
        }

        if (state is CreateCollectionFailure) {
          if (state.failure is SameCollectionFoundFailure) {
            ScaffoldMessenger.of(context)
              ..hideCurrentSnackBar()
              ..showSnackBar(
                SnackBar(
                  backgroundColor: Colors.red,
                  content: Text(
                    context.loc.youCantCreateSameCollection,
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              );
          }
        }
      },
      child: const CreateCollectionView(),
    );
  }
}
