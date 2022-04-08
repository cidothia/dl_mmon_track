import 'package:dl_moon_track/src/domain/moons/moon_definitions.dart';
import 'package:dl_moon_track/src/services/interfaces/moons/moon_info.dart';
import 'package:flutter/material.dart';

@immutable
class MoonInfoImpl implements MoonInfo {
  const MoonInfoImpl(
    MoonPhases phase,
    MoonQuarters quarters,
    String label, [
    int bonus = 0,
  ])  : _phase = phase,
        _qtr = quarters,
        _label = label,
        _bonus = bonus;

  MoonInfoImpl copyWith({
    MoonPhases? phase,
    MoonQuarters? quarters,
    String? label,
  }) =>
      MoonInfoImpl(
        phase ?? _phase,
        quarters ?? _qtr,
        label ?? _label,
      );

  @override
  int get bonusVal => _bonus <= 0 ? bonusValue(_qtr) : _bonus;

  @override
  int get conjunctionVal => conjunctionValue(_phase);

  @override
  String get bonus => bonusLabel(bonusVal);

  final MoonPhases _phase;
  @override
  MoonPhases get phase => _phase;

  final MoonQuarters _qtr;
  @override
  MoonQuarters get quarter => _qtr;

  final String _label;
  @override
  String get label => _label;

  final int _bonus;

  @override
  MoonInfo overrideBonus(int value) => MoonInfoImpl(
        phase,
        quarter,
        label,
        value,
      );
}

// @override
// Widget get label => Container(
//       padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 4),
//       child: Text(
//         kBlackMoonLabel,
//         style: ThemeData.dark()
//             .textTheme
//             .headline3
//             .copyWith(color: Colors.white, fontWeight: FontWeight.w800),
//       ),
//     );
