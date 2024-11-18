import 'package:flutter/material.dart';

import '../../features/album_search/view/album_search_view.dart';
import 'scope/album_search_scope.dart';

class AlbumSearchPage extends StatelessWidget {
  const AlbumSearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return AlbumSearchScope(
      builder: (context) {
        return AlbumSearchView();
      },
    );
  }
}
