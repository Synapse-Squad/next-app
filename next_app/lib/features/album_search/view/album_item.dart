import 'package:flutter/material.dart';
import 'package:itunes_service/itunes_service.dart';

import '../../../core/bloc/selector.dart';

typedef AlbumPrefixBuilder = Widget Function(Selector<AlbumEntity> album);

class AlbumItem extends StatelessWidget {
  const AlbumItem({
    super.key,
    required this.album,
    this.prefixBuilder,
  });

  final Selector<AlbumEntity> album;
  final AlbumPrefixBuilder? prefixBuilder;

  @override
  Widget build(BuildContext context) {
    final data = album.data;

    return Column(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (data.artworkUrl60 != null)
              ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.network(
                  data.artworkUrl60!,
                  width: 80,
                  height: 80,
                  fit: BoxFit.cover,
                ),
              ),
            const SizedBox(width: 8),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    data.collectionName ?? 'N/A',
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                    ),
                  ),
                  Text(
                    data.artistName ?? 'N/A',
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                    ),
                  ),
                  Text(
                    '${data.releaseDate?.year}',
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
            ),
            if (prefixBuilder != null) ...[
              const SizedBox(width: 16),
              prefixBuilder!(album),
            ],
          ],
        ),
        const SizedBox(height: 8),
      ],
    );
  }
}
