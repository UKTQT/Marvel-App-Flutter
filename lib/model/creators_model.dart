// To parse required this JSON data, do
//
//     final creatorsModals = creatorsModalsFromMap(jsonString);

import 'dart:convert';

class CreatorsModals {
  CreatorsModals({
    required this.code,
    required this.status,
    required this.copyright,
    required this.attributionText,
    required this.attributionHtml,
    required this.data,
    required this.etag,
  });

  final String code;
  final String status;
  final String copyright;
  final String attributionText;
  final String attributionHtml;
  final Data data;
  final String etag;

  factory CreatorsModals.fromJson(String str) =>
      CreatorsModals.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory CreatorsModals.fromMap(Map<String, dynamic> json) => CreatorsModals(
        code: json["code"],
        status: json["status"],
        copyright: json["copyright"],
        attributionText: json["attributionText"],
        attributionHtml: json["attributionHTML"],
        data: Data.fromMap(json["data"]),
        etag: json["etag"],
      );

  Map<String, dynamic> toMap() => {
        "code": code,
        "status": status,
        "copyright": copyright,
        "attributionText": attributionText,
        "attributionHTML": attributionHtml,
        "data": data.toMap(),
        "etag": etag,
      };
}

class Data {
  Data({
    required this.offset,
    required this.limit,
    required this.total,
    required this.count,
    required this.results,
  });

  final String offset;
  final String limit;
  final String total;
  final String count;
  final List<Result> results;

  factory Data.fromJson(String str) => Data.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Data.fromMap(Map<String, dynamic> json) => Data(
        offset: json["offset"],
        limit: json["limit"],
        total: json["total"],
        count: json["count"],
        results:
            List<Result>.from(json["results"].map((x) => Result.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "offset": offset,
        "limit": limit,
        "total": total,
        "count": count,
        "results": List<dynamic>.from(results.map((x) => x.toMap())),
      };
}

class Result {
  Result({
    required this.id,
    required this.firstName,
    required this.middleName,
    required this.lastName,
    required this.suffix,
    required this.fullName,
    required this.modified,
    required this.resourceUri,
    required this.urls,
    required this.thumbnail,
    required this.series,
    required this.stories,
    required this.comics,
    required this.events,
  });

  final String id;
  final String firstName;
  final String middleName;
  final String lastName;
  final String suffix;
  final String fullName;
  final String modified;
  final String resourceUri;
  final List<Url> urls;
  final Thumbnail thumbnail;
  final Comics series;
  final Stories stories;
  final Comics comics;
  final Comics events;

  factory Result.fromJson(String str) => Result.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Result.fromMap(Map<String, dynamic> json) => Result(
        id: json["id"],
        firstName: json["firstName"],
        middleName: json["middleName"],
        lastName: json["lastName"],
        suffix: json["suffix"],
        fullName: json["fullName"],
        modified: json["modified"],
        resourceUri: json["resourceURI"],
        urls: List<Url>.from(json["urls"].map((x) => Url.fromMap(x))),
        thumbnail: Thumbnail.fromMap(json["thumbnail"]),
        series: Comics.fromMap(json["series"]),
        stories: Stories.fromMap(json["stories"]),
        comics: Comics.fromMap(json["comics"]),
        events: Comics.fromMap(json["events"]),
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "firstName": firstName,
        "middleName": middleName,
        "lastName": lastName,
        "suffix": suffix,
        "fullName": fullName,
        "modified": modified,
        "resourceURI": resourceUri,
        "urls": List<dynamic>.from(urls.map((x) => x.toMap())),
        "thumbnail": thumbnail.toMap(),
        "series": series.toMap(),
        "stories": stories.toMap(),
        "comics": comics.toMap(),
        "events": events.toMap(),
      };
}

class Comics {
  Comics({
    required this.available,
    required this.returned,
    required this.collectionUri,
    required this.items,
  });

  final String available;
  final String returned;
  final String collectionUri;
  final List<ComicsItem> items;

  factory Comics.fromJson(String str) => Comics.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Comics.fromMap(Map<String, dynamic> json) => Comics(
        available: json["available"],
        returned: json["returned"],
        collectionUri: json["collectionURI"],
        items: List<ComicsItem>.from(
            json["items"].map((x) => ComicsItem.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "available": available,
        "returned": returned,
        "collectionURI": collectionUri,
        "items": List<dynamic>.from(items.map((x) => x.toMap())),
      };
}

class ComicsItem {
  ComicsItem({
    required this.resourceUri,
    required this.name,
  });

  final String resourceUri;
  final String name;

  factory ComicsItem.fromJson(String str) =>
      ComicsItem.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory ComicsItem.fromMap(Map<String, dynamic> json) => ComicsItem(
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
    required this.available,
    required this.returned,
    required this.collectionUri,
    required this.items,
  });

  final String available;
  final String returned;
  final String collectionUri;
  final List<StoriesItem> items;

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
        "items": List<dynamic>.from(items.map((x) => x.toMap())),
      };
}

class StoriesItem {
  StoriesItem({
    required this.resourceUri,
    required this.name,
    required this.type,
  });

  final String resourceUri;
  final String name;
  final String type;

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
    required this.path,
    required this.extension,
  });

  final String path;
  final String extension;

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
    required this.type,
    required this.url,
  });

  final String type;
  final String url;

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
