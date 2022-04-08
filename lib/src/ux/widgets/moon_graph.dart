import 'package:dl_moon_track/src/domain/common/constants.dart';
import 'package:flutter/material.dart';
import 'package:states_rebuilder/states_rebuilder.dart';

class MoonGraphs extends ReactiveStatelessWidget {
  const MoonGraphs({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Flexible(
      flex: kMoonFlex,
      // Moon Phases Container
      child: Container(
        padding: kMoonContainerPadding,
        child: LayoutBuilder(
          builder: (context, constraints) => Stack(
            alignment: Alignment.center,
            children: [
              // White Moon Graphic
              MoonGraphic(
                height: constraints.maxHeight,
                width: constraints.maxWidth,
                shape: BoxShape.circle,
                color: Colors.white,
              ),
              // Red Moon Graphic
              MoonGraphic(
                height: constraints.maxHeight * kMidRingMult,
                width: constraints.maxWidth * kMidRingMult,
                shape: BoxShape.circle,
                color: Colors.red,
              ),
              // Black Moon Graphic
              MoonGraphic(
                height: constraints.maxHeight * kInnerRingMult,
                width: constraints.maxWidth * kInnerRingMult,
                shape: BoxShape.circle,
                color: Colors.black,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class MoonGraphic extends StatelessWidget {
  const MoonGraphic({
    Key? key,
    required this.shape,
    required this.color,
    required this.height,
    required this.width,
  }) : super(key: key);
  final double height;
  final double width;
  final Color color;
  final BoxShape shape;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: color, shape: shape),
      width: width,
      height: height,
    );
  }
}

const EdgeInsets kMoonContainerPadding = EdgeInsets.all(10);
