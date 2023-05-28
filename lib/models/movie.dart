// To parse this JSON data, do
//
//     final movies = moviesFromJson(jsonString);

import 'dart:convert';

Movies moviesFromJson(String str) => Movies.fromJson(json.decode(str));

String moviesToJson(Movies data) => json.encode(data.toJson());

class Movies {
    final String total;
    final int page;
    final int pages;
    final List<TvShow> tvShows;

    Movies({
        required this.total,
        required this.page,
        required this.pages,
        required this.tvShows,
    });

    factory Movies.fromJson(Map<String, dynamic> json) => Movies(
        total: json["total"],
        page: json["page"],
        pages: json["pages"],
        tvShows: List<TvShow>.from(json["tv_shows"].map((x) => TvShow.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "total": total,
        "page": page,
        "pages": pages,
        "tv_shows": List<dynamic>.from(tvShows.map((x) => x.toJson())),
    };
}

class TvShow {
    final int id;
    final String name;
    final String permalink;
    final DateTime startDate;
    final dynamic endDate;
    // final Country country;
    final String network;
    final Status status;
    final String imageThumbnailPath;

    TvShow({
        required this.id,
        required this.name,
        required this.permalink,
        required this.startDate,
        this.endDate,
        // required this.country,
        required this.network,
        required this.status,
        required this.imageThumbnailPath,
    });

    factory TvShow.fromJson(Map<String, dynamic> json) => TvShow(
        id: json["id"],
        name: json["name"],
        permalink: json["permalink"],
        startDate: DateTime.parse(json["start_date"]),
        endDate: json["end_date"],
        // country: countryValues.map[json["country"]]?? ,
        network: json["network"],
        status: statusValues.map[json["status"]]!,
        imageThumbnailPath: json["image_thumbnail_path"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "permalink": permalink,
        "start_date": "${startDate.year.toString().padLeft(4, '0')}-${startDate.month.toString().padLeft(2, '0')}-${startDate.day.toString().padLeft(2, '0')}",
        "end_date": endDate,
        // "country": countryValues.reverse[country],
        "network": network,
        "status": statusValues.reverse[status],
        "image_thumbnail_path": imageThumbnailPath,
    };
}

enum Country { US, JP, UK, CA }

final countryValues = EnumValues({
    "CA": Country.CA,
    "JP": Country.JP,
    "UK": Country.UK,
    "US": Country.US
});

enum Status { ENDED, RUNNING }

final statusValues = EnumValues({
    "Ended": Status.ENDED,
    "Running": Status.RUNNING
});

class EnumValues<T> {
    Map<String, T> map;
    late Map<T, String> reverseMap;

    EnumValues(this.map);

    Map<T, String> get reverse {
        reverseMap = map.map((k, v) => MapEntry(v, k));
        return reverseMap;
    }
}
