import 'package:dl_moon_track/l10n/i118n.dart';
import 'package:dl_moon_track/src/services/interfaces/moons/moon_info.dart';
import 'package:dl_moon_track/src/services/moon_service.dart';
import 'package:flutter/material.dart';
import 'package:states_rebuilder/states_rebuilder.dart';

class MoonData extends ReactiveStatelessWidget {
  const MoonData({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 3,
      child: Container(
        decoration: const BoxDecoration(
          color: Colors.black,
        ),
        child: Column(
          children: [
            MoonDataItem(moonInfo: moons.white),
            MoonDataItem(moonInfo: moons.red),
            MoonDataItem(moonInfo: moons.black),
          ],
        ),
      ),
    );
  }
}

class MoonDataItem extends StatelessWidget {
  const MoonDataItem({Key? key, required this.moonInfo}) : super(key: key);

  final MoonInfo moonInfo;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        color: Theme.of(context).backgroundColor,
        child: Padding(
          padding: const EdgeInsets.all(5.0),
          child: Column(
            children: [
              Center(
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 15,
                    vertical: 4,
                  ),
                  child: Text(moonInfo.label),
                ),
              ),
              Table(
                children: [
                  TableRow(
                    children: [
                      Text(i18nRM.of(context).quarterLabel),
                      Text(
                        quarterLabel(moonInfo.quarter),
                        style: Theme.of(context).textTheme.caption,
                      ),
                    ],
                  ),
                  TableRow(
                    children: [
                      Text(i18nRM.of(context).phaseLabel),
                      Text(
                        phaseLabel(moonInfo.phase),
                        style: Theme.of(context).textTheme.caption,
                      ),
                    ],
                  ),
                  TableRow(
                    children: [
                      Text(i18nRM.of(context).bonusLabel),
                      Text(moonInfo.bonus),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
