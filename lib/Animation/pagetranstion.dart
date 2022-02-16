import 'dart:async';
import 'dart:math';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:wallpaperr/pages/homepage.dart';

class MyCustomWidget extends StatefulWidget {
  @override
  _MyCustomWidgetState createState() => _MyCustomWidgetState();
}

class _MyCustomWidgetState extends State<MyCustomWidget>
    with SingleTickerProviderStateMixin {

  AnimationController? scaleController;
  Animation<double>? scaleAnimation;

  List<dynamic> names = [
    'Iran', // 0  
    'Music',
    'future',
    'Flowers',
    'IT',
    'happy',
    'sad',
    'game',
    'andgry'
  ];

  
  int randnumber = Random().nextInt(8); // randnumber of images 

  @override
  void initState() {
    super.initState();

    scaleController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 1200))
      ..addStatusListener(
        (status) {
          if (status == AnimationStatus.completed) {
            Navigator.of(context).pushReplacement(PageRouteBuilder(
                pageBuilder: (c, a, b) => Imagepage(
                      query: names[randnumber],
                    )));
            Timer(
              const Duration(milliseconds: 300),
              () {
                // print('worked');
                scaleController!.reset();
              },
            );
          }
        },
      );

    scaleAnimation =
        Tween<double>(begin: 0.0, end: 40.0).animate(scaleController!);
  }

  @override
  void dispose() {
    scaleController!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext c) {
    var we = MediaQuery.of(context).size.width;
    var he = MediaQuery.of(context).size.height;
    return Center(
        child: InkWell(
            onTap: () {
              scaleController!.forward();
            },
            child: Expanded(
              child: Container(
                width: 45,
                height: 45,
                margin: const EdgeInsets.only(left: 5),
                decoration: const BoxDecoration(
                  color: Colors.black,
                  shape: BoxShape.circle,
                ),
                child: AnimatedBuilder(
                  animation: scaleAnimation!,
                  builder: (c, child) => Transform.scale(
                    scale: scaleAnimation!.value,
                    child: Container(
                      decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          gradient: LinearGradient(
                              colors: [
                                Colors.deepOrangeAccent,
                                Colors.yellowAccent
                              ],
                              begin: Alignment.centerRight,
                              end: Alignment.centerLeft)),
                    ),
                  ),
                ),
              ),
            )));
  }
}



class normal extends StatelessWidget {
  const normal({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var we = MediaQuery.of(context).size.width;
    var he = MediaQuery.of(context).size.height;
    return Container(
      width: we * 0.5,
      height: 65,
      decoration: BoxDecoration(
        color: const Color(0xFFFED800),
        borderRadius: BorderRadius.circular(30),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            width: 45,
            height: 45,
            margin: const EdgeInsets.only(left: 10),
            decoration: const BoxDecoration(
                shape: BoxShape.circle, color: Colors.white),
          ),
          SizedBox(
            width: we * 0.065,
          ),
          const Text(
            "Let's Start",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
