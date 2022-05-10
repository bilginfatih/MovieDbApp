import 'dart:convert';

import 'package:movie_db_api/constants/constants.dart';

Moviemodel moviemodelFromJson(String str) =>
    Moviemodel.fromJson(json.decode(str));

String moviemodelToJson(Moviemodel data) => json.encode(data.toJson());

class Moviemodel {
  Moviemodel({
    this.images,
    this.imagesCast,
    this.nameCast,
    this.characterCast,
    this.genres,
    this.genresName,
    this.videos,
    this.adult,
    this.backdropPath,
    this.genreIds,
    this.id,
    this.originalLanguage,
    this.originalTitle,
    this.overview,
    this.popularity,
    this.posterPath,
    this.releaseDate,
    this.title,
    this.video,
    this.voteAverage,
    this.voteCount,
  });

  bool? adult;
  String? backdropPath;
  List<int>? genreIds;
  List? genresName;
  List? nameCast;
  List? characterCast;
  int? id;
  String? originalLanguage;
  String? originalTitle;
  String? overview;
  double? popularity;
  String? posterPath;
  DateTime? releaseDate;
  String? title;
  bool? video;
  double? voteAverage;
  int? voteCount;
  List<String>? images;
  List<String>? imagesCast;
  String? videos;
  List<String>? genres;

  factory Moviemodel.fromDetailsJson(Map<String, dynamic> json) {
    List genresName = json["genres"];
    List<String> paths1 = [];
    List images = json["images"]["backdrops"];
    List<String> paths = [];
    List imagesCast = json["credits"]["cast"];
    List<String> paths2 = [];
    List nameCast = json["credits"]["cast"];
    List<String> paths3 = [];
    List characterCast = json["credits"]["cast"];
    List<String> paths4 = [];
    String video = json["videos"]["results"][0]["key"];
    images = images.take(10).toList();
    imagesCast = imagesCast.take(10).toList();
    nameCast = nameCast.take(10).toList();
    characterCast = characterCast.take(10).toList();

    for (var value in images) {
      String path = Constants.imageBase.toString() + value["file_path"];
      paths.add(path);
    }
    for (var value in genresName) {
      String path1 = value["name"];
      paths1.add(path1);
    }
    for (var value in imagesCast) {
      String path2;
      if (value["profile_path"] != null) {
        path2 =
            Constants.imageBase.toString() + value["profile_path"].toString();
      } else {
        path2 = '';
      }
      paths2.add(path2);
    }
    for (var value in nameCast) {
      String path3 = value["name"];
      paths3.add(path3);
    }
    for (var value in characterCast) {
      String path4 = value["character"];
      paths4.add(path4);
    }
    return Moviemodel(
      images: paths,
      videos: video,
      genresName: paths1,
      imagesCast: paths2,
      nameCast: paths3,
      characterCast: paths4,
    );
  }

  factory Moviemodel.fromJson(Map<String, dynamic> json) => Moviemodel(
        adult: json["adult"],
        backdropPath: json["backdrop_path"],
        genreIds: List<int>.from(json["genre_ids"].map((x) => x)),
        id: json["id"],
        originalLanguage: json["original_language"],
        originalTitle: json["original_title"],
        overview: json["overview"],
        popularity: json["popularity"]?.toDouble() ?? 0.0,
        posterPath: json["poster_path"],
        releaseDate: DateTime.parse(json["release_date"]),
        title: json["title"],
        video: json["video"],
        voteAverage: json["vote_average"]?.toDouble() ?? 0.0,
        voteCount: json["vote_count"],
      );

  Map<String, dynamic> toJson() => {
        "adult": adult,
        "backdrop_path": backdropPath,
        "genre_ids": List<dynamic>.from(genreIds!.map((x) => x)),
        "id": id,
        "original_language": originalLanguage,
        "original_title": originalTitle,
        "overview": overview,
        "popularity": popularity,
        "poster_path": posterPath,
        "release_date":
            "${releaseDate!.year.toString().padLeft(4, '0')}-${releaseDate!.month.toString().padLeft(2, '0')}-${releaseDate!.day.toString().padLeft(2, '0')}",
        "title": title,
        "video": video,
        "videos": videos ?? "gelmedi",
        "vote_average": voteAverage,
        "vote_count": voteCount,
      };
}
