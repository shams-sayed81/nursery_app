import 'package:flutter/material.dart';
import 'package:gym_app/core/helpers/app_decoration.dart';

class CustomTabBar extends StatelessWidget {
  final List<Widget> tabs;
  final List<Color> indicatorColors;

  const CustomTabBar({
    super.key,
    required this.tabs,
    required this.indicatorColors,
  });

  @override
  Widget build(BuildContext context) {
    final controller = DefaultTabController.of(context);

    return AnimatedBuilder(
      animation: controller,
      builder: (context, _) {
        return Container(
          decoration: AppDecorations.containerDecoration,
          child: TabBar(

            tabs: tabs,
            indicator: BoxDecoration(
              color: indicatorColors[controller.index]
                  .withValues(alpha: 0.3),
              borderRadius: BorderRadius.circular(14),
            ),
            indicatorSize: TabBarIndicatorSize.tab,
            labelColor: indicatorColors[controller.index],
            unselectedLabelColor: Colors.black,
          ),
        );
      },
    );
  }
}