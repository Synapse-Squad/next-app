import 'package:flutter/widgets.dart';

import '../l10n/generated/collection_localizations.dart';

extension CollectionLocalizationsExt on BuildContext {
  CollectionLocalizations get loc => CollectionLocalizations.of(this);
}
