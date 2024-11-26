import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:next_app/features/collection/collection.dart';

import '../widgets/type_dropdown.dart';

class CreateCollectionView extends StatelessWidget {
  const CreateCollectionView({super.key});

  @override
  Widget build(BuildContext context) {
    final bloc = context.watch<CreateCollectionBloc>();

    return Scaffold(
      appBar: AppBar(
        surfaceTintColor: Colors.white,
        title: Text('Create new collection'),
      ),
      body: Column(
        children: [
          TextFormField(
            style: TextStyle(color: Colors.white),
            decoration: InputDecoration(
              hintText: 'Enter title for your list',
              border: OutlineInputBorder(),
              errorText: bloc.state.validation?.titleValidationMessage,
            ),
            onChanged: bloc.onTitleChanged,
          ),
          const SizedBox(height: 16),
          TypeDropdown(
            errorText: bloc.state.validation?.typeValidationMessage,
            onChanged: bloc.onTypeChanged,
          ),
          const SizedBox(height: 16),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: bloc.submit,
              child: Text('Submit'),
            ),
          ),
        ],
      ),
    );
  }
}
