import '../models/appState.dart';

AppState appStateReducer(AppState state, action) {
  return AppState(
    coreMap: mapReducer(state.coreMap, action),
  );
}

Map<String, dynamic> mapReducer(Map<String, dynamic> state, action) {
  return state;
}
