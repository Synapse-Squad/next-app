import 'package:flutter/material.dart';
import 'package:next_database_service/next_database_service.dart';

extension CollectionTypesExt on CollectionTypes {
  Widget get icon {
    final icon = switch (this) {
      CollectionTypes.album => Icons.music_note,
      CollectionTypes.book => Icons.book_rounded,
      CollectionTypes.podcast => Icons.podcasts,
      CollectionTypes.movie => Icons.movie,
      _ => Icons.all_inclusive_sharp,
    };

    return Icon(
      icon,
      color: Colors.white,
      size: 24,
      applyTextScaling: false,
    );
  }
}
