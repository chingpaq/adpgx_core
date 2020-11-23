import 'package:adpgx_core/constants.dart';
import 'package:adpgx_core/redux/actions.dart';
import '../models/appState.dart';

AppState appStateReducer(AppState state, action) {
  return AppState(
    coreMap: mapReducer(state.coreMap, action),
  );
}

Map<String, dynamic> mapReducer(Map<String, dynamic> state, action) {
  if (action == EditMapAction) {
    return {'Test' : 'Message changed by Redux method'};
  }
  return state;
}
