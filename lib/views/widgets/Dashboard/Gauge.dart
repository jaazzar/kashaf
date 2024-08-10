import 'package:flutter/material.dart';
import 'package:gauge_indicator/gauge_indicator.dart';

class GaugeIndicator extends StatelessWidget {
  final double value;

  const GaugeIndicator({super.key, required this.value});

  /// Build method of your widget.
  @override
  Widget build(BuildContext context) {
    // Create animated radial gauge.
    // All arguments changes will be automatically animated.
    return AnimatedRadialGauge(

        /// The animation duration.
        duration: const Duration(seconds: 1),
        curve: Curves.elasticOut,

        /// Define the radius.
        /// If you omit this value, the parent size will be used, if possible.
        radius: 50,

        /// Gauge value.
        value: value,

        /// Optionally, you can configure your gauge, providing additional
        /// styles and transformers.
        axis: const GaugeAxis(

            /// Provide the [min] and [max] value for the [value] argument.
            min: 0,
            max: 40000,

            /// Render the gauge as a 180-degree arc.
            degrees: 270,

            /// Set the background color and axis thickness.
            style: GaugeAxisStyle(
              cornerRadius: Radius.circular(50),
              thickness: 7,
              background: Color(0xFFDFE2EC),
              segmentSpacing: 1,
            ),
            pointer: null,

            /// Define the pointer that will indicate the progress (optional).
            // pointer: GaugePointer.needle(
            //   borderRadius: 16,
            //   color: Colors.black,
            //   height: 10,
            //   width: 50,
            // ),

            /// Define the progress bar (optional).
            progressBar: GaugeProgressBar.rounded(
              color: Color(0xFF1E40AF),
            ),

            /// Define axis segments (optional).
            segments: [
              GaugeSegment(
                from: 0,
                to: 100,
                color: Color(0xFF1E40AF),
                cornerRadius: Radius.zero,
              ),
              // const GaugeSegment(
              //   from: 33.3,
              //   to: 66.6,
              //   color: Color(0xFFD9DEEB),
              //   cornerRadius: Radius.zero,
              // ),
              // const GaugeSegment(
              //   from: 66.6,
              //   to: 100,
              //   color: Color(0xFFD9DEEB),
              //   cornerRadius: Radius.zero,
              // ),
            ]),
        builder: (context, child, value) => Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                RadialGaugeLabel(
                  value: value,
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Text(
                  "ريال",
                  style: TextStyle(color: Colors.black54),
                )
              ],
            ));
  }
}
