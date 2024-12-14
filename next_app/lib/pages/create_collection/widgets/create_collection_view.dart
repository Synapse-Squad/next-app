import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:next_app/core/extensions/localizations_ext.dart';
import 'package:next_design_system/next_design_system.dart';

import '../bloc/create_collection_bloc.dart';

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
      backgroundColor: context.layoutTheme.pageBackground,
      body: SafeArea(
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              AppTextField(
                autoValidateMode: AutovalidateMode.onUserInteraction,
                validator: (value) {
                  if (value == null || value.length < 3) {
                    return context.loc.titleSymbolLengthInvalid;
                  }

                  return null;
                },
                onChanged: context.read<CreateCollectionBloc>().onTitleChanged,
              ),
              // const SizedBox(height: 16),
              // TypeDropdown(
              //   validator: (type) {
              //     if (type == null) {
              //       return context.loc.fieldRequired;
              //     }
              //
              //     return null;
              //   },
              //   onChanged: context.read<CreateCollectionBloc>().onTypeChanged,
              // ),
              const SizedBox(height: 16),
              SizedBox(
                width: double.infinity,
                child: PrimaryTextButton(
                  label: 'Submit',
                  onTap: () {},
                  appButtonSize: AppButtonSize.xlarge,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
