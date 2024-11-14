import 'package:flutter/material.dart';
import 'package:itunes_service/itunes_service.dart';

class AlbumItem extends StatelessWidget {
  const AlbumItem({
    super.key,
    required this.album,
  });

  final AlbumEntity album;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            if (album.artworkUrl60 != null)
              ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.network(
                  album.artworkUrl60!,
                ),
              ),
            const SizedBox(width: 8),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(album.collectionName ?? 'N/A'),
                  Text(
                    album.artistName ?? 'N/A',
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  Text('${album.releaseDate?.year}'),
                ],
              ),
            ),
          ],
        ),
        const SizedBox(height: 8),
      ],
    );
  }
}
