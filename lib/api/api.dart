import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:mobileapp/const.dart';
import 'package:mobileapp/models/movie.dart';

class api{
  static const _trendingurl = 'https://api.themoviedb.org/3/trending/movie/day?api_key=${Const.apikey}';
  static const _toprated = 'https://api.themoviedb.org/3/movie/top_rated?api_key=${Const.apikey}';
  static const _upcoming = 'https://api.themoviedb.org/3/movie/upcoming?api_key=${Const.apikey}';


  Future<List<Movie>> gettrendingmovie() async{
    final response = await http.get(Uri.parse(_trendingurl));
    if(response.statusCode == 200){
      final decodeddata = json.decode(response.body)['results'] as List;
      print(decodeddata);
      return decodeddata.map((movie) => Movie.fromJson(movie)).toList();
    }
    else{
      throw Exception('something happened');
    }
  }

    Future<List<Movie>> gettopratedmovie() async{
    final response = await http.get(Uri.parse(_toprated));
    if(response.statusCode == 200){
      final decodeddata = json.decode(response.body)['results'] as List;
      print(decodeddata);
      return decodeddata.map((movie) => Movie.fromJson(movie)).toList();
    }
    else{
      throw Exception('something happened');
    }
  }


      Future<List<Movie>> getupcomingmovie() async{
    final response = await http.get(Uri.parse(_upcoming));
    if(response.statusCode == 200){
      final decodeddata = json.decode(response.body)['results'] as List;
      print(decodeddata);
      return decodeddata.map((movie) => Movie.fromJson(movie)).toList();
    }
    else{
      throw Exception('something happened');
    }
  }
}