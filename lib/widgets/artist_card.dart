import 'package:flutter/material.dart';
import '../models/artist_model.dart';

class ArtistCard extends StatelessWidget {
  final Artist artist;

  ArtistCard({required this.artist});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(10),
      child: ListTile(
        leading: Image.asset(
          artist.image,
          width: 50,
          height: 50,
          fit: BoxFit.cover,
        ),
        title: Text(artist.name),
        subtitle: Text(
          artist.description,
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
        ),
      ),
    );
  }
}
