import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'splash_screen_event.dart';
part 'splash_screen_state.dart';

class SplashScreenBloc extends Bloc<SplashScreenEvent, SplashScreenState> {
  SplashScreenBloc() : super(SplashScreenInitial()) {
    on<SplashScreenStarted>(_splashScreenStarted);
  }

  FutureOr<void> _splashScreenStarted(
    SplashScreenStarted event,
    Emitter<SplashScreenState> emit,
  ) async {
    // Emit the animate state immediately
    emit(SplashScreenAnimate());
    // Wait for 6 seconds
    await Future.delayed(const Duration(seconds: 6));
    // Emit the finished state to trigger navigation
    emit(SplashScreenFinished());
  }
}
