import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:fidefund/screens/real_time/real_time_top/real_time_line_chart.dart';
import 'package:fidefund/theme/colors.dart';
import 'package:fidefund/theme/typography.dart';

class RealTimeAppBar extends StatefulWidget {
  const RealTimeAppBar({super.key});

  @override
  _RealTimeAppBarState createState() => _RealTimeAppBarState();
}

class _RealTimeAppBarState extends State<RealTimeAppBar> {
  final int _baseAmount = Random().nextInt(4991) + 1000000;
  late int _currentAmount;
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _currentAmount = _baseAmount;
    _startUpdatingAmount();
  }

  void _startUpdatingAmount() {
    _timer = Timer.periodic(const Duration(seconds: 10), (timer) {
      setState(() {
        _currentAmount += Random().nextInt(4991) + 10; 
      });
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final String formattedAmount = NumberFormat('#,###').format(_currentAmount);

    return SliverAppBar(
      backgroundColor: Colors.transparent,
      expandedHeight: 300,
      floating: false,
      pinned: true,
      flexibleSpace: LayoutBuilder(
        builder: (context, constraints) {
          double maxExtent = 300;
          double minExtent = kToolbarHeight;
          double shrinkRatio = (constraints.maxHeight - minExtent) / (maxExtent - minExtent);
          double titleFontSize = (shrinkRatio * 24 + 10).clamp(14, 20);
          double titleTop = (constraints.maxHeight - 40).clamp(kToolbarHeight / 4, 260);

          return Material(
            elevation: 4,
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(bottom: Radius.circular(20)),
            ),
            color: AppColors.darkBlue,
            child: Stack(
              alignment: Alignment.center,
              children: [
                Positioned(
                  top: 0,
                  bottom: 30,
                  left: 0,
                  right: 0,
                  child: Opacity(
                    opacity: shrinkRatio,
                    child: SizedBox(
                      height: shrinkRatio * 150,
                      child: RealTimeLineChart(),
                    ),
                  ),
                ),
                Positioned(
                  top: titleTop,
                  child: Text.rich(
                    TextSpan(
                      text: 'Total Amount Raised:  ',
                      style: AppTypography.textStyle(
                        color: Colors.white,
                        fontSize: titleFontSize - (titleFontSize == 14 ? 0 : 6),
                        fontWeight: FontWeight.w300,
                      ),
                      children: [
                        TextSpan(
                          text: 'MYR $formattedAmount',
                          style: AppTypography.textStyle(
                            color: Colors.white,
                            fontSize: titleFontSize,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
