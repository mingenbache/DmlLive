// Automatic FlutterFlow imports
import '../../backend/backend.dart';
import '../../flutter_flow/flutter_flow_theme.dart';
import '../../flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import 'package:flutter/material.dart';
// Begin custom widget code
import 'package:wave/wave.dart';
import 'package:wave/config.dart';

class WaveImage extends StatefulWidget {
  const WaveImage({
    Key key,
    this.width,
    this.height,
    this.image,
  }) : super(key: key);

  final double width;
  final double height;
  final String image;
  // Colors, animation durations, heights could
  // be parameters.

  @override
  _WaveImageState createState() => _WaveImageState();
}

class _WaveImageState extends State<WaveImage> {
  @override
  Widget build(BuildContext context) {
    return WaveWidget(
      config: CustomConfig(
        gradients: [
          [Color(0xFF88993A), Color(0x5588993A)],
          [Color(0xFFBACA68), Color(0x55BACA68)],
          [Color(0xFF586B06), Color(0x55586B06)],
          [Color(0xFF58595B), Color(0x5558595B)],
          [Color(0xFF58595B), Color(0x5558595B)],
        ],
        durations: [
          10200,
          9000,
          9000,
          10000,
          11200,
        ],
        heightPercentages: [0.65, 0.75, 0.82, 0.87, 1],
        gradientBegin: Alignment.bottomLeft,
        gradientEnd: Alignment.topRight,
      ),
      waveAmplitude: 5,
      size: Size(widget.width, widget.height),
    );
  }
}
