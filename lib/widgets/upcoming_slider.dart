


import 'package:flutter/material.dart';
import 'package:mobileapp/const.dart';
import 'package:mobileapp/details.dart';

class upcoming extends StatelessWidget {
  const upcoming({
    super.key, required this.snapshot,
  });

  final AsyncSnapshot snapshot ; 

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      width: double.infinity,
      child: 
      ListView.builder(
        itemBuilder: (context, index){
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: GestureDetector(
              onTap: () {
                 Navigator.push(
              context, 
              MaterialPageRoute(builder: (context) =>  Details(movie: snapshot.data[index],)));
              },
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: 
                SizedBox(
                height: 300,
                width: 200,
                child: Image.network(
                  filterQuality: FilterQuality.high,
                  fit: BoxFit.cover,
                  '${Const.imagepath}${snapshot.data[index].posterPath
                  }'
                ),
                
                        ),),
            )
                    );
        },

        scrollDirection: Axis.horizontal,
        physics: const BouncingScrollPhysics(),
        itemCount: snapshot.data!.length,
        ),
    );
  }
}
