import 'package:flutter/material.dart';
import 'package:wallpaperr/Animation/fadeanimationY.dart';
import 'package:wallpaperr/pages/profile_page.dart';
import 'package:wallpaperr/pages/search/search_image_view.dart';
import 'homepage.dart';


enum Gender{
  home,
  search,
  like,
  person
}

class custombottomnavigation extends StatefulWidget {
  int? pageindex;

  custombottomnavigation({required this.pageindex});
  @override
  _custombottomnavigationState createState() => _custombottomnavigationState(pageindex: pageindex);
}

class _custombottomnavigationState extends State<custombottomnavigation> {
  _custombottomnavigationState({required this.pageindex});

  Color coloricon = Colors.yellow;
  Gender? selected;
  Color colorindex = Colors.yellow;
  Color colorbackindx = Colors.yellow;

  int? pageindex;

  var query = "flowers";




  @override
  Widget build(BuildContext context) {
    var we = MediaQuery.of(context).size.width;
    var he = MediaQuery.of(context).size.height;
    return Container(
      color: Colors.black,
      height: 86,
      child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            FadeAnimationY(
              delay: 1.1,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(onPressed: (){
                    Navigator.of(context).pushReplacement(PageRouteBuilder(pageBuilder: (c,a,b) => Imagepage(query: "Beautiful",)));

                  }, icon: Image.asset("images/icons8-home-96.png",
                    width: 25,
                    height: 25,
                    color: pageindex == 1  ? colorindex : Colors.white,
                  ),),
                  Container(
                    width: 5,
                    height: 5,
                    decoration:  BoxDecoration(
                        shape: BoxShape.circle,
                        color: pageindex == 1 ? colorindex : Colors.black
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              width: we * 0.07,
            ),
            FadeAnimationY(
              delay: 1.2,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                    onPressed: (){
                      setState(() {
                        Navigator.of(context).pushReplacement(PageRouteBuilder(pageBuilder: (c,a,b) =>  searchview()));

                      });
                    },
                    icon: Icon(
                      Icons.search,
                      color: pageindex == 2 ? colorindex : Colors.white,),
                  ),
                  Container(
                    width: 5,
                    height: 5,
                    decoration:  BoxDecoration(
                      shape: BoxShape.circle,
                      color: pageindex == 2 ? colorindex : Colors.black,
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
                width: we * 0.07
            ),
            FadeAnimationY(
              delay: 1.3,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                      alignment: Alignment.center,
                      padding: const EdgeInsetsDirectional.all(3),
                      margin: const EdgeInsets.only(bottom: 20),
                      decoration:  BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                              color: Colors.yellow.withOpacity(0.2),
                              spreadRadius: 10,
                              blurRadius: 10,
                              offset: const Offset(0.0, 2.0)
                          )
                        ],
                        shape: BoxShape.circle,
                        color: Colors.yellow,
                      ),
                      child: IconButton(
                        onPressed: (){

                        },
                        icon: Image.asset("images/videocall.png",
                          width: 20,
                          height: 20,
                          color: Colors.black,
                        ),
                      )
                  ),
                ],
              ),
            ),
            SizedBox(
              width: we * 0.07,
            ),
            FadeAnimationY(
              delay: 1.4,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                    onPressed: (){
                      setState(() {

                      });
                    },
                    icon:  Icon(Icons.favorite_outline,
                        color: pageindex == 3 ? colorindex : Colors.white )
                    ,),
                  Container(
                    width: 5,
                    height: 5,
                    decoration:  BoxDecoration(
                        shape: BoxShape.circle,
                        color: pageindex == 3 ? colorindex : Colors.black
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              width: we * 0.07,
            ),
            FadeAnimationY(
              delay: 1.5,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                    onPressed: (){
                      setState(() {
                        selected = Gender.person;
                        colorindex = Colors.white;
                        colorbackindx = Colors.black;
                        Navigator.of(context).pushReplacement(PageRouteBuilder(pageBuilder: (c,a,b) =>  const StaggeredGridViewExample()));
                      });
                    },
                    icon:
                    Icon( Icons.person_outline,
                      color: pageindex == 4 ? colorindex : Colors.white,),),
                  Container(
                    width: 5,
                    height: 5,
                    decoration:  BoxDecoration(
                        shape: BoxShape.circle,
                        color: pageindex == 4 ? colorindex : Colors.black
                    ),
                  )
                ],
              ),
            ),
          ]
      ),
    );
  }
}
