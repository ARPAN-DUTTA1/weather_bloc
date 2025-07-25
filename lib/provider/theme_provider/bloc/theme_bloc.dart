import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

part 'theme_event.dart';
part 'theme_state.dart';

class ThemeBloc extends Bloc<ThemeEvent, ThemeState> {
  ThemeBloc() : super(ThemeInitial()) {
    on<ToggleThemeEvent>(_toggleThemeEvent);
  }

  FutureOr<void> _toggleThemeEvent(
    ToggleThemeEvent event,
    Emitter<ThemeState> emit,
  ) {
    if (state.themeMode == ThemeMode.light) {
      emit(DarkTheme());
    } else {
      emit(LightTheme());
    }
  }
}
