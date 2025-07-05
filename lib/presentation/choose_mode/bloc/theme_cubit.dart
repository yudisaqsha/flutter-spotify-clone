import 'package:flutter/material.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

class ThemeCubit extends HydratedCubit<ThemeMode> {
  ThemeCubit() : super(ThemeMode.system);

  void updateTheme(ThemeMode themeMode) => emit(themeMode);

  @override
  ThemeMode? fromJson(Map<String, dynamic> json) {
    try {
      final themeIndex = json['theme'] as int?;
      if (themeIndex != null) {
        return ThemeMode.values[themeIndex];
      }
    } catch (e) {
      // If there's an error, return the default theme
      return ThemeMode.system;
    }
    return ThemeMode.system;
  }

  @override
  Map<String, dynamic>? toJson(ThemeMode state) {
    try {
      return {'theme': state.index};
    } catch (e) {
      // If there's an error, return null (won't persist)
      return null;
    }
  }
}
