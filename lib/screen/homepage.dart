import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nrich/constants.dart';
import 'package:nrich/controller/get_movie.dart';
import 'package:nrich/controller/widget/movie_tile.dart';
import 'package:nrich/models/movie.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<TvShow> shows = [];
  int page = 1;
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    loadMovie(page);
    _scrollController.addListener(_scrollListener);
  }

  void loadMovie(page) async {
    final tvshow = await tvShows.fetchMovie(page);
    setState(() {
      shows.addAll(tvshow);
    });
    print(shows);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          // toolbarHeight: 100,
          backgroundColor: Pallete.backgroundColor,
          elevation: 0,
          title: Text('EXPLORE'),
          centerTitle: true,
          actions: [
            IconButton(
              icon: Icon(Icons.exit_to_app),
              onPressed: () {
                firebaseAuth.signOut();
              },
            )
          ],
        ),
        backgroundColor: Pallete.backgroundColor,
        body: FutureBuilder(
          future: tvShows.fetchMovie(page),
          builder: ((context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(
                child: CircularProgressIndicator(
                  color: Pallete.whiteColor,
                ),
              );
            } else {
              return SingleChildScrollView(
                  controller: _scrollController,
                  child: Column(
                    children: [
                      shows.isEmpty
                          ? Center(
                              child: CircularProgressIndicator(),
                            )
                          : GridView.builder(
                              scrollDirection: Axis.vertical,
                              gridDelegate:
                                  const SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: 2,
                                      childAspectRatio: 3 / 4,
                                      crossAxisSpacing: 10,
                                      mainAxisSpacing: 30),
                              itemBuilder: (ctx, index) {
                                final tvshow = shows[index];
                                return MovieTile(
                                    id: tvshow.id,
                                    imageUrl: tvshow.imageThumbnailPath,
                                    title: tvshow.name);
                              },
                              itemCount: shows.length,
                              shrinkWrap: true,
                              physics: ScrollPhysics()),
                      // shrinkWrap: true,
                    ],
                  ));
            }
          }),
        ));
  }

  void _scrollListener() {
    if (_scrollController.offset >=
            _scrollController.position.maxScrollExtent &&
        !_scrollController.position.outOfRange) {
      setState(() {
        page = page + 1;
        loadMovie(page);
        print("Things are working");
      });
    }
  }
}


