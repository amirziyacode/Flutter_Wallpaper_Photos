import 'package:flutter/material.dart';
import 'package:wallpaperr/pages/search/searchpage.dart';
import '../bottomnavigation.dart';


class searchview extends StatefulWidget {

  @override
  _searchviewState createState() => _searchviewState();
}

class _searchviewState extends State<searchview> {


  TextEditingController nameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var we = MediaQuery.of(context).size.width;
    var he = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                children: [
                  Container(
                    alignment: Alignment.center,
                    width: we * 0.75,
                    height:he * 0.055,
                    margin: const EdgeInsets.only(left: 20,top: 30),
                    padding: const EdgeInsets.only(left: 15),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20.0),
                      color: Colors.white10,
                    ),
                    child:  TextField(
                      controller: nameController,
                      decoration:   InputDecoration(
                        enabledBorder: InputBorder.none,
                        border:InputBorder.none,
                        hintText: "Photos",
                        hintStyle: TextStyle(
                            color:  Colors.white.withOpacity(0.2),
                            letterSpacing: 1,
                            fontSize: 13
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
                height: he * 0.2,
              ),
              Image.asset('images/robot-doing-data-analysis.png',scale: 12,)
            ],
          ),
        ),
      ),
      bottomNavigationBar:custombottomnavigation(pageindex: 2,),
    );
  }
}



