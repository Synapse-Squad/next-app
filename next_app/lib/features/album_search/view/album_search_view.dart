import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/album_search_bloc.dart';
import 'album_item.dart';

class AlbumSearchView extends StatelessWidget {
  const AlbumSearchView({super.key});

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<AlbumSearchBloc>();

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            TextField(
              onChanged: (value) {
                bloc.add(AlbumQueried(value));
              },
            ),
            const SizedBox(height: 16),
            Expanded(
              child: BlocBuilder(
                bloc: bloc,
                builder: (context, state) {
                  if (state is AlbumSearchInitial) {
                    return const SizedBox.shrink();
                  } else if (state is AlbumInProgress) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  } else if (state is AlbumSearchFailure) {
                    return const Text('Failed!');
                  } else if (state is AlbumNotFound) {
                    return const Text('Not found any album!');
                  } else {
                    final albums = (state as AlbumSearchSuccess).albums;

                    return ListView.builder(
                      padding: const EdgeInsets.all(16),
                      itemBuilder: (context, index) {
                        return AlbumItem(album: albums[index].data);
                      },
                      itemCount: albums.length,
                    );
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
