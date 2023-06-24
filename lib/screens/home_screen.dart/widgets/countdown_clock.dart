import 'package:flutter/material.dart';
import 'package:flip_board/flip_clock.dart';
  Widget _flipCountdown(ColorScheme colors) => 
    Container(
      decoration: BoxDecoration(
        color: colors.secondary,
        borderRadius: BorderRadius.circular(8.0),
      ),
      padding: const EdgeInsets.all(24.0),
      child: FlipCountdownClock(
        duration: const Duration(minutes: 1),
        digitSize: 54.0,
        width: 46.0,
        height: 62.0,
        digitColor: colors.surface,
        backgroundColor: colors.onSurface,
        separatorColor: colors.onSurface,
        borderColor: colors.primary,
        hingeColor: colors.surface,
        borderRadius: const BorderRadius.all(Radius.circular(8.0)),
        onDone: () => print('Buzzzz!'),
      ),
    );