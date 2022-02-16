import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:wallpaperr/Animation/fadeanimation.dart';
import 'package:wallpaperr/Animation/fadeanimationX.dart';
import 'package:wallpaperr/Animation/loading.dart';
import 'package:wallpaperr/data/model_wallpaper.dart';
import 'dart:convert';
import 'package:wallpaperr/data/quarytag.dart';
import 'package:wallpaperr/data/widget.dart';
import 'bottomnavigation.dart';




class Imagepage extends StatefulWidget {
  var query;

  Imagepage({required this.query});

  @override
  _ImagepageState createState() => _ImagepageState(query: query);
}

class _ImagepageState extends State<Imagepage> {

  var  query ;


  _ImagepageState({required this.query});

  List<WallpaperModel> wallpapers  = [];



  Color colorr = Colors.yellow.withOpacity(0.2);
  Color colortext = Colors.white;


  getwallpaper() async{
    var url = Uri.parse("https://api.pexels.com/v1/search?query=$query&per_page=20");
    String apikey = "563492ad6f91700001000001baf818e336f44f279fef0d971a67ef42";
    // how can get api key ? 
    // - go the pexels site 
    // - make a account 

    var respone = await http.get(url,
        headers : {
          "Authorization" : apikey
        }
    );

    Map <String,dynamic> jsondata = jsonDecode(respone.body);
    jsondata["photos"].forEach((element) {
      WallpaperModel wallpaperModel = WallpaperModel();
      wallpaperModel = WallpaperModel.fromMap(element);
      wallpapers.add(wallpaperModel);
    });
    setState(() {});

  }

  @override
  void initState() {
    getwallpaper();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var we = MediaQuery.of(context).size.width;
    var he = MediaQuery.of(context).size.height;
    return Scaffold(
        backgroundColor: Colors.black,
        body: SafeArea(
          bottom: false,
          child: Container(
            width: we,
            height: he,
            color: Colors.black,
            child: Column(
              children: [
                SizedBox(
                  width: we * 0.92,
                  height: he * 0.12,
                  child: Row(
                    children: [
                      FadeAnimation(
                        delay: 0.7,
                        child: const  Text('Wallpaper',style: TextStyle(
                            color: Colors.white,
                            fontSize: 45,
                            fontFamily: "Dongle",
                            letterSpacing: 1
                        ),),
                      ),
                      SizedBox(
                        width: we * 0.44,
                      ),
                      FadeAnimation(delay: 0.5, child:IconButton(
                          onPressed: (){},
                          icon: Image.asset("images/filter_filters_funnel_list_navigation_sort_sorting_icon_123212.png",
                            width: 50,
                            height: 50,
                            color: Colors.white,
                          )))
                    ],
                  ),
                ),
                SizedBox(
                  width: we * 1,
                  height: 43,
                  child: ListView.builder(
                    itemBuilder: (c,i){
                      return InkWell(
                        onTap: (){
                          setState(() {
                            query = QuerytagFilters[i].title.toString();
                            Navigator.of(context).pushReplacement(PageRouteBuilder(pageBuilder: (c,a,b) => Imagepage(query: query,)));
                          });
                        },
                        child: FadeAnimationx(
                          delay: 1,
                          child: Container(
                              width: 120,
                              height: 10,
                              margin: const  EdgeInsets.only(left: 8),
                              decoration: BoxDecoration(
                                  color: query == QuerytagFilters[i].title.toString() ?   Colors.yellow: colorr ,
                                  borderRadius: BorderRadius.circular(20)
                              ),
                              child:  Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children:  [
                                   ClipRRect(
                                     borderRadius : BorderRadius.circular(40),
                                     child: CachedNetworkImage(imageUrl: QuerytagFilters[i].images.toString(),
                                     width: 35,
                                     height: 35
                                    ),
                                   ), 
                                  SizedBox(                              
                                    width: we * 0.03,
                                  ),
                                  FittedBox(
                                    child: Text(QuerytagFilters[i].title.toString(),style:
                                    TextStyle(
                                        color:query  == QuerytagFilters[i].title.toString() ? Colors.black:Colors.white
                                    )
                                      ,),
                                  ),
                                ],
                              )
                          ),
                        ),
                      );
                    },
                    itemCount: QuerytagFilters.length,
                    scrollDirection: Axis.horizontal,
                  ),
                ),
                SizedBox(
                  height: he * 0.02,
                ),
                wallpapers.isNotEmpty ? Expanded(
                  child: wallpaperlist(
                      wallpapers: wallpapers,
                      context: context
                  ),
                ): const loading(),
              ],
            ),
          ),
        ),
        bottomNavigationBar:  custombottomnavigation(pageindex: 1,)
    );

  }
}
