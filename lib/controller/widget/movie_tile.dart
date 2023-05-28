import 'package:flutter/material.dart';
import 'package:nrich/constants.dart';
import 'package:nrich/screen/movie_detail.dart';

class MovieTile extends StatelessWidget {
  final int id;
  final String imageUrl;
  final String title;

  const MovieTile(
      {super.key,
      required this.id,
      required this.imageUrl,
      required this.title});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: GridTile(
        child: Image.network(
          imageUrl,
          fit: BoxFit.cover,
          errorBuilder: (context, error, stacktrace) {
            return Container(
              color: Pallete.whiteColor,
              child: LayoutBuilder(builder: (context, constraint) {
                return Icon(
                  Icons.error_outline_sharp,
                  color: Colors.red,
                  size: constraint.biggest.width,
                );
              }),
            );
          },
        ),
        footer: GridTileBar(
          backgroundColor: Colors.black54,
          title: Text(
            title,
            textAlign: TextAlign.start,
          ),
        ),
      ),
      onTap: () {
        Navigator.of(context).pushNamed(MovieDetialScreen.namedRoute,arguments:id);
      },
    );
  }
}
