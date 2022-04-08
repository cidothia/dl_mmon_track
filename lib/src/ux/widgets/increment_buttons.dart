import 'package:dl_moon_track/l10n/i118n.dart';
import 'package:dl_moon_track/src/services/moon_service.dart';
import 'package:flutter/material.dart';
import 'package:states_rebuilder/states_rebuilder.dart';

const EdgeInsets kButtonContainerPadding = EdgeInsets.all(5);

class IncrementButtons extends ReactiveStatelessWidget {
  const IncrementButtons({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 1,
      child: Container(
        padding: kButtonContainerPadding,
        child: ListView(
          children: [
            Center(
                child: Text(
              i18nRM.of(RM.context!).updatePhasesToNext,
              textAlign: TextAlign.center,
            )),
            ElevatedButton(
              onLongPress: () => RM.scaffold.showSnackBar(
                SnackBar(
                  content: Text(
                    i18nRM.of(RM.context!).seedText('${moons.date}'),
                  ),
                ),
              ),
              onPressed: () => addDay(),
              child: Text(i18nRM.of(RM.context!).day),
            ),
            ElevatedButton(
              onPressed: () => addWeek(),
              child: Text(i18nRM.of(RM.context!).week),
            ),
            ElevatedButton(
              onPressed: () => addMonth(),
              child: Text(i18nRM.of(RM.context!).month),
            ),
            ElevatedButton(
              onPressed: () => addQuarter(),
              child: Text(i18nRM.of(RM.context!).quarter),
            ),
            ElevatedButton(
              onPressed: () => addYear(),
              child: Text(i18nRM.of(RM.context!).year),
            ),
            ElevatedButton(
              onPressed: () => setRandomDate(),
              child: Text(i18nRM.of(RM.context!).random),
            ),
            ElevatedButton(
              onPressed: () async => setDate(
                await _showSeedPicker(RM.context!),
              ),
              child: Text(i18nRM.of(RM.context!).choose),
            ),
          ],
        ),
      ),
    );
  }
}

Future<int> _showSeedPicker(BuildContext context) async {
  TextEditingController _tc = TextEditingController();
  return await showDialog(
    context: context,
    builder: (context) => AlertDialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      title: Text(i18nRM.of(RM.context!).seedPrompt),
      content: TextField(
        key: const Key('seed'),
        controller: _tc,
        keyboardType: TextInputType.number,
      ),
      actions: [
        IconButton(
          onPressed: () => Navigator.of(context).pop(),
          icon: const Icon(Icons.cancel),
        ),
        IconButton(
          onPressed: () => Navigator.of(context).pop(int.parse(_tc.text)),
          icon: Icon(
            Icons.check,
            color: Colors.green[300],
          ),
        ),
      ],
    ),
  );
}
