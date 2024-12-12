import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:next_app/core/extensions/localizations_ext.dart';

import '../bloc/create_collection_bloc.dart';
import 'type_dropdown.dart';

class CreateCollectionView extends StatefulWidget {
  const CreateCollectionView({super.key});

  @override
  State<CreateCollectionView> createState() => _CreateCollectionViewState();
}

class _CreateCollectionViewState extends State<CreateCollectionView> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        surfaceTintColor: Colors.white,
        title: Text('Create new collection'),
      ),
      body: Form(
        key: _formKey,
        child: Column(
          children: [
            TextFormField(
              style: TextStyle(color: Colors.white),
              autovalidateMode: AutovalidateMode.onUserInteraction,
              decoration: InputDecoration(
                hintText: 'Enter title for your list',
                border: OutlineInputBorder(),
              ),
              validator: (value) {
                if (value == null || value.length < 3) {
                  return context.loc.titleSymbolLengthInvalid;
                }

                return null;
              },
              onChanged: context.read<CreateCollectionBloc>().onTitleChanged,
            ),
            const SizedBox(height: 16),
            TypeDropdown(
              validator: (type) {
                if (type == null) {
                  return context.loc.fieldRequired;
                }

                return null;
              },
              onChanged: context.read<CreateCollectionBloc>().onTypeChanged,
            ),
            const SizedBox(height: 16),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState != null &&
                      _formKey.currentState!.validate()) {
                    context.read<CreateCollectionBloc>().submit();
                  }
                },
                child: Text('Submit'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
