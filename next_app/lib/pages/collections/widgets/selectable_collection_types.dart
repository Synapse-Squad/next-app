import 'package:flutter/material.dart';
import 'package:user_collections/user_collections.dart';

class SelectableCollectionTypes extends StatefulWidget {
  const SelectableCollectionTypes({
    super.key,
    this.onChanged,
  });

  final ValueChanged<CollectionTypes?>? onChanged;

  @override
  State<SelectableCollectionTypes> createState() =>
      _SelectableCollectionTypesState();
}

class _SelectableCollectionTypesState extends State<SelectableCollectionTypes> {
  var _currentType = CollectionTypes.all;

  @override
  Widget build(BuildContext context) {
    final types = CollectionTypes.values;

    return SizedBox(
      height: 70,
      child: ListView.separated(
        padding: EdgeInsets.symmetric(horizontal: 8),
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          final type = types[index];
          final selected = types[index] == _currentType;

          return ChoiceChip(
            label: Text(type.name),
            selected: selected,
            selectedColor: Colors.white54,
            disabledColor: Colors.black87,
            elevation: 0,
            shadowColor: Colors.transparent,
            selectedShadowColor: Colors.transparent,
            labelStyle: TextStyle(
              color: selected ? Colors.black : Colors.white,
            ),
            checkmarkColor: Colors.black,
            onSelected: (_) {
              setState(() {
                widget.onChanged?.call(type);
                _currentType = type;
              });
            },
            backgroundColor: Colors.black87,
          );
        },
        separatorBuilder: (_, __) => const SizedBox(width: 8),
        itemCount: types.length,
      ),
    );
  }
}
