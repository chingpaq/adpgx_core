import 'package:flutter/material.dart';

class AppState {
  final Map<String, dynamic> coreMap;
  AppState({
    @required this.coreMap,
  });

  AppState.initialState() : coreMap = Map.unmodifiable({});
}
