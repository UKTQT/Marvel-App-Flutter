import 'dart:convert';

class CharactersModel {
  CharactersModel({
    this.code,
    this.status,
    this.copyright,
    this.attributionText,
    this.attributionHtml,
    this.data,
    this.etag,
  });

  final int? code;
  final String? status;
  final String? copyright;
  final String? attributionText;
  final String? attributionHtml;
  final CharacterData? data;
  final String? etag;

  factory CharactersModel.fromJson(String str) =>
      CharactersModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory CharactersModel.fromMap(Map<String, dynamic> json) => CharactersModel(
        code: json['code'],
        status: json['status'],
        copyright: json['copyright'],
        attributionText: json['attributionText'],
        attributionHtml: json['attributionHTML'],
        data: CharacterData.fromMap(json['data']),
        etag: json['etag'],
      );

  Map<String, dynamic> toMap() => {
        'code': code,
        'status': status,
        'copyright': copyright,
        'attributionText': attributionText,
        'attributionHTML': attributionHtml,
        'data': data!.toMap(),
        'etag': etag,
      };
}

class CharacterData {
  CharacterData({
    this.offset,
    this.limit,
    this.total,
    this.count,
    this.results,
  });

  final int? offset;
  final int? limit;
  final int? total;
  final int? count;
  final List<CharacterResult>? results;

  factory CharacterData.fromJson(String str) =>
      CharacterData.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory CharacterData.fromMap(Map<String, dynamic> json) => CharacterData(
        offset: json['offset'],
        limit: json['limit'],
        total: json['total'],
        count: json['count'],
        results: List<CharacterResult>.from(
            json['results'].map((x) => CharacterResult.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        'offset': offset,
        'limit': limit,
        'total': total,
        'count': count,
        'results': List<dynamic>.from(results!.map((x) => x.toMap())),
      };
}

class CharacterResult {
  CharacterResult({
    this.id,
    this.name,
    this.description,
    this.modified,
    this.resourceUri,
    this.urls,
    this.thumbnail,
    this.comics,
    this.stories,
    this.events,
    this.series,
  });

  final int? id;
  final String? name;
  final String? description;
  final String? modified;
  final String? resourceUri;
  final List<Url>? urls;
  final Thumbnail? thumbnail;
  final Comics? comics;
  final Stories? stories;
  final Comics? events;
  final Comics? series;

  factory CharacterResult.fromJson(String str) =>
      CharacterResult.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory CharacterResult.fromMap(Map<String, dynamic> json) => CharacterResult(
        id: json['id'],
        name: json['name'],
        description: json['description'],
        modified: json['modified'],
        resourceUri: json['resourceURI'],
        urls: List<Url>.from(json['urls'].map((x) => Url.fromMap(x))),
        thumbnail: Thumbnail.fromMap(json['thumbnail']),
        comics: Comics.fromMap(json['comics']),
        stories: Stories.fromMap(json['stories']),
        events: Comics.fromMap(json['events']),
        series: Comics.fromMap(json['series']),
      );

  Map<String, dynamic> toMap() => {
        'id': id,
        'name': name,
        'description': description,
        'modified': modified,
        'resourceURI': resourceUri,
        'urls': List<dynamic>.from(urls!.map((x) => x.toMap())),
        'thumbnail': thumbnail!.toMap(),
        'comics': comics!.toMap(),
        'stories': stories!.toMap(),
        'events': events!.toMap(),
        'series': series!.toMap(),
      };
}

class Comics {
  Comics({
    this.available,
    this.returned,
    this.collectionUri,
    this.items,
  });

  final int? available;
  final int? returned;
  final String? collectionUri;
  final List<ComicsItem>? items;

  factory Comics.fromJson(String str) => Comics.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Comics.fromMap(Map<String, dynamic> json) => Comics(
        available: json['available'],
        returned: json['returned'],
        collectionUri: json['collectionURI'],
        items: List<ComicsItem>.from(
            json['items'].map((x) => ComicsItem.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        'available': available,
        'returned': returned,
        'collectionURI': collectionUri,
        'items': List<dynamic>.from(items!.map((x) => x.toMap())),
      };
}

class ComicsItem {
  ComicsItem({
    this.resourceUri,
    this.name,
  });

  final String? resourceUri;
  final String? name;

  factory ComicsItem.fromJson(String str) =>
      ComicsItem.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory ComicsItem.fromMap(Map<String, dynamic> json) => ComicsItem(
        resourceUri: json['resourceURI'],
        name: json['name'],
      );

  Map<String, dynamic> toMap() => {
        'resourceURI': resourceUri,
        'name': name,
      };
}

class Stories {
  Stories({
    this.available,
    this.returned,
    this.collectionUri,
    this.items,
  });

  final int? available;
  final int? returned;
  final String? collectionUri;
  final List<StoriesItem>? items;

  factory Stories.fromJson(String str) => Stories.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Stories.fromMap(Map<String, dynamic> json) => Stories(
        available: json['available'],
        returned: json['returned'],
        collectionUri: json['collectionURI'],
        items: List<StoriesItem>.from(
            json['items'].map((x) => StoriesItem.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        'available': available,
        'returned': returned,
        'collectionURI': collectionUri,
        'items': List<dynamic>.from(items!.map((x) => x.toMap())),
      };
}

class StoriesItem {
  StoriesItem({
    this.resourceUri,
    this.name,
    this.type,
  });

  final String? resourceUri;
  final String? name;
  final String? type;

  factory StoriesItem.fromJson(String str) =>
      StoriesItem.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory StoriesItem.fromMap(Map<String, dynamic> json) => StoriesItem(
        resourceUri: json['resourceURI'],
        name: json['name'],
        type: json['type'],
      );

  Map<String, dynamic> toMap() => {
        'resourceURI': resourceUri,
        'name': name,
        'type': type,
      };
}

class Thumbnail {
  Thumbnail({
    this.path,
    this.extension,
  });

  final String? path;
  final String? extension;

  factory Thumbnail.fromJson(String str) => Thumbnail.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Thumbnail.fromMap(Map<String, dynamic> json) => Thumbnail(
        path: json['path'],
        extension: json['extension'],
      );

  Map<String, dynamic> toMap() => {
        'path': path,
        'extension': extension,
      };
}

class Url {
  Url({
    this.type,
    this.url,
  });

  final String? type;
  final String? url;

  factory Url.fromJson(String str) => Url.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Url.fromMap(Map<String, dynamic> json) => Url(
        type: json['type'],
        url: json['url'],
      );

  Map<String, dynamic> toMap() => {
        'type': type,
        'url': url,
      };
}
