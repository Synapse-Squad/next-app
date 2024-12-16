import 'package:flutter/material.dart';
import 'package:next_design_system/next_design_system.dart';
import 'package:user_collections/user_collections.dart';

class CollectionTypeSelector extends StatefulWidget {
  const CollectionTypeSelector({
    super.key,
    this.onChanged,
  });

  final ValueChanged<CollectionTypes?>? onChanged;

  @override
  State<CollectionTypeSelector> createState() => _CollectionTypeSelectorState();
}

class _CollectionTypeSelectorState extends State<CollectionTypeSelector> {
  var _currentType = CollectionTypes.all;

  @override
  Widget build(BuildContext context) {
    var types = CollectionTypes.values;

    return SizedBox(
      height: 30,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          final type = types[index];
          final selected = types[index] == _currentType;

          return AppBadge(
            title: type.name,
            checked: selected,
            onTap: () {
              setState(() {
                widget.onChanged?.call(type);
                _currentType = type;
              });
            },
          );
        },
        separatorBuilder: (_, __) => const SizedBox(width: 8),
        itemCount: types.length,
      ),
    );
  }
}
