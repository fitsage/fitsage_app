import 'dart:math';
import 'package:confetti/confetti.dart';
import 'package:flutter/material.dart';

class ConfettiSample extends StatefulWidget {
  const ConfettiSample({Key? key}) : super(key: key);

  @override
  _ConfettiSampleState createState() => _ConfettiSampleState();
}

class _ConfettiSampleState extends State<ConfettiSample> {
  late ConfettiController _controllerBottomCenter;

  @override
  void initState() {
    super.initState();

    _controllerBottomCenter =
        ConfettiController(duration: const Duration(seconds: 1));
  }

  @override
  void dispose() {
    _controllerBottomCenter.dispose();
    super.dispose();
  }

  /// A custom Path to paint stars.
  Path drawStar(Size size) {
    // Method to convert degree to radians
    double degToRad(double deg) => deg * (pi / 180.0);

    const numberOfPoints = 5;
    final halfWidth = size.width / 2;
    final externalRadius = halfWidth;
    final internalRadius = halfWidth / 2.5;
    final degreesPerStep = degToRad(360 / numberOfPoints);
    final halfDegreesPerStep = degreesPerStep / 2;
    final path = Path();
    final fullAngle = degToRad(360);
    path.moveTo(size.width, halfWidth);

    for (double step = 0; step < fullAngle; step += degreesPerStep) {
      path.lineTo(halfWidth + externalRadius * cos(step),
          halfWidth + externalRadius * sin(step));
      path.lineTo(halfWidth + internalRadius * cos(step + halfDegreesPerStep),
          halfWidth + internalRadius * sin(step + halfDegreesPerStep));
    }
    path.close();
    return path;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Stack(
        children: <Widget>[
          Align(
            alignment: Alignment.bottomLeft,
            child: ConfettiWidget(
              confettiController: _controllerBottomCenter,
              blastDirection: -pi / 2.5,
              emissionFrequency: 0.01,
              numberOfParticles: 15,
              minimumSize: const Size(5, 5),
              maximumSize: const Size(20, 20),
              maxBlastForce: 250,
              minBlastForce: 150,
              gravity: 1,
              colors: const [
                Colors.grey,
                Color(0xFFEFC8B1),
                Color(0xFF42210B),
              ],
            ),
          ),
          Align(
            alignment: Alignment.bottomLeft,
            child: ConfettiWidget(
              confettiController: _controllerBottomCenter,
              blastDirection: -pi / 2.5,
              emissionFrequency: 0.01,
              numberOfParticles: 2,
              maxBlastForce: 250,
              minimumSize: const Size(5, 5),
              maximumSize: const Size(20, 20),
              minBlastForce: 150,
              gravity: 1,
              colors: const [
                Colors.grey,
                Color(0xFFEFC8B1),
                Color(0xFF42210B),
              ],
              createParticlePath: drawStar,
            ),
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: ConfettiWidget(
              confettiController: _controllerBottomCenter,
              blastDirection: -pi / 1.7,
              emissionFrequency: 0.01,
              numberOfParticles: 15,
              minimumSize: const Size(5, 5),
              maximumSize: const Size(20, 20),
              maxBlastForce: 250,
              minBlastForce: 150,
              gravity: 1,
              colors: const [
                Colors.grey,
                Color(0xFFEFC8B1),
                Color(0xFF42210B),
              ],
            ),
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: ConfettiWidget(
              confettiController: _controllerBottomCenter,
              blastDirection: -pi / 1.7,
              emissionFrequency: 0.01,
              numberOfParticles: 2,
              minimumSize: const Size(5, 5),
              maximumSize: const Size(20, 20),
              maxBlastForce: 250,
              minBlastForce: 150,
              gravity: 1,
              colors: const [
                Colors.grey,
                Color(0xFFEFC8B1),
                Color(0xFF42210B),
              ],
              createParticlePath: drawStar,
            ),
          ),
          // FloatingActionButton to trigger the confetti
          Align(
            alignment: Alignment.bottomCenter,
            child: FloatingActionButton(
              onPressed: () {
                _controllerBottomCenter.play();
              },
              child: Icon(Icons.star),
            ),
          ),
        ],
      ),
    );
  }

  Text _display(String text) {
    return Text(
      text,
      style: const TextStyle(color: Colors.white, fontSize: 20),
    );
  }
}
