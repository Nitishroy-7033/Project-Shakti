abstract class SosControlEvent {}

class TogglePowerButton extends SosControlEvent {
  final bool isEnabled;
  TogglePowerButton(this.isEnabled);
}

class ToggleShake extends SosControlEvent {
  final bool isEnabled;
  ToggleShake(this.isEnabled);
}

class ToggleVolumeButton extends SosControlEvent {
  final bool isEnabled;
  ToggleVolumeButton(this.isEnabled);
}

class ToggleVoiceTrigger extends SosControlEvent {
  final bool isEnabled;
  ToggleVoiceTrigger(this.isEnabled);
}

class TriggerSos extends SosControlEvent {} // when any condition met
