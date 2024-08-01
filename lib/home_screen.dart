// ignore: unused_import
import 'package:carousel_slider/carousel_slider.dart';
// ignore: unnecessary_import
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
// ignore: unnecessary_import
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mobileapp/api/api.dart';
import 'package:mobileapp/models/movie.dart';
import 'package:mobileapp/widgets/toprated_slider.dart';
import 'package:mobileapp/widgets/trending_slider.dart';
import 'package:mobileapp/widgets/upcoming_slider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}



class _HomeScreenState extends State<HomeScreen> {
late Future<List<Movie>> trendingmovies;
late Future<List<Movie>> topratedmovies;
late Future<List<Movie>> upcomingmovies;

  @override
  void initState(){
    super.initState();
    trendingmovies = api().gettrendingmovie();
    topratedmovies = api().gettopratedmovie();
    upcomingmovies = api().getupcomingmovie();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Movie App'),
        backgroundColor: Colors.transparent,
        centerTitle: true,
      ),
      body:  SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
            Text('Trending Movie' ,style: GoogleFonts.aBeeZee(fontSize: 25),),
            const SizedBox(
              height: 20,
            ),
            SizedBox(
              child: FutureBuilder<List<Movie>>(
              future: trendingmovies, // Future that provides the list of movies
              builder: (context, snapshot) {
              if (snapshot.hasError) {
                return Center(
                    child: Text(snapshot.error.toString()),
                );
                 } else if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                 child: CircularProgressIndicator(),
                 );
               } else if (snapshot.hasData) {
                  return  trendingmovie(snapshot: snapshot,);
                 } else {
                  return const Center(
                    child: Text('No data available'),
              );
      }
    },
  ),
),

            // SizedBox(
            //   child: FutureBuilder(future: trendingmovies, builder: (context, snapshot){
            //     if(snapshot.hasError){
            //       return Center(
            //         child: Text(snapshot.error.toString()),
            //       );
            //     }else if(snapshot.hasData){
            //       const trendingmovie();
            //     }else{
            //       return const Center(child: CircularProgressIndicator(),);
            //     }
            //   },),
            // ),
            const SizedBox(height: 20,),
            Text('Top Rated', style: GoogleFonts.aBeeZee(fontSize: 25),),
            const SizedBox(
              height: 20,
            ),
            SizedBox(
              child: FutureBuilder<List<Movie>>(
              future: topratedmovies, // Future that provides the list of movies
              builder: (context, snapshot) {
              if (snapshot.hasError) {
                return Center(
                    child: Text(snapshot.error.toString()),
                );
                 } else if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                 child: CircularProgressIndicator(),
                 );
               } else if (snapshot.hasData) {
                  return  toprated(snapshot: snapshot,);
                 } else {
                  return const Center(
                    child: Text('No data available'),
              );
      }
    },
  ),
),
            const SizedBox(height: 20,),
            Text('Upcoming Movies', style: GoogleFonts.aBeeZee(fontSize: 25),),
            const SizedBox(height: 20,),
            SizedBox(
              child: FutureBuilder<List<Movie>>(
              future: upcomingmovies, // Future that provides the list of movies
              builder: (context, snapshot) {
              if (snapshot.hasError) {
                return Center(
                    child: Text(snapshot.error.toString()),
                );
                 } else if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                 child: CircularProgressIndicator(),
                 );
               } else if (snapshot.hasData) {
                  return  upcoming(snapshot: snapshot,);
                 } else {
                  return const Center(
                    child: Text('No data available'),
              );
      }
    },
  ),
),
          
          
          ],),
        ),
      )
    );
  }
}






