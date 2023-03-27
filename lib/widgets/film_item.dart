

import 'package:flutter/material.dart';

class FilmItem extends StatelessWidget {
  final String title;
  final int episode_id;
  final String producer;
  FilmItem(
    this.title,
    this.episode_id,
    this.producer,
  );

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: GridTile(
        child: Image.network(
          producer,
          fit: BoxFit.cover,
          errorBuilder: (context, error, stackTrace) {
            return Container(
              color: Colors.white,
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
     onTap: (){},
    );
  }
}
