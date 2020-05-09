import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';

class ImageLoader extends StatelessWidget {
  final String img_url;
  final double height;

  ImageLoader(this.img_url, this.height);

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: img_url,
      height: height,
      fit: BoxFit.cover,
    );
  }
}
