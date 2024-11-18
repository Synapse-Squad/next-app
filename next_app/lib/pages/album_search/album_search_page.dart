import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../features/album_persistence/bloc/album_persisting_bloc.dart';
import '../../features/album_search/bloc/album_search_bloc.dart';
import '../../features/album_search/view/album_search_view.dart';
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
            child: BlocBuilder<AlbumSearchBloc, AlbumSearchState>(
              builder: (context, state) {
                return AlbumSearchView(
                  albumPrefixBuilder: (album) {
                    return ElevatedButton(
                      onPressed: () {
                        final persistingBloc =
                            context.read<AlbumPersistingBloc>();

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
                );
              },
            ),
          ),
        );
      },
    );
  }
}
