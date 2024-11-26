import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../features/collection/collection.dart';

class CreateCollectionPage extends StatelessWidget {
  const CreateCollectionPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<CreateCollectionBloc, CreateCollectionState>(
      listener: (BuildContext context, state) {
        if (state.status == CreateStatus.success) {
          context.read<CollectionsBloc>().add(
                CollectionsRequired(
                  type: CollectionTypes.all,
                ),
              );
          context.pop();
        }
      },
      child: const CreateCollectionView(),
    );
  }
}
