import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:nrich/models/movie.dart';

class GetMovieApi {
  static GetMovieApi instance = Get.find();

  int page = 1;
  Future<List<TvShow>> fetchMovie(int page) async {
    Uri url =
        Uri.parse('https://www.episodate.com/api/most-popular?page=$page');
    final response = await http.get(url);
    if (response.statusCode == 200) {
      final result = jsonDecode(response.body);
      Iterable list = result['tv_shows'];
      // print(list);
      return list.map((e) => TvShow.fromJson(e)).toList();
    } else {
      Get.snackbar('Error Fethcing Data', 'An Error Occured');
      throw Exception('Failed');
    }
  }

  // Future<List<TvShow>>? get fetchMovie => _fetchMovie(page);
}
