import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../features/album/album.dart';
import 'scope/album_search_scope.dart';

class AlbumSearchPage extends StatelessWidget {
  const AlbumSearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return AlbumSearchScope(
      builder: (context) {
        return Scaffold(
          backgroundColor: Colors.black,
          body: SafeArea(
            child: AlbumSearchView(
              albumPrefixBuilder: (album) {
                return ElevatedButton(
                  onPressed: () {
                    final persistingBloc = context.read<AlbumPersistingBloc>();

                    if (album.selected) {
                      persistingBloc.add(AlbumRemovingRequired(album.data));
                    } else {
                      persistingBloc.add(AlbumSavingRequired(album.data));
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.grey[900],
                    foregroundColor: Colors.white,
                  ),
                  child: Text(album.selected ? 'Remove' : 'Add'),
                );
              },
            ),
          ),
        );
      },
    );
  }
}
