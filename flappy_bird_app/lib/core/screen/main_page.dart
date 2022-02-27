import 'dart:async';
import 'package:flappy_bird_app/core/widgets/barriers.dart';
import 'package:flappy_bird_app/core/widgets/my_bird.dart';
import 'package:flutter/material.dart';

class Homepage extends StatefulWidget {
  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  static double birdYaxis = 0;
  double time = 0;
  double height = 0;
  double initialHeight = birdYaxis;
  bool gameHasStarted = false;
  static double barrierXone = 1;
  double barrierXtwo = barrierXone + 1.5;

  void jump() {
    setState(() {
      time = 0;
      initialHeight = birdYaxis;
    });
  }

  void startGame() {
    gameHasStarted = true;
    Timer.periodic(Duration(milliseconds: 50), (timer) {
      time += 0.04;
      height = -4.9 * time * time + 2.8 * time;
      setState(() {
        birdYaxis = initialHeight - height;
      });

      setState(() {
        if (barrierXone < -2) {
          barrierXone += 3.5;
        } else {
          barrierXone -= 0.05;
        }
      });
      setState(() {
        if (barrierXtwo < -2) {
          barrierXone += 3.5;
        } else {
          barrierXtwo -= 0.05;
        }
      });
      if (birdYaxis > 1) {
        timer.cancel();
        gameHasStarted = false;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (gameHasStarted) {
          jump();
        } else {
          startGame();
        }
      },
      child: Scaffold(
        body: Column(
          children: [
            Expanded(
              flex: 2,
              child: Stack(
                children: [
                  AnimatedContainer(
                      alignment: Alignment(0, birdYaxis),
                      duration: Duration(microseconds: 0),
                      color: Color.fromARGB(255, 49, 118, 170),
                      child: MyBird()),
                  Container(
                    alignment: Alignment(0, -0.2),
                    child: gameHasStarted
                        ? Text("")
                        : Text(
                            "T A P   T O   P L A Y",
                            textScaleFactor: 1.2,
                          ),
                  ),
                  AnimatedContainer(
                    alignment: Alignment(barrierXone, 1.1),
                    duration: Duration(milliseconds: 0),
                    child: MyBarrier(size: 210.0),
                  ),
                  AnimatedContainer(
                    alignment: Alignment(barrierXone, -1.4),
                    duration: Duration(milliseconds: 0),
                    child: MyBarrier(size: 200.0),
                  ),
                  AnimatedContainer(
                    alignment: Alignment(barrierXtwo, 1.4),
                    duration: Duration(milliseconds: 0),
                    child: MyBarrier(size: 260.0),
                  ),
                  AnimatedContainer(
                    alignment: Alignment(barrierXtwo, -1.1),
                    duration: Duration(milliseconds: 0),
                    child: MyBarrier(size: 180.0),
                  ),
                ],
              ),
            ),
            Container(
              height: 15,
              color: Colors.green,
            ),
            Expanded(
                child: Container(
              color: Color.fromARGB(255, 202, 152, 152),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Score",
                        textScaleFactor: 2.5,
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        "20",
                        textScaleFactor: 2.2,
                      )
                    ],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Best",
                        textScaleFactor: 2.5,
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        "120",
                        textScaleFactor: 2.2,
                      )
                    ],
                  )
                ],
              ),
            ))
          ],
        ),
      ),
    );
  }
}
