import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

part 'theme_event.dart';
part 'theme_state.dart';

class ThemeBloc extends Bloc<ThemeEvent, ThemeState> {
  ThemeBloc() : super(ThemeInitial()) {
    on<ToggleThemeEvent>(toggleThemeEvent);
  }

  FutureOr<void> toggleThemeEvent(
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
