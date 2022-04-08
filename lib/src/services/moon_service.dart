import 'dart:math';

import 'package:dl_moon_track/l10n/i118n.dart';
import 'package:dl_moon_track/src/domain/moons/moon_calculations.dart';
import 'package:dl_moon_track/src/domain/moons/moon_definitions.dart';
import 'package:dl_moon_track/src/services/interfaces/moons/moon_info.dart';
import 'package:dl_moon_track/src/services/moons/moon_info_impl.dart';
import 'package:states_rebuilder/states_rebuilder.dart';

const int kDateMaxSeed = 30;

final _dateInj = RM.inject<int>(() => 0);
final _moonInj = RM.inject<MoonService>(() => MoonService.calc(_dateInj.state));

MoonService get moons => _moonInj.state;

class MoonService {
  MoonInfo get white => _white;
  MoonInfo get red => _red;
  MoonInfo get black => _black;
  int get date => _dateCalculated;

  MoonService._(int date) : _dateCalculated = date;

  factory MoonService.calc(int date) {
    MoonService inst = MoonService._(date);
    MoonInfo white = calculateWhiteMoonInfo(date);
    MoonInfo red = calculateRedMoonInfo(date);
    MoonInfo black = calculateBlackMoonInfo(date);
    int? value = calculateBonus(white, red, black);
    if (value is int) {
      white.overrideBonus(value);
      red.overrideBonus(value);
      black.overrideBonus(value);
    }
    inst._white = white;
    inst._red = red;
    inst._black = black;
    return inst;
  }

  final int _dateCalculated;
  late final MoonInfo _white;
  late final MoonInfo _red;
  late final MoonInfo _black;
}

MoonInfo calculateWhiteMoonInfo(int date) => MoonInfoImpl(
      calcMoonPhases(date, kWhiteMoonCycle),
      calcMoonQuarters(date, kWhiteMoonCycle),
      i18nRM.of(RM.context!).whiteMoonLabel,
    );

MoonInfo calculateRedMoonInfo(int date) => MoonInfoImpl(
      calcMoonPhases(date, kRedMoonCycle),
      calcMoonQuarters(date, kRedMoonCycle),
      i18nRM.of(RM.context!).redMoonLabel,
    );

MoonInfo calculateBlackMoonInfo(int date) => MoonInfoImpl(
      calcMoonPhases(date, kBlackMoonCycle),
      calcMoonQuarters(date, kBlackMoonCycle),
      i18nRM.of(RM.context!).blackMoonLabel,
    );

void setDate(int date) {
  if (date != _dateInj.state) {
    _dateInj.state = date;
    _moonInj.state = MoonService.calc(date);
  }
}

void setRandomDate() => setDate(Random().nextInt(kDateMaxSeed));

void incrementDate([int value = 1]) {
  int date = _dateInj.state + value;
  setDate(date);
}

void addDay() => incrementDate();
void addWeek() => incrementDate(7);
void addMonth() => incrementDate(30);
void addQuarter() => incrementDate(90);
void addYear() => incrementDate(360);

int? calculateBonus(MoonInfo white, MoonInfo red, MoonInfo black) {
  final int cv = conjunctionFormula(
    white.conjunctionVal,
    red.conjunctionVal,
    black.conjunctionVal,
  );
  if (cv > 1 || cv < -2) {
    return cv;
  }
  return null;
}

enum MoonCode {
  wb,
  rb,
  bb,
}
