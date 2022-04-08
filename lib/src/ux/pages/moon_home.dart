import 'package:dl_moon_track/src/ux/widgets/increment_buttons.dart';
import 'package:dl_moon_track/src/ux/widgets/moon_data.dart';
import 'package:dl_moon_track/src/ux/widgets/moon_graph.dart';
import 'package:flutter/material.dart';

class MoonHomePage extends StatelessWidget {
  const MoonHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: <Widget>[
              const MoonGraphs(),
              Expanded(
                flex: 4,
                child: Row(
                  children: const <Widget>[
                    MoonData(),
                    IncrementButtons(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
