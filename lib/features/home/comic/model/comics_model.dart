import 'dart:convert';

class ComicsModel {
  ComicsModel({
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
  final ComicData? data;
  final String? etag;

  factory ComicsModel.fromJson(String str) =>
      ComicsModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory ComicsModel.fromMap(Map<String, dynamic> json) => ComicsModel(
        code: json["code"],
        status: json["status"],
        copyright: json["copyright"],
        attributionText: json["attributionText"],
        attributionHtml: json["attributionHTML"],
        data: ComicData.fromMap(json["data"]),
        etag: json["etag"],
      );

  Map<String, dynamic> toMap() => {
        "code": code,
        "status": status,
        "copyright": copyright,
        "attributionText": attributionText,
        "attributionHTML": attributionHtml,
        "data": data?.toMap(),
        "etag": etag,
      };
}

class ComicData {
  ComicData({
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
  final List<ComicResult>? results;

  factory ComicData.fromJson(String str) => ComicData.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory ComicData.fromMap(Map<String, dynamic> json) => ComicData(
        offset: json["offset"],
        limit: json["limit"],
        total: json["total"],
        count: json["count"],
        results: List<ComicResult>.from(
            json["results"].map((x) => ComicResult.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "offset": offset,
        "limit": limit,
        "total": total,
        "count": count,
        "results": List<dynamic>.from(results!.map((x) => x.toMap())),
      };
}

class ComicResult {
  ComicResult({
    this.id,
    this.digitalId,
    this.title,
    //this.issueNumber,
    this.variantDescription,
    this.description,
    this.modified,
    this.isbn,
    this.upc,
    this.diamondCode,
    this.ean,
    this.issn,
    this.format,
    this.pageCount,
    this.textObjects,
    this.resourceUri,
    this.urls,
    this.series,
    this.variants,
    this.collections,
    this.collectedIssues,
    this.dates,
    this.prices,
    this.thumbnail,
    this.images,
    this.creators,
    this.characters,
    this.stories,
    this.events,
  });

  final int? id;
  final int? digitalId;
  final String? title;
  // final double? issueNumber;
  final String? variantDescription;
  final String? description;
  final String? modified;
  final String? isbn;
  final String? upc;
  final dynamic diamondCode;
  final String? ean;
  final String? issn;
  final String? format;
  final int? pageCount;
  final List<TextObject>? textObjects;
  final String? resourceUri;
  final List<Url>? urls;
  final Series? series;
  final List<Series>? variants;
  final List<Series>? collections;
  final List<Series>? collectedIssues;
  final List<Date>? dates;
  final List<Price>? prices;
  final Thumbnail? thumbnail;
  final List<Thumbnail>? images;
  final Characters? creators;
  final Characters? characters;
  final Stories? stories;
  final Events? events;

  factory ComicResult.fromJson(String str) =>
      ComicResult.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory ComicResult.fromMap(Map<String, dynamic> json) => ComicResult(
        id: json["id"],
        digitalId: json["digitalId"],
        title: json["title"],
        //  issueNumber: json["issueNumber"],
        variantDescription: json["variantDescription"],
        description: json["description"],
        modified: json["modified"],
        isbn: json["isbn"],
        upc: json["upc"],
        diamondCode: json["diamondCode"],
        ean: json["ean"],
        issn: json["issn"],
        format: json["format"],
        pageCount: json["pageCount"],
        textObjects: List<TextObject>.from(
            json["textObjects"].map((x) => TextObject.fromMap(x))),
        resourceUri: json["resourceURI"],
        urls: List<Url>.from(json["urls"].map((x) => Url.fromMap(x))),
        series: Series.fromMap(json["series"]),
        variants:
            List<Series>.from(json["variants"].map((x) => Series.fromMap(x))),
        collections: List<Series>.from(
            json["collections"].map((x) => Series.fromMap(x))),
        collectedIssues: List<Series>.from(
            json["collectedIssues"].map((x) => Series.fromMap(x))),
        dates: List<Date>.from(json["dates"].map((x) => Date.fromMap(x))),
        prices: List<Price>.from(json["prices"].map((x) => Price.fromMap(x))),
        thumbnail: Thumbnail.fromMap(json["thumbnail"]),
        images: List<Thumbnail>.from(
            json["images"].map((x) => Thumbnail.fromMap(x))),
        creators: Characters.fromMap(json["creators"]),
        characters: Characters.fromMap(json["characters"]),
        stories: Stories.fromMap(json["stories"]),
        events: Events.fromMap(json["events"]),
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "digitalId": digitalId,
        "title": title,
        //"issueNumber": issueNumber,
        "variantDescription": variantDescription,
        "description": description,
        "modified": modified,
        "isbn": isbn,
        "upc": upc,
        "diamondCode": diamondCode,
        "ean": ean,
        "issn": issn,
        "format": format,
        "pageCount": pageCount,
        "textObjects": List<dynamic>.from(textObjects!.map((x) => x.toMap())),
        "resourceURI": resourceUri,
        "urls": List<dynamic>.from(urls!.map((x) => x.toMap())),
        "series": series!.toMap(),
        "variants": List<dynamic>.from(variants!.map((x) => x.toMap())),
        "collections": List<dynamic>.from(collections!.map((x) => x.toMap())),
        "collectedIssues":
            List<dynamic>.from(collectedIssues!.map((x) => x.toMap())),
        "dates": List<dynamic>.from(dates!.map((x) => x.toMap())),
        "prices": List<dynamic>.from(prices!.map((x) => x.toMap())),
        "thumbnail": thumbnail!.toMap(),
        "images": List<dynamic>.from(images!.map((x) => x.toMap())),
        "creators": creators!.toMap(),
        "characters": characters!.toMap(),
        "stories": stories!.toMap(),
        "events": events!.toMap(),
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

class Series {
  Series({
    this.resourceUri,
    this.name,
  });

  final String? resourceUri;
  final String? name;

  factory Series.fromJson(String str) => Series.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Series.fromMap(Map<String, dynamic> json) => Series(
        resourceUri: json["resourceURI"],
        name: json["name"],
      );

  Map<String, dynamic> toMap() => {
        "resourceURI": resourceUri,
        "name": name,
      };
}

class Date {
  Date({
    this.type,
    this.date,
  });

  final String? type;
  final String? date;

  factory Date.fromJson(String str) => Date.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Date.fromMap(Map<String, dynamic> json) => Date(
        type: json["type"],
        date: json["date"],
      );

  Map<String, dynamic> toMap() => {
        "type": type,
        "date": date,
      };
}

class Events {
  Events({
    this.available,
    this.returned,
    this.collectionUri,
    this.items,
  });

  final int? available;
  final int? returned;
  final String? collectionUri;
  final List<Series>? items;

  factory Events.fromJson(String str) => Events.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Events.fromMap(Map<String, dynamic> json) => Events(
        available: json["available"],
        returned: json["returned"],
        collectionUri: json["collectionURI"],
        items: List<Series>.from(json["items"].map((x) => Series.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "available": available,
        "returned": returned,
        "collectionURI": collectionUri,
        "items": List<dynamic>.from(items!.map((x) => x.toMap())),
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

class Price {
  Price({
    this.type,
    this.price,
  });

  final String? type;
  final dynamic price;

  factory Price.fromJson(String str) => Price.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Price.fromMap(Map<String, dynamic> json) => Price(
        type: json["type"],
        price: json["price"],
      );

  Map<String, dynamic> toMap() => {
        "type": type,
        "price": price,
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

class TextObject {
  TextObject({
    this.type,
    this.language,
    this.text,
  });

  final String? type;
  final String? language;
  final String? text;

  factory TextObject.fromJson(String str) =>
      TextObject.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory TextObject.fromMap(Map<String, dynamic> json) => TextObject(
        type: json["type"],
        language: json["language"],
        text: json["text"],
      );

  Map<String, dynamic> toMap() => {
        "type": type,
        "language": language,
        "text": text,
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
