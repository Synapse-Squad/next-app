import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../collections/bloc/collections_bloc.dart';
import 'bloc/create_collection_bloc.dart';
import 'widgets/create_collection_view.dart';

class CreateCollectionPage extends StatelessWidget {
  const CreateCollectionPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<CreateCollectionBloc, CreateCollectionState>(
      listener: (BuildContext context, state) {
        if (state.status == CreateStatus.success) {
          context.read<CollectionsBloc>().add(CollectionsRequired());
          context.pop();
        }
      },
      child: const CreateCollectionView(),
    );
  }
}
