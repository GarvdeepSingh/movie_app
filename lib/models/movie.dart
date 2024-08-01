

// import 'dart:convert';
// import 'dart:ffi';

// class movie{
//   String title;
//   String backdroppath;
//   String originaltitle;
//   String overview;
//   String posterpath;
//   String releasedate;
//   double voteaverage;

//   movie({
//     required this.title,
//     required this.backdroppath,
//     required this.originaltitle,
//     required this.overview,
//     required this.posterpath,
//     required this.releasedate,
//     required this.voteaverage,
//   });


//   factory movie.fromJson(Map<String, Dynamic>()){
//     return movie(
//       title: json["title"], 
//       backdroppath: backdroppath, 
//       originaltitle: originaltitle, 
//       overview: overview, 
//       posterpath: posterpath, 
//       releasedate: releasedate, 
//       voteaverage: voteaverage)
//   }
// }
// ignore: unused_import
import 'dart:convert';

class Movie {
  String title;
  String backdropPath;
  String originalTitle;
  String overview;
  String posterPath;
  String releaseDate;
  double voteAverage;

  Movie({
    required this.title,
    required this.backdropPath,
    required this.originalTitle,
    required this.overview,
    required this.posterPath,
    required this.releaseDate,
    required this.voteAverage,
  });

  factory Movie.fromJson(Map<String, dynamic> json) {
    return Movie(
      title: json['title'] ?? '',
      backdropPath: json['backdrop_path'] ?? '',
      originalTitle: json['original_title'] ?? '',
      overview: json['overview'] ?? '',
      posterPath: json['poster_path'] ?? '',
      releaseDate: json['release_date'] ?? '',
      voteAverage: (json['vote_average'] as num?)?.toDouble() ?? 0.0,
    );
  }

  tolist() {}

  


}
