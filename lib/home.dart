import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'Animation/pagetranstion.dart';

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  void initState() {
    super.initState();
    SystemChrome.setPreferredOrientations(
        [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]); // lock Screen .. 
  }

  @override
  Widget build(BuildContext context) {
    var we = MediaQuery.of(context).size.width;
    var he = MediaQuery.of(context).size.height;
    return Scaffold(
        backgroundColor: Colors.black, //0xFF040406
        body: SafeArea(
          child: SizedBox(
            width: we,
            height: he,
            child: Column(
              children: <Widget>[
                SizedBox(
                  width: we * 0.7,
                  height: he * 0.6,
                  child: Expanded(child: CachedNetworkImage(imageUrl: "https://cdn.wallpapersafari.com/52/75/f2lzCH.jpg")),
                ),
                SizedBox(
                  height: he * 0.05,
                ),
                SizedBox(
                  child: Column(
                    children: [
                      const Text(
                        'Liven Up',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 25,
                        ),
                      ),
                      const Text(
                        'Your Mobile Screen',
                        style: TextStyle(
                            color: Color(0xFFFED800),
                            fontSize: 45,
                            fontFamily: "Dongle"),
                      ),
                      SizedBox(
                        height: he * 0.03,
                      ),
                      Container(
                        width: we * 0.5,
                        height: 65,
                        decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                                color: Colors.yellow.withOpacity(0.15),
                                spreadRadius: 5,
                                blurRadius: 8,
                                offset: const Offset(0.0, 9.0))
                          ],
                          color: const Color(0xFFFED800),
                          borderRadius: BorderRadius.circular(30),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text(
                              "Let's Start",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              width: we * 0.04,
                            ),
                            MyCustomWidget(),
                          ],
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ));
  }
}