import 'package:flutter/material.dart';
import 'package:flutter_challenge/models/album_model.dart';

class AlbumCardView extends StatelessWidget {
  const AlbumCardView({
    Key? key,
    required this.album,
    this.favorite = false,
    required this.onFavorite,
  }): super(key: key);

  final Album album;
  final bool favorite;
  final Function(num?) onFavorite;

  @override
  Widget build(BuildContext context) {
    /// View for artist
    return album.wrapperType == 'artist' ? Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 8,
      ),
      child: Column(
        children: [
          Text(
            'Artist Name: ${album.artistName}',
            style: const TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            'Genre: ${album.primaryGenreName}',
          ),
        ],
      ),
    )
    /// View for collection
        : Card(
      clipBehavior: Clip.antiAlias,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        children: [
          Container(
            width: 100,
            height: 100,
            decoration: album.artworkUrl100 != null ? BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(album.artworkUrl100 ?? ''),
                fit: BoxFit.cover,
              ),
            ): null,
          ),
          const SizedBox(width: 8,),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  album.collectionName ?? '',
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Text(
                            'Price: ${album.currency}${album.collectionPrice}',
                          ),
                          Text(
                            'Release Date: ${album.releaseDate != null ? simpleFormat.format(album.releaseDate!): '-'}',
                          ),
                        ],
                      ),
                    ),
                    IconButton(
                      onPressed: () {
                        /// Favorite Button Action
                        onFavorite(album.artistId);
                      },
                      icon: Icon(
                        favorite ? Icons.star
                            : Icons.star_border,
                        color: Colors.blue,
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}