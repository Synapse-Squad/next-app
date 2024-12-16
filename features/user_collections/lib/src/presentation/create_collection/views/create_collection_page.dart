import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:next_database_service/next_database_service.dart';
import 'package:next_design_system/next_design_system.dart';

import '../../../core/l10n/localization/collection_localizations.dart';
import '../../collections/bloc/collections_bloc.dart';
import '../bloc/collection_create_bloc.dart';

class CreateCollectionPage extends StatefulWidget {
  const CreateCollectionPage({super.key});

  @override
  State<CreateCollectionPage> createState() => _CreateCollectionPageState();
}

class _CreateCollectionPageState extends State<CreateCollectionPage> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocListener<CreateCollectionBloc, CollectionCreateState>(
      listener: (context, state) {
        if (state is CollectionCreateSucceed) {
          context.read<CollectionsBloc>().add(const CollectionsRequired());
          context.pop();
        } else if (state is SameCollectionFound) {
          ScaffoldMessenger.of(context)
            ..removeCurrentSnackBar()
            ..showSnackBar(
              const SnackBar(
                content: Text('Already this item created!'),
              ),
            );
        }
      },
      child: AppScaffold(
        body: SafeArea(
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                AppTextField(
                  validator: (value) {
                    if (value == null || value.length < 3) {
                      return CollectionLocalizations.of(context)
                          .titleSymbolLengthInvalid;
                    }

                    return null;
                  },
                  onChanged:
                      context.read<CreateCollectionBloc>().onTitleChanged,
                ),
                const SizedBox(height: AppSpacing.xl),
                AppDropdownField<CollectionTypes>(
                  defaultTitle: 'Select types of collection',
                  items: const [
                    (action: CollectionTypes.book, title: 'Book'),
                    (action: CollectionTypes.movie, title: 'Movie'),
                    (action: CollectionTypes.album, title: 'Album'),
                    (action: CollectionTypes.podcast, title: 'Podcast'),
                  ],
                  constraints: const BoxConstraints(
                    maxWidth: double.infinity,
                    minWidth: double.infinity,
                  ),
                  onChanged: (value) {
                    context
                        .read<CreateCollectionBloc>()
                        .onTypeChanged(value.action);
                  },
                ),
                const SizedBox(height: 16),
                SizedBox(
                  width: double.infinity,
                  child: PrimaryTextButton(
                    label: 'Submit',
                    onTap: () {
                      if (_formKey.currentState!.validate()) {
                        context.read<CreateCollectionBloc>().submit();
                      }
                    },
                    appButtonSize: AppButtonSize.xlarge,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
