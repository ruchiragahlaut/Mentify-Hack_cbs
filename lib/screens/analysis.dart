/// Example of a simple line chart.
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

class DailyAnalysis extends StatefulWidget {
  @override
  _DailyAnalysisState createState() => _DailyAnalysisState();
}

class _DailyAnalysisState extends State<DailyAnalysis> {
  /// Create one series with sample hard coded data.
  static List<charts.Series<LinearSales, int>> createSampleData1() {
    final data = [
      new LinearSales(1, 25),
      new LinearSales(2, 100),
      new LinearSales(3, 75),
      new LinearSales(4, 80),
      new LinearSales(5, 90),
      new LinearSales(6, 15),
      new LinearSales(7, 79),
      new LinearSales(8, 91),
      new LinearSales(9, 66),
      new LinearSales(10, 73),
      new LinearSales(11, 87),
      new LinearSales(12, 29),
      new LinearSales(13, 88),
      new LinearSales(14, 97),
      new LinearSales(15, 95),
      new LinearSales(16, 33),
      new LinearSales(17, 71),
      new LinearSales(18, 79),
      new LinearSales(19, 86),
      new LinearSales(20, 84),
      new LinearSales(21, 76),
      new LinearSales(22, 18),
      new LinearSales(23, 22),
      new LinearSales(24, 70),
      new LinearSales(25, 80),
      new LinearSales(26, 90),
      new LinearSales(27, 12),
      new LinearSales(28, 96),
      new LinearSales(29, 75),
      new LinearSales(30, 71),
    ];

    return [
      new charts.Series<LinearSales, int>(
        id: 'Sales',
        colorFn: (_, __) => charts.MaterialPalette.blue.shadeDefault,
        domainFn: (LinearSales sales, _) => sales.year,
        measureFn: (LinearSales sales, _) => sales.sales,
        data: data,
      )
    ];
  }

  static List<charts.Series<LinearSales, int>> createSampleData2() {
    final data = [
      new LinearSales(1, 26),
      new LinearSales(2, 99),
      new LinearSales(3, 76),
      new LinearSales(4, 81),
      new LinearSales(5, 91),
      new LinearSales(6, 40),
      new LinearSales(7, 80),
      new LinearSales(8, 92),
      new LinearSales(9, 80),
      new LinearSales(10, 74),
      new LinearSales(11, 88),
      new LinearSales(12, 30),
      new LinearSales(13, 89),
      new LinearSales(14, 98),
      new LinearSales(15, 96),
      new LinearSales(16, 34),
      new LinearSales(17, 72),
      new LinearSales(18, 80),
      new LinearSales(19, 87),
      new LinearSales(20, 85),
      new LinearSales(21, 77),
      new LinearSales(22, 56),
      new LinearSales(23, 66),
      new LinearSales(24, 71),
      new LinearSales(25, 81),
      new LinearSales(26, 91),
      new LinearSales(27, 13),
      new LinearSales(28, 97),
      new LinearSales(29, 76),
      new LinearSales(30, 72),
    ];

    return [
      new charts.Series<LinearSales, int>(
        id: 'Sales',
        colorFn: (_, __) => charts.MaterialPalette.blue.shadeDefault,
        domainFn: (LinearSales sales, _) => sales.year,
        measureFn: (LinearSales sales, _) => sales.sales,
        data: data,
      )
    ];
  }

  static List<charts.Series<LinearSales, int>> createSampleData3() {
    final data = [
      new LinearSales(1, 0),
      new LinearSales(2, 9),
      new LinearSales(3, 7),
      new LinearSales(4, 8),
      new LinearSales(5, 9),
      new LinearSales(6, 1),
      new LinearSales(7, 7),
      new LinearSales(8, 9),
      new LinearSales(9, 6),
      new LinearSales(10, 7),
      new LinearSales(11, 5),
      new LinearSales(12, 2),
      new LinearSales(13, 8),
      new LinearSales(14, 9),
      new LinearSales(15, 6),
      new LinearSales(16, 3),
      new LinearSales(17, 7),
      new LinearSales(18, 2),
      new LinearSales(19, 8),
      new LinearSales(20, 9),
      new LinearSales(21, 7),
      new LinearSales(22, 1),
      new LinearSales(23, 2),
      new LinearSales(24, 7),
      new LinearSales(25, 8),
      new LinearSales(26, 9),
      new LinearSales(27, 1),
      new LinearSales(28, 9),
      new LinearSales(29, 7),
      new LinearSales(30, 0),
    ];

    return [
      new charts.Series<LinearSales, int>(
        id: 'Sales',
        colorFn: (_, __) => charts.MaterialPalette.blue.shadeDefault,
        domainFn: (LinearSales sales, _) => sales.year,
        measureFn: (LinearSales sales, _) => sales.sales,
        data: data,
      )
    ];
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Container(
                color: Colors.orangeAccent,
                alignment: Alignment.center,
                child: TyperAnimatedTextKit(
                    isRepeatingAnimation: false,
                    onTap: () {
                      print("Tap Event");
                    },
                    text: [
                      "Browsing Data Analysis",
                    ],
                    textStyle: TextStyle(
                      fontSize: 24.0,
                      color: Colors.black45,
                      fontFamily: "Agne",
                    ),
                    textAlign: TextAlign.center,
                    alignment:
                        AlignmentDirectional.topStart // or Alignment.topLeft
                    ),
              ),
              Container(
                height: 200.0,
                child: new charts.LineChart(
                  createSampleData1(),
                  animate: true,
                  animationDuration: Duration(seconds: 4),
                ),
              ),
              SizedBox(
                height: 10.0,
              ),
              Container(
                color: Colors.orangeAccent,
                alignment: Alignment.center,
                child: TyperAnimatedTextKit(
                    isRepeatingAnimation: false,
                    onTap: () {
                      print("Tap Event");
                    },
                    text: [
                      "Social Media Analysis",
                    ],
                    textStyle: TextStyle(
                      fontSize: 24.0,
                      color: Colors.black45,
                      fontFamily: "Agne",
                    ),
                    textAlign: TextAlign.center,
                    alignment:
                        AlignmentDirectional.topStart // or Alignment.topLeft
                    ),
              ),
              Container(
                height: 200.0,
                child: new charts.LineChart(
                  createSampleData2(),
                  animate: true,
                  animationDuration: Duration(seconds: 4),
                ),
              ),
              SizedBox(
                height: 10.0,
              ),
              Container(
                color: Colors.orangeAccent,
                alignment: Alignment.center,
                child: TyperAnimatedTextKit(
                    isRepeatingAnimation: false,
                    onTap: () {
                      print("Tap Event");
                    },
                    text: [
                      "Mood Analysis",
                    ],
                    textStyle: TextStyle(
                      fontSize: 24.0,
                      color: Colors.black45,
                      fontFamily: "Agne",
                    ),
                    textAlign: TextAlign.center,
                    alignment:
                        AlignmentDirectional.topStart // or Alignment.topLeft
                    ),
              ),
              Container(
                height: 200.0,
                child: new charts.LineChart(
                  createSampleData3(),
                  animate: true,
                  animationDuration: Duration(seconds: 4),
                ),
              ),
              SizedBox(
                height: 10.0,
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class LinearSales {
  final int year;
  final int sales;

  LinearSales(this.year, this.sales);
}
