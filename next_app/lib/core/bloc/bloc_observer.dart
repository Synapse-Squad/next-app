import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:logging/logging.dart';

class NextBlocObserver extends BlocObserver {
  final _logger = Logger('BlocObserver');

  @override
  void onChange(BlocBase bloc, Change change) {
    super.onChange(bloc, change);
    _logger.info('${bloc.runtimeType} $change');
  }

  @override
  void onError(BlocBase bloc, Object error, StackTrace stackTrace) {
    _logger.severe('${bloc.runtimeType} $error $stackTrace');
    super.onError(bloc, error, stackTrace);
  }
}
