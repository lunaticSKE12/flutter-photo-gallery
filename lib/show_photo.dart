import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import './Photos.dart';

class ShowPhoto extends StatelessWidget {
  final int currentImage;
  ShowPhoto({required this.currentImage});

  @override
  Widget build(BuildContext context) {
    // print(currentImage);
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: Icon(
            Icons.keyboard_arrow_down_rounded,
            color: Colors.white,
            size: 30,
          ),
        ),
        backgroundColor: Colors.black,
        elevation: 0,
        title: Text('Slide'),
      ),
      body: Container(
        margin: EdgeInsets.only(top: 24),
        child: CarouselSlider(
          options: CarouselOptions(
              height: 600,
              initialPage: currentImage - 1,
              autoPlay: true,
              viewportFraction: 1),
          items: Photos.photoLists.map((i) {
            return Builder(
              builder: (ctx) {
                return CachedNetworkImage(
                  imageUrl: i.image,
                  placeholder: (context, url) => CupertinoActivityIndicator(),
                  errorWidget: (context, url, error) => Icon(Icons.error),
                  fit: BoxFit.cover,
                );
              },
            );
          }).toList(),
        ),
      ),
    );
  }
}
