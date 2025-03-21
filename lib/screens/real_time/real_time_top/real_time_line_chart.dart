import 'package:fidefund/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'dart:async';
import 'dart:math' as math;

class RealTimeLineChart extends StatefulWidget {
  RealTimeLineChart({Key? key}) : super(key: key);

  @override
  _RealTimeLineChartState createState() => _RealTimeLineChartState();
}

class _RealTimeLineChartState extends State<RealTimeLineChart> {
  late List<LiveData> chartData;
  late ChartSeriesController _chartSeriesController;
  late Timer _timer;
  int time = 19;

  @override
  void initState() {
    super.initState();
    chartData = getChartData();
    _timer = Timer.periodic(const Duration(seconds: 10), updateDataSource);
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Column(
          children: [
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 10),
              child: Text(
                'Latest Donations Received',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  color: AppColors.secondaryBlue,
                ),
              ),
            ),
            Expanded(
              child: SfCartesianChart(
                plotAreaBorderWidth: 0,
                series: <LineSeries<LiveData, int>>[
                  LineSeries<LiveData, int>(
                    onRendererCreated: (ChartSeriesController controller) {
                      _chartSeriesController = controller;
                    },
                    dataSource: chartData,
                    color: AppColors.secondaryBlue,
                    xValueMapper: (LiveData sales, _) => sales.time,
                    yValueMapper: (LiveData sales, _) => sales.speed,
                  ),
                ],
                primaryXAxis: NumericAxis(
                  axisLine: const AxisLine(width: 0),
                  majorTickLines: const MajorTickLines(size: 5),
                  majorGridLines: const MajorGridLines(width: 0),
                  edgeLabelPlacement: EdgeLabelPlacement.shift,
                  interval: 3,
                  labelStyle: const TextStyle(color: Colors.transparent),
                  axisLabelFormatter: (AxisLabelRenderDetails details) {
                    if (details.value == chartData.last.time) {
                      return ChartAxisLabel(
                        DateFormat('HH:mm:ss').format(DateTime.now()),
                        const TextStyle(color: AppColors.primaryBlue, fontWeight: FontWeight.normal),
                      );
                    }
                    return ChartAxisLabel('', const TextStyle(color: Colors.transparent));
                  },
                ),
                primaryYAxis: NumericAxis(
                  axisLine: const AxisLine(width: 0),
                  majorTickLines: const MajorTickLines(size: 5),
                  majorGridLines: const MajorGridLines(width: 0),
                  labelStyle: const TextStyle(color: AppColors.primaryBlue),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void updateDataSource(Timer timer) {
    setState(() {
      chartData.add(LiveData(time++, math.Random().nextInt(200)));
      chartData.removeAt(0);
      _chartSeriesController.updateDataSource(
        addedDataIndex: chartData.length - 1,
        removedDataIndex: 0,
      );
    });
  }

  List<LiveData> getChartData() {
    return List.generate(19, (index) => LiveData(index, math.Random().nextInt(100) + 40));
  }
}

class LiveData {
  LiveData(this.time, this.speed);
  final int time;
  final num speed;
}
