// num calcAngle(int d, double c) => (360 * (d % c)) / c;
import 'moon_definitions.dart';

num calcAngle(int d, double c) {
  double md = d % c;
  double a = 360 * md;
  double r = a / c;
  return r;
}

MoonPhases calcMoonPhases(int day, double cycle) {
  final p = calcAngle(day, cycle);
  if (p < 22.5 || p > 337.5) return MoonPhases.f;
  if (p < 67.5) return MoonPhases.ng;
  if (p < 112.5) return MoonPhases.lq;
  if (p < 157.5) return MoonPhases.nc;
  if (p < 202.5) return MoonPhases.n;
  if (p < 247.5) return MoonPhases.xc;
  if (p < 292.5) return MoonPhases.fq;
  return MoonPhases.xg;
}

MoonQuarters calcMoonQuarters(int day, double cycle) {
  final p = calcAngle(day, cycle);
  if (p < 45 || p > 315) return MoonQuarters.h;
  if (p < 135) return MoonQuarters.n;
  if (p < 225) return MoonQuarters.l;
  return MoonQuarters.x;
}
