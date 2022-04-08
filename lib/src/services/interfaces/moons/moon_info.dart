import 'package:dl_moon_track/l10n/i118n.dart';
import 'package:dl_moon_track/src/domain/moons/moon_definitions.dart';
import 'package:states_rebuilder/scr/state_management/state_management.dart';

abstract class MoonInfo {
  String get label;
  MoonPhases get phase;
  MoonQuarters get quarter;
  int get bonusVal;
  int get conjunctionVal;
  String get bonus;
  MoonInfo overrideBonus(int value);
}

String quarterLabel(MoonQuarters q) {
  String r;
  switch (q) {
    case MoonQuarters.h:
      r = 'High Sanction';
      break;
    case MoonQuarters.n:
      r = 'Waning';
      break;
    case MoonQuarters.l:
      r = 'Low Sancion';
      break;
    default:
      r = 'Waxing';
      break;
  }
  return r;
}

int conjunctionValue(MoonPhases p) {
  int r;
  switch (p) {
    case MoonPhases.f:
      r = 1;
      break;
    case MoonPhases.n:
      r = -1;
      break;
    default:
      r = 0;
      break;
  }
  return r;
}

int bonusValue(MoonQuarters q) {
  int r;
  switch (q) {
    case MoonQuarters.h:
      r = 1;
      break;
    case MoonQuarters.l:
      r = -1;
      break;
    default:
      r = 0;
      break;
  }
  return r;
}

String bonusLabel(int val) => i18nRM.of(RM.context!).bonusCasting(val);

/// 3 moons in Full = +3, 2 = +2, 1 = normal bonus
/// Full = 2, New = 0, others = 1, 2 moons = 4, 3 = 6,
int conjunctionFormula(int whiteVal, int redVal, int blackVal) {
  int conjVal = whiteVal + redVal + blackVal;
  int bonusVal = 0;
  if (conjVal >= 2 || conjVal <= -3) {
    bonusVal = conjVal;
  }
  return bonusVal;
}

String phaseLabel(MoonPhases p) {
  String r;
  switch (p) {
    case MoonPhases.f:
      r = 'Full';
      break;
    case MoonPhases.ng:
      r = 'Waning Gibbous';
      break;
    case MoonPhases.lq:
      r = 'Last Quarter';
      break;
    case MoonPhases.nc:
      r = 'Waning Crescent';
      break;
    case MoonPhases.xc:
      r = 'Waxing Crescent';
      break;
    case MoonPhases.fq:
      r = '1st Quarter';
      break;
    case MoonPhases.n:
      r = 'New';
      break;
    default:
      r = 'Waxing Gibbous';
      break;
  }
  return r;
}
