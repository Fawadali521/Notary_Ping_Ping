// ignore_for_file: file_names

import 'package:fl_chart/fl_chart.dart';
import 'package:notary_ping_notary/index.dart';

class BarChartHome extends StatefulWidget {
  const BarChartHome({super.key});

  @override
  State<StatefulWidget> createState() => BarChartHomeState();
}

class BarChartHomeState extends State<BarChartHome> {
  final Duration animDuration = const Duration(milliseconds: 250);

  int touchedIndex = -1;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 1,
      margin: EdgeInsets.zero,
      surfaceTintColor: Palette.whiteColor,
      color: Palette.whiteColor,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 20.h),
        child: AspectRatio(
          aspectRatio: 1.5,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: BarChart(
              mainBarData(),
              swapAnimationDuration: animDuration,
            ),
          ),
        ),
      ),
    );
  }

  BarChartGroupData makeGroupData(
    int x,
    double y, {
    bool isTouched = false,
    Color? barColor,
    double width = 22,
    List<int> showTooltips = const [],
  }) {
    barColor ??= Palette.primaryColor;
    return BarChartGroupData(
      x: x,
      barRods: [
        BarChartRodData(
          toY: isTouched ? y + 1 : y,
          color: isTouched ? Palette.greenColor : barColor,
          width: width,
          borderSide: isTouched
              ? const BorderSide(color: Palette.greenColor)
              : const BorderSide(color: Colors.white, width: 0),
          backDrawRodData: BackgroundBarChartRodData(
            show: true,
            toY: 20,
            color: Palette.primaryColor.withOpacity(0.3),
          ),
        ),
      ],
      showingTooltipIndicators: showTooltips,
    );
  }

  List<BarChartGroupData> showingGroups() => List.generate(7, (i) {
        switch (i) {
          case 0:
            return makeGroupData(0, 5, isTouched: i == touchedIndex);
          case 1:
            return makeGroupData(1, 6.5, isTouched: i == touchedIndex);
          case 2:
            return makeGroupData(2, 5, isTouched: i == touchedIndex);
          case 3:
            return makeGroupData(3, 7.5, isTouched: i == touchedIndex);
          case 4:
            return makeGroupData(4, 9, isTouched: i == touchedIndex);
          case 5:
            return makeGroupData(5, 11.5, isTouched: i == touchedIndex);
          case 6:
            return makeGroupData(6, 6.5, isTouched: i == touchedIndex);
          default:
            return throw Error();
        }
      });

  BarChartData mainBarData() {
    return BarChartData(
      barTouchData: BarTouchData(
        touchTooltipData: BarTouchTooltipData(
          tooltipBgColor: Palette.blackColor,
          tooltipHorizontalAlignment: FLHorizontalAlignment.center,
          // tooltipMargin: 20,
          getTooltipItem: (group, groupIndex, rod, rodIndex) {
            String weekDay;
            switch (group.x) {
              case 0:
                weekDay = 'Monday';
                break;
              case 1:
                weekDay = 'Tuesday';
                break;
              case 2:
                weekDay = 'Wednesday';
                break;
              case 3:
                weekDay = 'Thursday';
                break;
              case 4:
                weekDay = 'Friday';
                break;
              case 5:
                weekDay = 'Saturday';
                break;
              case 6:
                weekDay = 'Sunday';
                break;
              default:
                throw Error();
            }
            return BarTooltipItem(
              '$weekDay\n',
              TextStyles.titleMedium.copyWith(
                color: Palette.whiteColor,
              ),
              children: <TextSpan>[
                TextSpan(
                  text: (rod.toY - 1).toString(),
                  style: TextStyles.titleMedium.copyWith(
                    color: Palette.greenColor,
                  ),
                ),
              ],
            );
          },
        ),
        touchCallback: (FlTouchEvent event, barTouchResponse) {
          setState(() {
            if (!event.isInterestedForInteractions ||
                barTouchResponse == null ||
                barTouchResponse.spot == null) {
              touchedIndex = -1;
              return;
            }
            touchedIndex = barTouchResponse.spot!.touchedBarGroupIndex;
          });
        },
      ),
      titlesData: FlTitlesData(
        show: true,
        rightTitles: const AxisTitles(
          sideTitles: SideTitles(
            showTitles: false,
          ),
        ),
        topTitles: const AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        bottomTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            getTitlesWidget: getTitles,
            reservedSize: 38,
          ),
        ),
        leftTitles: const AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            reservedSize: 30,
          ),
        ),
      ),
      borderData: FlBorderData(
        show: false,
      ),
      barGroups: showingGroups(),
      gridData: const FlGridData(
        drawVerticalLine: false,
      ),
    );
  }

  Widget getTitles(double value, TitleMeta meta) {
    Widget text;
    switch (value.toInt()) {
      case 0:
        text = const Text('M', style: TextStyles.bodyMedium);
        break;
      case 1:
        text = const Text('T', style: TextStyles.bodyMedium);
        break;
      case 2:
        text = const Text('W', style: TextStyles.bodyMedium);
        break;
      case 3:
        text = const Text('T', style: TextStyles.bodyMedium);
        break;
      case 4:
        text = const Text('F', style: TextStyles.bodyMedium);
        break;
      case 5:
        text = const Text('S', style: TextStyles.bodyMedium);
        break;
      case 6:
        text = const Text('S', style: TextStyles.bodyMedium);
        break;
      default:
        text = const Text('', style: TextStyles.bodyMedium);
        break;
    }
    return SideTitleWidget(
      axisSide: meta.axisSide,
      space: 16,
      child: text,
    );
  }
}
