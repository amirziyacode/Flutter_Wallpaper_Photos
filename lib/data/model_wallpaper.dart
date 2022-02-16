class WallpaperModel {
  String? photographer;
  String? photographer_url;
  int? photographer_id;
  ScrModel? scr;
  
  WallpaperModel({ this.photographer, this.photographer_id , this.photographer_url,this.scr});

  factory WallpaperModel.fromMap(Map<String,dynamic> jsonData){
    return WallpaperModel(
      scr: ScrModel.fromMap(jsonData["src"]),
      photographer_url: jsonData['photographer_url'],
      photographer_id: jsonData['photographer_id'],
      photographer: jsonData['photographer'],
    );
  }
}


class ScrModel{
  String? original;
  String? small;
  String? portrait;

  ScrModel({this.original,this.portrait,this.small});

  factory ScrModel.fromMap(Map<String,dynamic> jsonData){
    return ScrModel(
      original: jsonData["original"],
      portrait: jsonData["portrait"],
      small: jsonData["small"],
    );
  }
}