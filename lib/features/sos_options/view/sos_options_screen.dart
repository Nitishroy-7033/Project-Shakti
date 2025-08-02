import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project_shakti/core/widgets/custom_button.dart';

import '../../../core/theme/app_colors.dart';
import '../bloc/sos_control_bloc.dart';
import '../bloc/sos_control_event.dart';
import '../bloc/sos_control_state.dart';


class SosControlSettingsScreen extends StatelessWidget {
  const SosControlSettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => SosControlBloc(),
      child: Scaffold(
        backgroundColor: Theme.of(context).colorScheme.surface,
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.surface,
          elevation: 0,
          centerTitle: true,
          leading: IconButton(
            icon: Icon(Icons.arrow_back,
                color: Theme.of(context).colorScheme.onSurface),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          title: Text(
            'Discreet Panic Mode Setup',
            style: TextStyle(
              color: Theme.of(context).colorScheme.onSurface,
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
          ),
        ),
        body: BlocBuilder<SosControlBloc, SosControlState>(
          builder: (context, state) {
            return ListView(
              children: [
                _SosOptionTile(
                  title: 'Power Button',
                  subtitle: 'Triple press the power button to activate SOS',
                  value: state.powerButtonEnabled,
                  onChanged: (value) {
                    context.read<SosControlBloc>().add(TogglePowerButton(value));
                  },
                ),
                _SosOptionTile(
                  title: 'Shake Device',
                  subtitle: 'Shake your phone 3 times quickly to activate SOS',
                  value: state.shakeEnabled,
                  onChanged: (value) {
                    context.read<SosControlBloc>().add(ToggleShake(value));
                  },
                ),
                _SosOptionTile(
                  title: 'Volume Button',
                  subtitle: 'Long press the volume button to activate SOS',
                  value: state.volumeButtonEnabled,
                  onChanged: (value) {
                    context.read<SosControlBloc>().add(ToggleVolumeButton(value));
                  },
                ),
                _SosOptionTile(
                  title: 'Voice Trigger',
                  subtitle:
                  'Say a specific phrase to activate SOS (optional)',
                  value: state.voiceTriggerEnabled,
                  onChanged: (value) {
                    context.read<SosControlBloc>().add(ToggleVoiceTrigger(value));
                  },
                ),
              ],
            );
          },
        ),
        bottomNavigationBar: Container(
          color: Theme.of(context).colorScheme.surface,
          padding: const EdgeInsets.fromLTRB(16, 12, 16, 20),
          child: SizedBox(
            width: double.infinity,
            height: 40,
            child:
            CustomButton(
              text: 'Test SOS',
              onPressed: () {
                context.read<SosControlBloc>().add(TriggerSos());
              },
            )

          ),
        ),
      ),
    );
  }
}

/// Reusable tile widget
class _SosOptionTile extends StatelessWidget {
  final String title;
  final String subtitle;
  final bool value;
  final ValueChanged<bool> onChanged;

  const _SosOptionTile({
    required this.title,
    required this.subtitle,
    required this.value,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.onSurface,
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  subtitle,
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.tertiary,
                    fontSize: 14,
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
          const SizedBox(width: 16),
          CupertinoSwitch(
            value: value,
            onChanged: onChanged,
            activeColor: AppColors.primaryLight,
            trackColor: AppColors.labelDark,
          ),
        ],
      ),
    );
  }
}