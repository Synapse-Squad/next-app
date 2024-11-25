import 'package:flutter/material.dart';

import '../../features/collection/collection.dart';
import 'scope/collections_scope.dart';

class CollectionsPage extends StatelessWidget {
  const CollectionsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return CollectionsScope(
      builder: (context) {
        return CollectionsView();
      },
    );
  }
}
