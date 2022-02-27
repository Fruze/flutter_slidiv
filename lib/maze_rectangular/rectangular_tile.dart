import 'package:flutter/material.dart';
import 'package:slidiv/common/enum/direction_enum.dart';
import 'package:slidiv/common/enum/screen_size_enum.dart';
import 'package:slidiv/common/widgets/responsive_container_widget.dart';
import 'package:slidiv/maze_rectangular/rectangular_side.dart';

class RectangularTile extends StatelessWidget {
  RectangularTile({
    required this.tileConfiguration,
    required this.occupied,
    required this.tileColor,
    required this.direction,
    Key? key,
  }) : super(key: key);

  final List<String> tileConfiguration;
  final bool occupied;
  final Color tileColor;
  final Direction? direction;

  late final RectangularSide side = RectangularSide(
    up: int.parse(tileConfiguration[0]),
    right: int.parse(tileConfiguration[1]),
    down: int.parse(tileConfiguration[2]),
    left: int.parse(tileConfiguration[3]),
  );

  @override
  Widget build(BuildContext context) {
    return ResponsiveContainer(
      child: (context, screenSize) {
        final double _tileSize;

        switch (screenSize) {
          case ScreenSize.small:
            _tileSize = 30.0;
            break;
          case ScreenSize.large:
            _tileSize = 50.0;
            break;
        }

        return Stack(
          children: [
            Container(
              width: _tileSize,
              height: _tileSize,
              color: tileColor,
              child: Stack(
                children: [
                  Visibility(
                    visible: occupied,
                    child: Container(
                      margin: const EdgeInsets.all(8.0),
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.red,
                      ),
                    ),
                  ),
                  // TODO Fix trail render
                  Visibility(
                    visible: !occupied && direction != null,
                    child: SizedBox(
                      width: _tileSize,
                      height: _tileSize,
                      child: (direction == Direction.up ||
                              direction == Direction.down)
                          ? const VerticalDivider(color: Colors.red)
                          : const Divider(color: Colors.red),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              width: _tileSize,
              height: _tileSize,
              decoration: BoxDecoration(
                border: Border(
                  bottom: _createBorder(side.down),
                  left: _createBorder(side.left),
                  right: _createBorder(side.right),
                  top: _createBorder(side.up),
                ),
              ),
            )
          ],
        );
      },
    );
  }

  BorderSide _createBorder(int borderSide) {
    if (borderSide != 1) {
      return const BorderSide(color: Colors.black);
    } else {
      return BorderSide.none;
    }
  }

  double inverse(int num) {
    if (num == 1) {
      return 0;
    }
    return 1;
  }
}
