import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import './Photos.dart';
import 'package:cached_network_image/cached_network_image.dart';
import './show_photo.dart';
import 'dart:math';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Home(),
    );
  }
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  bool isReverse = false;

  @override
  Widget build(BuildContext context) {
    final device = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey.shade50,
        elevation: 0,
        title: Text(
          'Photo Gallery',
          style: TextStyle(color: Colors.black),
        ),
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).push(MaterialPageRoute(builder: (context) {
              return ShowPhoto(
                currentImage: Random().nextInt(14),
              );
            }));
          },
          icon: Icon(
            Icons.slideshow_outlined,
            color: Colors.blue,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              setState(() {
                isReverse = !isReverse;
              });
            },
            icon: Icon(
              Icons.sort_by_alpha_rounded,
              color: Colors.blue,
            ),
          ),
        ],
      ),
      body: Container(
        padding: EdgeInsets.only(top: 16, left: 16, right: 16),
        child: GridView.builder(
            reverse: isReverse,
            itemCount: Photos.photoLists.length,
            gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: device.width / 2,
                mainAxisExtent: device.height * 0.265,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10),
            itemBuilder: (BuildContext context, int index) {
              return InkWell(
                key: ValueKey(Photos.photoLists[index].id),
                onTap: () {
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (context) {
                    return ShowPhoto(
                      currentImage: Photos.photoLists[index].id,
                    );
                  }));
                },
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(16),
                  child: CachedNetworkImage(
                    imageUrl: "${Photos.photoLists[index].image}",
                    placeholder: (context, url) => CupertinoActivityIndicator(),
                    errorWidget: (context, url, error) => Icon(Icons.error),
                    fit: BoxFit.cover,
                  ),

                  // Image.network(
                  //   "${Photos.photoLists[index].image}",
                  //   fit: BoxFit.cover,
                  // ),
                ),
              );
            }),
      ),
    );
  }
}
