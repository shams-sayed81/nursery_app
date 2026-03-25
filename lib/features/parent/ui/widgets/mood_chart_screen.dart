import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class MoodDonutChart extends StatelessWidget {
  const MoodDonutChart({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 220,
      child: PieChart(
        PieChartData(
          sectionsSpace: 2,
          centerSpaceRadius: 55,
          sections: [
            PieChartSectionData(
              value: 65,
              color: Colors.green,
              radius: 22,
              showTitle: false,
            ),
            PieChartSectionData(
              value: 20,
              color: Colors.amber,
              radius: 22,
              showTitle: false,
            ),
            PieChartSectionData(
              value: 10,
              color: Colors.orange,
              radius: 22,
              showTitle: false,
            ),
            PieChartSectionData(
              value: 5,
              color: Colors.red,
              radius: 22,
              showTitle: false,
            ),
          ],
        ),
      ),
    );
  }
}

class MoodLegend extends StatelessWidget {
  const MoodLegend({super.key});

  Widget item(Color color, String text) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(width: 10, height: 10, color: color),
        const SizedBox(width: 4),
        Text(text),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 12,
      children: [
        item(Colors.green, "Happy"),
        item(Colors.amber, "Neutral"),
        item(Colors.orange, "Sad"),
        item(Colors.red, "Crying"),
      ],
    );
  }
}

class MoodChartCard extends StatelessWidget {
  const MoodChartCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      margin: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xffF3F4F6),
        borderRadius: BorderRadius.circular(20),
        boxShadow: const [
          BoxShadow(color: Colors.black12, blurRadius: 8)
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: const [
          MoodDonutChart(),
          SizedBox(height: 12),
          MoodLegend(),
          SizedBox(height: 16),
          Text.rich(
            TextSpan(
              text: "Most frequent mood this week: ",
              children: [
                TextSpan(
                  text: "Happy",
                  style: TextStyle(
                    color: Colors.green,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}