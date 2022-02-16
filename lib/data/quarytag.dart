class QuerytagFilter {
  String? title;
  String? images;

  QuerytagFilter({required this.title, required this.images});
}

List<QuerytagFilter> QuerytagFilters = [
  QuerytagFilter(
      title: "Nature",
      images:
          'https://th-thumbnailer.cdn-si-edu.com/vSnitgUqCQCRSx7mkHZtHZHry4U=/1072x720/filters:no_upscale()/https://tf-cmsv2-smithsonianmag-media.s3.amazonaws.com/filer/04/8e/048ed839-a581-48af-a0ae-fac6fec00948/gettyimages-168346757_web.jpg'),
  QuerytagFilter(
      title: "Car",
      images: 'https://www.nawpic.com/media/2020/car-nawpic-7.jpg'),
  QuerytagFilter(
      title: "People",
      images: 'https://www.namechef.co/files/ck/images/friends-sitcom.jpeg'),
  QuerytagFilter(
      title: "City",
      images:
          'https://www.pixel4k.com/wp-content/uploads/2019/06/shanghai-china-city-4k_1560535779.jpg'),
  QuerytagFilter(
      title: "Sport", images: 'https://wallpaperaccess.com/full/191736.jpg'),
];
