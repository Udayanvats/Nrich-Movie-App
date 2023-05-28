import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:html/parser.dart';
import 'package:http/http.dart' as http;
import 'package:nrich/constants.dart';

class MovieDetialScreen extends StatelessWidget {
  static const namedRoute = 'movie_detail';
  var _id;
  var _title;
  var _description;
  var _start;
  var _status;
  var _imageUrl;
  var _rating;
  var _genres;
  var _description1;
  var _runtime;

  Future _fetchDetails(String id) async {
    Uri url = Uri.parse("https://www.episodate.com/api/show-details?q=$id");
    final response = await http.get(url);
    print("I am here");
    if (response.statusCode == 200) {
      print(response.statusCode);
      print("I am there");
      final result = jsonDecode(response.body);
      final list = result['tvShow'];
      print(list);

      _id = list['id'];
      print(_id);
      _title = list['name'];
      _description1 = list['description'];
      _start = list['start_date'];
      _status = list['status'];
      _imageUrl = list['image_thumbnail_path'];
      _rating = list['rating'];
      _genres = list['genres'];
      _runtime = list['runtime'];

      final document = parse(_description1);
      _description = parse(document.body!.text).documentElement!.text;

      print(_id);
    } else {
      Get.snackbar('Error', 'Something Went Wrong');
    }
  }

  @override
  Widget build(BuildContext context) {
    final _movieId = ModalRoute.of(context)!.settings.arguments.toString();
    return FutureBuilder(
        future: _fetchDetails(_movieId),
        builder: (context, data) {
          while (_id == null) {
            return const Center(
              child: CircularProgressIndicator(color: Pallete.whiteColor),
            );
          }
          return Scaffold(
              appBar: AppBar(
                backgroundColor: Colors.transparent,
                title: Text(_title),
              ),
              body: Stack(
                children: [
                  ..._buildBackground(context),
                  Positioned(
                    bottom: 50,
                    width: MediaQuery.of(context).size.width,
                    child: Padding(
                      padding: EdgeInsets.all(20),
                      child: Column(
                        children: [
                          Text(
                            _title,
                            style: TextStyle(
                                color: Pallete.whiteColor,
                                fontSize: 20,
                                fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(
                            height: 12,
                          ),
                          Text(
                            '${_start}|${_runtime}m|${_status}',
                            style: TextStyle(
                                color: Pallete.whiteColor, fontSize: 14),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          RatingBar.builder(
                            itemSize: 30,
                            initialRating: 3.5,
                            minRating: 1,
                            direction: Axis.horizontal,
                            allowHalfRating: true,
                            ignoreGestures: true,
                            itemCount: 5,
                            unratedColor: Pallete.whiteColor,
                            itemPadding: EdgeInsets.symmetric(horizontal: 4),
                            itemBuilder: ((context, index) {
                              return const Icon(
                                Icons.star,
                                color: Colors.amber,
                              );
                            }),
                            onRatingUpdate: (value) => {},
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Text(
                            _description,
                            maxLines: 6,
                            style: TextStyle(
                                height: 1.75, color: Pallete.whiteColor),
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ));
        });
  }

  List<Widget> _buildBackground(context) => [
        Container(
          height: double.infinity,
          color: const Color(0xFF00B49),
        ),
        Image.network(
          _imageUrl,
          width: double.infinity,
          height: MediaQuery.of(context).size.height * 0.5,
          fit: BoxFit.cover,
        ),
        const Positioned.fill(
            child: DecoratedBox(
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                        colors: [
                          Colors.transparent,
                          Color(0xFF000B49),
                        ],
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        stops: [0.3, 0.5]))))
      ];
}
