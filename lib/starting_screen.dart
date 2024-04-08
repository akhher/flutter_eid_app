import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:confetti/confetti.dart';
import 'colors.dart';
import 'next_screen.dart';

class StartingScreen extends StatefulWidget {
  const StartingScreen({super.key});

  @override
  State<StartingScreen> createState() => _StartingScreenState();
}

class _StartingScreenState extends State<StartingScreen> {
  late ConfettiController _controllerCenterRight;
  late ConfettiController _controllerCenterLeft;
  // ignore: unused_field
  late Timer _timer;
  int _start = 5;

  // ignore: non_constant_identifier_names
  void StartTimer() {
    const oneSec = Duration(seconds: 3);
    _timer = Timer.periodic(
      oneSec,
      (Timer timer) => setState(
        () {
          if (_start < 1) {
            _controllerCenterRight.play();
            _controllerCenterLeft.play();
            timer.cancel();
          } else {
            _start = _start - 1;
          }
        },
      ),
    );
  }

  @override
  void initState() {
    _controllerCenterRight =
        ConfettiController(duration: const Duration(seconds: 10));
    _controllerCenterLeft =
        ConfettiController(duration: const Duration(seconds: 10));
    super.initState();
  }

  @override
  void dispose() {
    _controllerCenterRight.dispose();
    _controllerCenterLeft.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    StartTimer();
    return Scaffold(
      bottomNavigationBar: SizedBox(
        height: 50,
        child: const BottomAppBar(
          shape: CircularNotchedRectangle(),
          color: ColorName.primary,
        ),
      ),
      floatingActionButton: FloatingActionButton(
        shape: const CircleBorder(),
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return const NextScreen();
          }));
        },
        backgroundColor: ColorName.secondary,
        child: const Icon(
          Icons.play_circle,
          color: Colors.white,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      body: Column(
        children: [
          ClipPath(
            clipper: WaveClipperTwo(),
            child: Container(
              height: 220,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(
                      'https://raw.githubusercontent.com/akhher/assets/main/images/eid.jpg'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(right: 30),
            child: Align(
              alignment: Alignment.centerRight,
              child: Text(
                '$_start',
                style: TextStyle(fontWeight: FontWeight.w900, fontSize: 60),
              ),
            ),
          ),
          Stack(
            children: [
              Align(
                alignment: Alignment.centerRight,
                child: ConfettiWidget(
                  confettiController: _controllerCenterRight,
                  blastDirection: pi,
                  particleDrag: 0.05,
                  emissionFrequency: 0.05,
                  numberOfParticles: 20,
                  gravity: 0.05,
                  shouldLoop: false,
                  colors: const [Colors.green, Colors.yellow, Colors.pink],
                ),
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: ConfettiWidget(
                  confettiController: _controllerCenterLeft,
                  blastDirection: 0,
                  emissionFrequency: 0.6,
                  minimumSize: const Size(10, 10),
                  maximumSize: const Size(10, 10),
                  numberOfParticles: 1,
                  gravity: 0.1,
                ),
              ),
              Column(
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 20),
                    child: Text(
                      'Eid Fitri',
                      style: TextStyle(
                          fontSize: 90,
                          fontWeight: FontWeight.w900,
                          color: const Color(0xff13195b)),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 50),
                    child: Text(
                      'Mubarak',
                      style: TextStyle(
                          fontSize: 50,
                          fontWeight: FontWeight.w900,
                          color: const Color(0xff13195b)),
                    ),
                  )
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}
