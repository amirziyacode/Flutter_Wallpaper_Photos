import 'package:flutter/material.dart';
import 'package:wallpaperr/pages/image_view.dart';

import 'model_wallpaper.dart';


Widget wallpaperlist({required List<WallpaperModel> wallpapers , context}){
  return GridView.count(
    shrinkWrap: true,
    crossAxisCount: 2,
    childAspectRatio: 0.6,
    mainAxisSpacing: 6.0,
    crossAxisSpacing: 6.0,
    children: wallpapers.map((wallpapers) {
      return GridTile(
        child: InkWell(
          onTap: (){
            Navigator.of(context).push(PageRouteBuilder(pageBuilder: (c,a,b,) => viewImages(Imageurl: wallpapers.scr!.portrait!,
            )));
          },
          child: Padding(
            padding: const EdgeInsets.all(5.0),
            child: Hero(
              tag: wallpapers.scr!.portrait!,
              child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Image.network(wallpapers.scr!.portrait!,fit: BoxFit.cover,)),
            ),
          ),
        ),
      );
    }).toList(),
  );
}


