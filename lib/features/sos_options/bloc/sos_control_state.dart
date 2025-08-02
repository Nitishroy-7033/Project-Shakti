class SosControlState {
  final bool powerButtonEnabled;
  final bool shakeEnabled;
  final bool volumeButtonEnabled;
  final bool voiceTriggerEnabled;

  SosControlState({
    this.powerButtonEnabled = false,
    this.shakeEnabled = false,
    this.volumeButtonEnabled = false,
    this.voiceTriggerEnabled = false,
  });

  SosControlState copyWith({
    bool? powerButtonEnabled,
    bool? shakeEnabled,
    bool? volumeButtonEnabled,
    bool? voiceTriggerEnabled,
  }) {
    return SosControlState(
      powerButtonEnabled: powerButtonEnabled ?? this.powerButtonEnabled,
      shakeEnabled: shakeEnabled ?? this.shakeEnabled,
      volumeButtonEnabled: volumeButtonEnabled ?? this.volumeButtonEnabled,
      voiceTriggerEnabled: voiceTriggerEnabled ?? this.voiceTriggerEnabled,
    );
  }
}
