import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:next_app/features/collection/collection.dart';

class SelectableCollectionTypes extends StatelessWidget {
  const SelectableCollectionTypes({
    super.key,
    required this.currentType,
  });

  final CollectionTypes currentType;

  @override
  Widget build(BuildContext context) {
    final types = CollectionTypes.values;

    return SizedBox(
      height: 70,
      child: ListView.separated(
        padding: EdgeInsets.symmetric(horizontal: 8),
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          final selected = types[index] == currentType;

          return ChoiceChip(
            label: Text(types[index].name),
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
              context.read<CollectionsBloc>().add(
                    CollectionsRequired(
                      type: types[index],
                    ),
                  );
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
