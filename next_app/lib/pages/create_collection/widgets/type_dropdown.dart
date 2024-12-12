import 'package:flutter/material.dart';
import 'package:user_collections/user_collections.dart';

class TypeDropdown extends StatelessWidget {
  const TypeDropdown({
    super.key,
    this.validator,
    this.onChanged,
  });

  final FormFieldValidator<CollectionTypes>? validator;
  final ValueChanged<CollectionTypes?>? onChanged;

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<CollectionTypes>(
      autovalidateMode: AutovalidateMode.onUserInteraction,
      style: TextStyle(color: Colors.white),
      dropdownColor: Colors.grey,
      decoration: InputDecoration(
        label: Text('Test'),
        labelStyle: TextStyle(color: Colors.white),
        border: OutlineInputBorder(),
      ),
      items: CollectionTypes.values
          .map(
            (type) => DropdownMenuItem(
              value: type,
              child: Text(
                type.name,
              ),
            ),
          )
          .toList(),
      onChanged: onChanged,
      validator: validator,
    );
  }
}
