import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mobileapp/colors.dart';
import 'package:mobileapp/const.dart';
import 'package:mobileapp/models/movie.dart';
import 'package:mobileapp/widgets/back.dart';

class Details extends StatelessWidget {
  const Details({super.key, required this.movie});
  final Movie movie;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(slivers: [
        SliverAppBar.large(
          leading: const back(),
          backgroundColor: Colours.scaffoldBgColor, 
          expandedHeight: 500,
          pinned: true,
          floating: true,
          flexibleSpace: FlexibleSpaceBar(
            title: Text(movie.title, style: GoogleFonts.belleza(
              fontSize: 17,
              fontWeight: FontWeight.w600
            ) ,
            
            ),
            background: ClipRRect( 
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(24),
                bottomRight: Radius.circular(24)
              ),
              child:  Image.network('${Const.imagepath}${movie.posterPath}',
              filterQuality: FilterQuality.high,
              fit: BoxFit.fill,
              ),
              ),
          ),
        ),
        SliverToBoxAdapter(
          child: Padding(padding: EdgeInsets.all(12),
          child: Column(
            
            children: [
              Text(movie.title, style: GoogleFonts.belleza(
              fontSize: 30,
              fontWeight: FontWeight.w800
            ) ,
            
            ),
            const SizedBox(height: 20,),
            Text(movie.overview, style: GoogleFonts.roboto(
              fontSize:20,
              fontWeight: FontWeight.w400
            ) ,
            
            
            ),
            SizedBox(height: 20,),
             SizedBox(
              child: Row(
                children: [
                  Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.white
                      ),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Row(children: [
                      Text('Release date : ', style: GoogleFonts.belleza(
              fontSize: 20,
              fontWeight: FontWeight.w800
            ) ,
            
            ),
            Text(movie.releaseDate, style: GoogleFonts.belleza(
              fontSize: 20,
              fontWeight: FontWeight.w800
            ) ,
            
            ),
                    ],
                    ),
                    
                  ),
                  Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.white
                  ),),)
                ],

              ),
            )
            ],
          ),),
        )
      ],) );
  }
}

