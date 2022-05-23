// To parse this JSON data, do
//
//     final seriesModel = seriesModelFromMap(jsonString);

import 'dart:convert';

class SeriesModel {
  SeriesModel({
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
  final SeriesData? data;
  final String? etag;

  factory SeriesModel.fromJson(String str) =>
      SeriesModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory SeriesModel.fromMap(Map<String, dynamic> json) => SeriesModel(
        code: json["code"],
        status: json["status"],
        copyright: json["copyright"],
        attributionText: json["attributionText"],
        attributionHtml: json["attributionHTML"],
        data: SeriesData.fromMap(json["data"]),
        etag: json["etag"],
      );

  Map<String, dynamic> toMap() => {
        "code": code,
        "status": status,
        "copyright": copyright,
        "attributionText": attributionText,
        "attributionHTML": attributionHtml,
        "data": data!.toMap(),
        "etag": etag,
      };
}

class SeriesData {
  SeriesData({
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
  final List<SeriesResult>? results;

  factory SeriesData.fromJson(String str) =>
      SeriesData.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory SeriesData.fromMap(Map<String, dynamic> json) => SeriesData(
        offset: json["offset"],
        limit: json["limit"],
        total: json["total"],
        count: json["count"],
        results: List<SeriesResult>.from(
            json["results"].map((x) => SeriesResult.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "offset": offset,
        "limit": limit,
        "total": total,
        "count": count,
        "results": List<dynamic>.from(results!.map((x) => x.toMap())),
      };
}

class SeriesResult {
  SeriesResult({
    this.id,
    this.title,
    this.description,
    this.resourceUri,
    this.urls,
    this.startYear,
    this.endYear,
    this.rating,
    this.modified,
    this.thumbnail,
    this.comics,
    this.stories,
    this.events,
    this.characters,
    this.creators,
    //this.next,
    //this.previous,
  });

  final int? id;
  final String? title;
  final String? description;
  final String? resourceUri;
  final List<Url>? urls;
  final int? startYear;
  final int? endYear;
  final String? rating;
  final String? modified;
  final Thumbnail? thumbnail;
  final Comics? comics;
  final Stories? stories;
  final Comics? events;
  final Characters? characters;
  final Characters? creators;
  /*  final dynamic next;
  final dynamic previous; */

  factory SeriesResult.fromJson(String str) =>
      SeriesResult.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory SeriesResult.fromMap(Map<String, dynamic> json) => SeriesResult(
        id: json["id"],
        title: json["title"],
        description: json["description"],
        resourceUri: json["resourceURI"],
        urls: List<Url>.from(json["urls"].map((x) => Url.fromMap(x))),
        startYear: json["startYear"],
        endYear: json["endYear"],
        rating: json["rating"],
        modified: json["modified"],
        thumbnail: Thumbnail.fromMap(json["thumbnail"]),
        comics: Comics.fromMap(json["comics"]),
        stories: Stories.fromMap(json["stories"]),
        events: Comics.fromMap(json["events"]),
        characters: Characters.fromMap(json["characters"]),
        creators: Characters.fromMap(json["creators"]),
        //next: Next.fromMap(json["next"]),
        //previous: Next.fromMap(json["previous"]),
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "title": title,
        "description": description,
        "resourceURI": resourceUri,
        "urls": List<dynamic>.from(urls!.map((x) => x.toMap())),
        "startYear": startYear,
        "endYear": endYear,
        "rating": rating,
        "modified": modified,
        "thumbnail": thumbnail!.toMap(),
        "comics": comics!.toMap(),
        "stories": stories!.toMap(),
        "events": events!.toMap(),
        "characters": characters!.toMap(),
        "creators": creators!.toMap(),
        //"next": next?.toMap(),
        //"previous": previous?.toMap(),
      };
}

class Characters {
  Characters({
    this.available,
    this.returned,
    this.collectionUri,
    this.items,
  });

  final int? available;
  final int? returned;
  final String? collectionUri;
  final List<CharactersItem>? items;

  factory Characters.fromJson(String str) =>
      Characters.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Characters.fromMap(Map<String, dynamic> json) => Characters(
        available: json["available"],
        returned: json["returned"],
        collectionUri: json["collectionURI"],
        items: List<CharactersItem>.from(
            json["items"].map((x) => CharactersItem.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "available": available,
        "returned": returned,
        "collectionURI": collectionUri,
        "items": List<dynamic>.from(items!.map((x) => x.toMap())),
      };
}

class CharactersItem {
  CharactersItem({
    this.resourceUri,
    this.name,
    this.role,
  });

  final String? resourceUri;
  final String? name;
  final String? role;

  factory CharactersItem.fromJson(String str) =>
      CharactersItem.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory CharactersItem.fromMap(Map<String, dynamic> json) => CharactersItem(
        resourceUri: json["resourceURI"],
        name: json["name"],
        role: json["role"],
      );

  Map<String, dynamic> toMap() => {
        "resourceURI": resourceUri,
        "name": name,
        "role": role,
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
  final List<Next>? items;

  factory Comics.fromJson(String str) => Comics.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Comics.fromMap(Map<String, dynamic> json) => Comics(
        available: json["available"],
        returned: json["returned"],
        collectionUri: json["collectionURI"],
        items: List<Next>.from(json["items"].map((x) => Next.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "available": available,
        "returned": returned,
        "collectionURI": collectionUri,
        "items": List<dynamic>.from(items!.map((x) => x.toMap())),
      };
}

class Next {
  Next({
    this.resourceUri,
    this.name,
  });

  final dynamic resourceUri;
  final dynamic name;

  factory Next.fromJson(String str) => Next.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Next.fromMap(Map<String, dynamic> json) => Next(
        resourceUri: json["resourceURI"],
        name: json["name"],
      );

  Map<String, dynamic> toMap() => {
        "resourceURI": resourceUri,
        "name": name,
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
        available: json["available"],
        returned: json["returned"],
        collectionUri: json["collectionURI"],
        items: List<StoriesItem>.from(
            json["items"].map((x) => StoriesItem.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "available": available,
        "returned": returned,
        "collectionURI": collectionUri,
        "items": List<dynamic>.from(items!.map((x) => x.toMap())),
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
        resourceUri: json["resourceURI"],
        name: json["name"],
        type: json["type"],
      );

  Map<String, dynamic> toMap() => {
        "resourceURI": resourceUri,
        "name": name,
        "type": type,
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
        path: json["path"],
        extension: json["extension"],
      );

  Map<String, dynamic> toMap() => {
        "path": path,
        "extension": extension,
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
        type: json["type"],
        url: json["url"],
      );

  Map<String, dynamic> toMap() => {
        "type": type,
        "url": url,
      };
}
