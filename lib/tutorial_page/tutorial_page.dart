import 'package:flutter/material.dart';
import 'package:slidiv/common/navigation/navigation_util.dart';
import 'package:slidiv/common/style/slidiv_bold_text.dart';
import 'package:slidiv/common/style/slidiv_normal_text.dart';
import 'package:slidiv/data/rectangular_maze_7x7_data.dart';
import 'package:slidiv/maze_widget/rectangular_maze.dart';

class TutorialPage extends StatelessWidget {
  const TutorialPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey.shade300,
      child: Padding(
        padding: const EdgeInsets.only(
          left: 32.0,
          right: 32.0,
          bottom: 128.0,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Hero(
              tag: "slidiv_title_text",
              child: Text(
                "Slidiv Tutorial",
                style: SlidivBoldText(),
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(top: 16.0),
              child: Text(
                "A simple maze, but you can't turn your back!",
                style: SlidivNormalText(),
              ),
            ),
            GestureDetector(
              onTap: () => _handleStartMaze(context),
              child: Container(
                margin: const EdgeInsets.all(16.0),
                padding: const EdgeInsets.symmetric(
                  horizontal: 14.0,
                  vertical: 8.0,
                ),
                decoration: BoxDecoration(
                  color: Colors.green.shade100,
                  boxShadow: const [
                    BoxShadow(
                      blurStyle: BlurStyle.inner,
                      blurRadius: 4.0,
                      spreadRadius: 0.5,
                      offset: Offset(0.0, 2.0),
                    ),
                  ],
                  borderRadius: const BorderRadius.all(Radius.circular(16.0)),
                ),
                child: const Text(
                  "Start",
                  style: SlidivBoldText(fontSize: 24.0),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  void _handleStartMaze(BuildContext context) {
    final _mazeData = RectangularMaze7x7();
    final _mazeMap = RectangularMaze(_mazeData);

    NavigationUtil.push(context, _mazeMap);
  }
}