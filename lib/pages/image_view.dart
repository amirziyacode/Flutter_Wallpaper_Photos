import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:glass_kit/glass_kit.dart';
import 'package:image_downloader/image_downloader.dart';
import 'package:wallpaperr/Animation/fadeanimation.dart';

class viewImages extends StatefulWidget {
  var Imageurl;

  viewImages({required this.Imageurl});

  @override
  _viewImagesState createState() => _viewImagesState(Imageurl: Imageurl);
}

class _viewImagesState extends State<viewImages> {
  var Imageurl;

  _viewImagesState({required this.Imageurl});

  bool enbleicon = false;

  String Textofbutton = "Download";

  Downloader() async {
    try {
      // Saved with this method.
      var imageId = await ImageDownloader.downloadImage(Imageurl,
          destination: AndroidDestinationType.directoryDownloads
            ..subDirectory("Wallpaper.png"));
      if (imageId == null) {
        return;
      }

      // Below is a method of obtaining saved image information.
      var fileName = await ImageDownloader.findName(imageId);
      var path = await ImageDownloader.findPath(imageId);
      var size = await ImageDownloader.findByteSize(imageId);
      var mimeType = await ImageDownloader.findMimeType(imageId);
    } on PlatformException catch (error) {
      print(error);
    }
  }

  @override
  Widget build(BuildContext context) {
    var we = MediaQuery.of(context).size.width;
    var he = MediaQuery.of(context).size.height;
    return Scaffold(
        backgroundColor: Colors.black,
        body: Stack(
          children: [
            Hero(
              tag: Imageurl,
              child: Container(
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: NetworkImage(Imageurl), fit: BoxFit.cover)),
              ),
            ),
          FadeAnimation(
              delay: 0.9,
              child: GlassContainer.clearGlass(
                  height: 50,
                  width: 50,
                  alignment: Alignment.center,
                  borderRadius: BorderRadius.circular(30),
                  margin: EdgeInsets.only(left: 15, top: he * 0.055),
                  child: IconButton(
                    onPressed: () => Navigator.of(context).pop(),
                    icon: const Icon(
                      Icons.arrow_back_ios_outlined,
                      color: Colors.white,
                    ),
                  )),
            ),
            FadeAnimation(
              delay: 0.7,
              child: GlassContainer.clearGlass(
                  height: 50,
                  width: 290,
                  borderRadius: BorderRadius.circular(18),
                  margin: EdgeInsets.only(left: 14, top: he * 0.92),
                  child: TextButton(
                    onPressed: () {
                      Downloader();
                      var snackBar = SnackBar(
                        backgroundColor: Colors.black,
                        content: const Text('Downloading . . . . .'),
                        action: SnackBarAction(
                          textColor: Colors.yellow,
                          label: 'Undo',
                          onPressed: () {
                            // Some code to undo the change.
                          },
                        ),
                      );
                      ScaffoldMessenger.of(context).showSnackBar(snackBar);
                    },
                    child: const Text(
                      "Download",
                      style: TextStyle(
                          color: Colors.white,
                          fontFamily: "Dongle",
                          letterSpacing: 1,
                          fontSize: 30),
                    ),
                  )),
            ),
            FadeAnimation(
              delay: 0.9,
              child: GlassContainer.clearGlass(
                  height: 50,
                  width: 50,
                  alignment: Alignment.center,
                  borderRadius: BorderRadius.circular(30),
                  margin: EdgeInsets.only(left: 320, top: he * 0.92),
                  child: IconButton(
                    onPressed: () => setState(() => enbleicon = !enbleicon),
                    icon: enbleicon ? const Icon(
                      Icons.favorite_outlined,
                      color: Colors.red,
                    ) : const Icon(
                      Icons.favorite_border_outlined,
                      color: Colors.red,
                    )
                  )),
            )
          ],
        ));
  }
}
