import 'dart:convert';

class StoriesModel {
  StoriesModel({
    this.code,
    this.status,
    this.copyright,
    this.attributionText,
    this.attributionHtml,
    this.data,
    this.etag,
  });

  final String? code;
  final String? status;
  final String? copyright;
  final String? attributionText;
  final String? attributionHtml;
  final Data? data;
  final String? etag;

  factory StoriesModel.fromJson(String? str) =>
      StoriesModel.fromMap(json.decode(str!));

  String? toJson() => json.encode(toMap());

  factory StoriesModel.fromMap(Map<String?, dynamic> json) => StoriesModel(
        code: json["code"],
        status: json["status"],
        copyright: json["copyright"],
        attributionText: json["attributionText"],
        attributionHtml: json["attributionHTML"],
        data: Data.fromMap(json["data"]),
        etag: json["etag"],
      );

  Map<String?, dynamic> toMap() => {
        "code": code,
        "status": status,
        "copyright": copyright,
        "attributionText": attributionText,
        "attributionHTML": attributionHtml,
        "data": data!.toMap(),
        "etag": etag,
      };
}

class Data {
  Data({
    this.offset,
    this.limit,
    this.total,
    this.count,
    this.results,
  });

  final String? offset;
  final String? limit;
  final String? total;
  final String? count;
  final List<Result>? results;

  factory Data.fromJson(String? str) => Data.fromMap(json.decode(str!));

  String? toJson() => json.encode(toMap());

  factory Data.fromMap(Map<String?, dynamic> json) => Data(
        offset: json["offset"],
        limit: json["limit"],
        total: json["total"],
        count: json["count"],
        results:
            List<Result>.from(json["results"].map((x) => Result.fromMap(x))),
      );

  Map<String?, dynamic> toMap() => {
        "offset": offset,
        "limit": limit,
        "total": total,
        "count": count,
        "results": List<dynamic>.from(results!.map((x) => x.toMap())),
      };
}

class Result {
  Result({
    this.id,
    this.title,
    this.description,
    this.resourceUri,
    this.type,
    this.modified,
    this.thumbnail,
    this.comics,
    this.series,
    this.events,
    this.characters,
    this.creators,
    this.originalissue,
  });

  final String? id;
  final String? title;
  final String? description;
  final String? resourceUri;
  final String? type;
  final String? modified;
  final Thumbnail? thumbnail;
  final Comics? comics;
  final Comics? series;
  final Comics? events;
  final Characters? characters;
  final Characters? creators;
  final Originalissue? originalissue;

  factory Result.fromJson(String? str) => Result.fromMap(json.decode(str!));

  String? toJson() => json.encode(toMap());

  factory Result.fromMap(Map<String?, dynamic> json) => Result(
        id: json["id"],
        title: json["title"],
        description: json["description"],
        resourceUri: json["resourceURI"],
        type: json["type"],
        modified: json["modified"],
        thumbnail: Thumbnail.fromMap(json["thumbnail"]),
        comics: Comics.fromMap(json["comics"]),
        series: Comics.fromMap(json["series"]),
        events: Comics.fromMap(json["events"]),
        characters: Characters.fromMap(json["characters"]),
        creators: Characters.fromMap(json["creators"]),
        originalissue: Originalissue.fromMap(json["originalissue"]),
      );

  Map<String?, dynamic> toMap() => {
        "id": id,
        "title": title,
        "description": description,
        "resourceURI": resourceUri,
        "type": type,
        "modified": modified,
        "thumbnail": thumbnail!.toMap(),
        "comics": comics!.toMap(),
        "series": series!.toMap(),
        "events": events!.toMap(),
        "characters": characters!.toMap(),
        "creators": creators!.toMap(),
        "originalissue": originalissue!.toMap(),
      };
}

class Characters {
  Characters({
    this.available,
    this.returned,
    this.collectionUri,
    this.items,
  });

  final String? available;
  final String? returned;
  final String? collectionUri;
  final List<Item>? items;

  factory Characters.fromJson(String? str) =>
      Characters.fromMap(json.decode(str!));

  String? toJson() => json.encode(toMap());

  factory Characters.fromMap(Map<String?, dynamic> json) => Characters(
        available: json["available"],
        returned: json["returned"],
        collectionUri: json["collectionURI"],
        items: List<Item>.from(json["items"].map((x) => Item.fromMap(x))),
      );

  Map<String?, dynamic> toMap() => {
        "available": available,
        "returned": returned,
        "collectionURI": collectionUri,
        "items": List<dynamic>.from(items!.map((x) => x.toMap())),
      };
}

class Item {
  Item({
    this.resourceUri,
    this.name,
    this.role,
  });

  final String? resourceUri;
  final String? name;
  final String? role;

  factory Item.fromJson(String? str) => Item.fromMap(json.decode(str!));

  String? toJson() => json.encode(toMap());

  factory Item.fromMap(Map<String?, dynamic> json) => Item(
        resourceUri: json["resourceURI"],
        name: json["name"],
        role: json["role"],
      );

  Map<String?, dynamic> toMap() => {
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

  final String? available;
  final String? returned;
  final String? collectionUri;
  final List<Originalissue>? items;

  factory Comics.fromJson(String? str) => Comics.fromMap(json.decode(str!));

  String? toJson() => json.encode(toMap());

  factory Comics.fromMap(Map<String?, dynamic> json) => Comics(
        available: json["available"],
        returned: json["returned"],
        collectionUri: json["collectionURI"],
        items: List<Originalissue>.from(
            json["items"].map((x) => Originalissue.fromMap(x))),
      );

  Map<String?, dynamic> toMap() => {
        "available": available,
        "returned": returned,
        "collectionURI": collectionUri,
        "items": List<dynamic>.from(items!.map((x) => x.toMap())),
      };
}

class Originalissue {
  Originalissue({
    this.resourceUri,
    this.name,
  });

  final String? resourceUri;
  final String? name;

  factory Originalissue.fromJson(String? str) =>
      Originalissue.fromMap(json.decode(str!));

  String? toJson() => json.encode(toMap());

  factory Originalissue.fromMap(Map<String?, dynamic> json) => Originalissue(
        resourceUri: json["resourceURI"],
        name: json["name"],
      );

  Map<String?, dynamic> toMap() => {
        "resourceURI": resourceUri,
        "name": name,
      };
}

class Thumbnail {
  Thumbnail({
    this.path,
    this.extension,
  });

  final String? path;
  final String? extension;

  factory Thumbnail.fromJson(String? str) =>
      Thumbnail.fromMap(json.decode(str!));

  String? toJson() => json.encode(toMap());

  factory Thumbnail.fromMap(Map<String?, dynamic> json) => Thumbnail(
        path: json["path"],
        extension: json["extension"],
      );

  Map<String?, dynamic> toMap() => {
        "path": path,
        "extension": extension,
      };
}
