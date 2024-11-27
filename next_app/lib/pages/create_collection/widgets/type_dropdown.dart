import 'package:flutter/material.dart';
import 'package:user_collections/user_collections.dart';

class TypeDropdown extends StatelessWidget {
  const TypeDropdown({
    super.key,
    this.errorText,
    this.onChanged,
  });

  final String? errorText;
  final ValueChanged<CollectionTypes?>? onChanged;

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<CollectionTypes>(
      style: TextStyle(color: Colors.white),
      dropdownColor: Colors.grey,
      decoration: InputDecoration(
        label: Text('Test'),
        labelStyle: TextStyle(color: Colors.white),
        border: OutlineInputBorder(),
        errorText: errorText,
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
    );
  }
}
