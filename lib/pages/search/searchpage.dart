import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:wallpaperr/Animation/loading.dart';
import 'package:wallpaperr/data/model_wallpaper.dart';
import 'package:wallpaperr/data/widget.dart';
import '../bottomnavigation.dart';


class Searcherpage extends StatefulWidget {
  var  query ;

  Searcherpage(this.query);


  @override
  _SearcherpageState createState() => _SearcherpageState(query);
}

class _SearcherpageState extends State<Searcherpage> {
  List<WallpaperModel> wallpapers  = [];
  var  query;

  _SearcherpageState(this.query);


  getwallpaper() async{
    var url = Uri.parse("https://api.pexels.com/v1/search?query=$query&per_page=16");
    String apikey = "563492ad6f91700001000001baf818e336f44f279fef0d971a67ef42";
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


    setState(() {

    });
  }

  @override
  void initState() {
    getwallpaper();
    super.initState();
  }

  TextEditingController nameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var we = MediaQuery.of(context).size.width;
    var he = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Column(
          children: [
            Row(
              children: [
                Container(
                  alignment: Alignment.center,
                  width: we * 0.75,
                  height:he * 0.055,
                  margin: const EdgeInsets.only(left: 20,top: 30),
                  padding: const EdgeInsets.all(10.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20.0),
                    color: Colors.white10,
                  ),
                  child:  TextField(
                    controller: nameController,
                    decoration: const InputDecoration(
                      enabledBorder: InputBorder.none,
                      border:InputBorder.none,
                      hintStyle: TextStyle(
                        color:  Colors.white,
                      ),
                    ),
                    style:  const TextStyle(color: Colors.white,fontWeight:FontWeight.bold),),
                ),
                Container(
                  width: 45,
                  height: 45,
                  margin: const EdgeInsets.only(left: 15,top: 25),
                  decoration: const BoxDecoration(
                      color: Colors.yellow,
                      shape: BoxShape.circle
                  ),
                  child: IconButton(
                    onPressed: (){
                      Navigator.of(context).pushReplacement(PageRouteBuilder(pageBuilder: (c,a,b)=> Searcherpage(nameController.text)));
                    },
                    icon: const Icon(Icons.search),
                  ),
                )
              ],
            ),
            SizedBox(
              height: he * 0.02,
            ),
            wallpapers.isNotEmpty ?  Expanded(
                child: wallpaperlist(
                    wallpapers: wallpapers,
                    context: context
                )
            ) : const loading()
          ],
        ),
      ),
      bottomNavigationBar: custombottomnavigation(pageindex: 2,),
    );
  }
}