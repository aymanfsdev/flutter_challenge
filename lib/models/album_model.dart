import 'package:equatable/equatable.dart';
import 'package:intl/intl.dart';
DateFormat dateFormat = DateFormat('yyyy-MM-ddThh:mm:ssZ');
DateFormat simpleFormat = DateFormat('MMM d, yyyy');

class Album extends Equatable{

  String? wrapperType;
  String? collectionType;
  num? artistId;
  num? collectionId;
  num? amgArtistId;
  String? artistName;
  String? collectionName;
  String? collectionCensoredName;
  String? artistViewUrl;
  String? collectionViewUrl;
  String? artworkUrl60;
  String? artworkUrl100;
  num? collectionPrice;
  String? collectionExplicitness;
  num? trackCount;
  String? copyright;
  String? country;
  String? currency;
  DateTime? releaseDate;
  String? primaryGenreName;
  String? artistType;
  String? artistLinkUrl;
  num? primaryGenreId;

  Album({
    this.wrapperType,
    this.collectionType,
    this.artistId,
    this.collectionId,
    this.amgArtistId,
    this.artistName,
    this.collectionName,
    this.collectionCensoredName,
    this.artistViewUrl,
    this.collectionViewUrl,
    this.artworkUrl60,
    this.artworkUrl100,
    this.collectionPrice,
    this.collectionExplicitness,
    this.trackCount,
    this.copyright,
    this.country,
    this.currency,
    this.releaseDate,
    this.primaryGenreName,
    this.artistType,
    this.artistLinkUrl,
    this.primaryGenreId,
  });

  factory Album.fromJson(Map<String, dynamic> json) {
    return Album(
      wrapperType: json['wrapperType'] as String?,
      collectionType: json['collectionType'] as String?,
      artistId: json['artistId'] as num?,
      collectionId: json['collectionId'] as num?,
      amgArtistId: json['amgArtistId'] as num?,
      artistName: json['artistName'] as String?,
      collectionName: json['collectionName'] as String?,
      collectionCensoredName: json['collectionCensoredName'] as String?,
      artistViewUrl: json['artistViewUrl'] as String?,
      collectionViewUrl: json['collectionViewUrl'] as String?,
      artworkUrl60: json['artworkUrl60'] as String?,
      artworkUrl100: json['artworkUrl100'] as String?,
      collectionPrice: json['collectionPrice'] as num?,
      collectionExplicitness: json['collectionExplicitness'] as String?,
      trackCount: json['trackCount'] as num?,
      copyright: json['copyright'] as String?,
      country: json['country'] as String?,
      currency: json['currency'] as String?,
      primaryGenreName: json['primaryGenreName'] as String?,
      releaseDate: (json['releaseDate'] as String? ?? '') != '' ? dateFormat.parse(json['releaseDate']): null,
      artistType: json['artistType'] as String?,
      artistLinkUrl: json['artistLinkUrl'] as String?,
      primaryGenreId: json['primaryGenreId'] as num?,
    );
  }

  @override
  List<Object?> get props => [
    wrapperType,
    collectionType,
    artistId,
    collectionId,
    amgArtistId,
    artistName,
    collectionName,
    collectionCensoredName,
    artistViewUrl,
    collectionViewUrl,
    artworkUrl60,
    artworkUrl100,
    collectionPrice,
    collectionExplicitness,
    trackCount,
    copyright,
    country,
    currency,
    releaseDate,
    primaryGenreName,
    artistType,
    artistLinkUrl,
    primaryGenreId,
  ];
}