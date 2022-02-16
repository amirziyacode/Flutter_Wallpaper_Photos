import 'package:flutter/material.dart';
import 'package:loading_indicator/loading_indicator.dart'; 

class loading extends StatefulWidget {
  const loading({Key? key}) : super(key: key);

  @override
  _loadingState createState() => _loadingState();
}

class _loadingState extends State<loading> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: SafeArea(
        child: Container(
          width: 45,
          height: 45,
          margin: const EdgeInsets.only(top: 210),
          child: const LoadingIndicator(
            indicatorType: Indicator.lineScalePulseOut, // custom loading indicator ...
            strokeWidth: 2,
            colors: [
              Colors.yellow,
            ],
          ),
        ),
      ),
    );
  }
}
