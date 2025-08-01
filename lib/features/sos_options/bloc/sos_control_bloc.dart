import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project_shakti/features/sos_options/bloc/sos_control_event.dart';
import 'package:project_shakti/features/sos_options/bloc/sos_control_state.dart';

class SosControlBloc extends Bloc<SosControlEvent, SosControlState> {
  SosControlBloc() : super(SosControlState()) {
    on<TogglePowerButton>((event, emit) =>
        emit(state.copyWith(powerButtonEnabled: event.isEnabled)));

    on<ToggleShake>((event, emit) =>
        emit(state.copyWith(shakeEnabled: event.isEnabled)));

    on<ToggleVolumeButton>((event, emit) =>
        emit(state.copyWith(volumeButtonEnabled: event.isEnabled)));

    on<ToggleVoiceTrigger>((event, emit) =>
        emit(state.copyWith(voiceTriggerEnabled: event.isEnabled)));

    on<TriggerSos>((event, emit) {
      // 🔔 Custom SOS action here
      debugPrint("🚨 SOS ACTIVATED via BLoC!");
      // You can also emit a different state or navigate to another screen
    });
  }
}
