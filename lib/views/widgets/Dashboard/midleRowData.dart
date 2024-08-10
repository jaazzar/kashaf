import 'package:flip_card/flip_card.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:wosul_app/views/widgets/Dashboard/Gauge.dart';
import 'package:wosul_app/views/widgets/Dashboard/chart.dart';

class MiddleRowData extends StatelessWidget {
  const MiddleRowData({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return FlipCard(
      direction: FlipDirection.VERTICAL,
      front: Stack(
        children: [
          Container(
            height: 148,
            width: double.infinity, // size.width / 3.5,
            margin: const EdgeInsets.symmetric(horizontal: 8),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8),
            ),
            child: const FittedBox(
              fit: BoxFit.contain,
              child: Padding(
                padding: EdgeInsets.all(16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "تكلفة\nالاصلاح التقديرية ",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.black54),
                    ),
                    SizedBox(width: 20),
                    GaugeIndicator(value: 24516),
                  ],
                ),
              ),
            ),
          ),
          Positioned(
              top: 20,
              left: 20,
              child: Icon(Icons.restart_alt, color: Colors.grey))
        ],
      ),
      back: Container(
        height: 148,
        width: double.infinity, // size.width / 3.5,
        margin: const EdgeInsets.symmetric(horizontal: 8),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Padding(
          padding: EdgeInsets.all(20),
          // width: 200,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            // crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("خط انتاج 1"),
                  Expanded(
                    child: new LinearPercentIndicator(
                      barRadius: Radius.circular(20),
                      // width: 200,
                      lineHeight: 8.0,
                      percent: 0.1,
                      backgroundColor: Color(0xFFDFE2EC),
                      progressColor: Color(0xFF1E40AF),
                    ),
                  ),
                  Text("8776 ريال"),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("خط انتاج 2"),
                  Expanded(
                    child: new LinearPercentIndicator(
                      barRadius: Radius.circular(20),
                      // width: 200,
                      lineHeight: 8.0,
                      percent: 0.8,
                      backgroundColor: Color(0xFFDFE2EC),
                      progressColor: Color(0xFF1E40AF),
                    ),
                  ),
                  Text("233 ريال"),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("خط انتاج 6"),
                  Expanded(
                    child: new LinearPercentIndicator(
                      barRadius: Radius.circular(20),
                      // width: 200,
                      lineHeight: 8.0,
                      percent: 0.6,
                      backgroundColor: Color(0xFFDFE2EC),
                      progressColor: Color(0xFF1E40AF),
                    ),
                  ),
                  Text("344 ريال"),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("9 خط انتاج"),
                  Expanded(
                    child: new LinearPercentIndicator(
                      barRadius: Radius.circular(20),
                      // width: 200,
                      lineHeight: 8.0,
                      percent: 0.5,
                      backgroundColor: Color(0xFFDFE2EC),
                      progressColor: Color(0xFF1E40AF),
                    ),
                  ),
                  Text("12 ريال"),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("خط انتاج 5"),
                  Expanded(
                    child: new LinearPercentIndicator(
                      barRadius: Radius.circular(20),
                      // width: 200,
                      lineHeight: 8.0,
                      percent: 0.9,
                      backgroundColor: Color(0xFFDFE2EC),
                      progressColor: Color(0xFF1E40AF),
                    ),
                  ),
                  Text("500 ريال"),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// SfCartesianChart(
//               // Initialize category axis

//               primaryXAxis: CategoryAxis(),
//               series: <LineSeries<SalesData, String>>[
//                 LineSeries<SalesData, String>(
//                     color: const Color(0xff1E40AF),

//                     // Bind data source
//                     dataSource: <SalesData>[
//                       SalesData('Jan', 35),
//                       SalesData('Feb', 28),
//                       SalesData('Mar', 34),
//                       SalesData('Apr', 32),
//                       SalesData('May', 40)
//                     ],
//                     xValueMapper: (SalesData sales, _) => sales.year,
//                     yValueMapper: (SalesData sales, _) => sales.sales)
//               ]),

class SalesData {
  SalesData(this.year, this.sales);
  final String year;
  final double sales;
}
