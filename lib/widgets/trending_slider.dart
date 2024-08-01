



import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:mobileapp/const.dart';
import 'package:mobileapp/details.dart';

class trendingmovie extends StatelessWidget {
   trendingmovie({
    super.key, required this.snapshot,
  });

final AsyncSnapshot snapshot ;  

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: CarouselSlider.builder(
        itemCount: snapshot.data!.length, 
        itemBuilder: (context,itemIndex,pageViewIndex){
          return GestureDetector(
            onTap: () {
              Navigator.push(
              context, 
              MaterialPageRoute(builder: (context) =>  Details(movie: snapshot.data[itemIndex],)));
            },
            child: ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: 
              SizedBox(
                height: 300,
                width: 200,
                child: Image.network(
                  filterQuality: FilterQuality.high,
                  fit: BoxFit.cover,
                  '${Const.imagepath}${snapshot.data[itemIndex].posterPath
                  }'
                ),
                
            )),
          );
        }, 
        options: CarouselOptions(
          height: 300,
          autoPlay: true,
          viewportFraction: 0.55,
          autoPlayCurve: Curves.fastOutSlowIn,
          enlargeCenterPage: true,
          pageSnapping: true,
          autoPlayAnimationDuration: Duration(seconds: 1),
        )),
    );
  }
}