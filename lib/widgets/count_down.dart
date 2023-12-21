import 'dart:async';

import 'package:flutter/material.dart';

class CountdownWidget extends StatefulWidget {
  final int timestampInMilliseconds;

  const CountdownWidget({super.key, required this.timestampInMilliseconds});

  @override
  _CountdownWidgetState createState() => _CountdownWidgetState();
}

class _CountdownWidgetState extends State<CountdownWidget> {
  late Timer _timer;
  late Duration _remainingTime = Duration();

  @override
  void initState() {
    super.initState();

    const oneSecond = Duration(seconds: 1);

    // Create a periodic timer to update the countdown every second
    _timer = Timer.periodic(oneSecond, (timer) {
      // Get the current time
      DateTime now = DateTime.now();

      // Convert timestamp to DateTime
      DateTime targetDateTime = DateTime.fromMillisecondsSinceEpoch(
          widget.timestampInMilliseconds + 8 * 60 * 60 * 1000);

      // Check if the target time is in the past
      if (now.isAfter(targetDateTime)) {
        timer.cancel(); // Stop the timer
        // Optionally, you can perform some action when the countdown expires
      } else {
        // Calculate the remaining time
        setState(() {
          _remainingTime = targetDateTime.difference(now);
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        '(starts in: ${formatDuration(_remainingTime)})',
        style: TextStyle(
            color: Colors.yellow[200],
            fontSize: 18,
            fontWeight: FontWeight.w500),
      ),
    );
  }

  @override
  void dispose() {
    _timer.cancel(); // Cancel the timer when the widget is disposed
    super.dispose();
  }

  String formatDuration(Duration duration) {
    // Create a DurationFormat object for the desired format
    final durationFormat = DurationFormat();

    // Format the Duration using the DurationFormat
    return durationFormat.format(duration);
  }
}

class DurationFormat {
  String format(Duration duration) {
    final days = duration.inDays;
    final hours = duration.inHours % 24;
    final minutes = duration.inMinutes % 60;
    final seconds = duration.inSeconds % 60;

    return '${days}d ${hours}h ${minutes}m ${seconds}s';
  }
}
