// To parse this JSON data, do
//
//     final eventModel = eventModelFromMap(jsonString);

import 'dart:convert';

class EventModel {
  EventModel({
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
  final EventData? data;
  final String? etag;

  factory EventModel.fromJson(String str) =>
      EventModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory EventModel.fromMap(Map<String, dynamic> json) => EventModel(
        code: json['code'],
        status: json['status'],
        copyright: json['copyright'],
        attributionText: json['attributionText'],
        attributionHtml: json['attributionHTML'],
        data: EventData.fromMap(json['data']),
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

class EventData {
  EventData({
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
  final List<EventResult>? results;

  factory EventData.fromJson(String str) => EventData.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory EventData.fromMap(Map<String, dynamic> json) => EventData(
        offset: json['offset'],
        limit: json['limit'],
        total: json['total'],
        count: json['count'],
        results: List<EventResult>.from(
            json['results'].map((x) => EventResult.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        'offset': offset,
        'limit': limit,
        'total': total,
        'count': count,
        'results': List<dynamic>.from(results!.map((x) => x.toMap())),
      };
}

class EventResult {
  EventResult({
    this.id,
    this.title,
    this.description,
    this.resourceUri,
    this.urls,
    this.modified,
    this.start,
    this.end,
    this.thumbnail,
    this.comics,
    this.stories,
    this.series,
    this.characters,
    this.creators,
    this.next,
    this.previous,
  });

  final int? id;
  final String? title;
  final String? description;
  final String? resourceUri;
  final List<Url>? urls;
  final String? modified;
  final String? start;
  final String? end;
  final Thumbnail? thumbnail;
  final Comics? comics;
  final Stories? stories;
  final Comics? series;
  final Characters? characters;
  final Characters? creators;
  final Next? next;
  final Next? previous;

  factory EventResult.fromJson(String str) =>
      EventResult.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory EventResult.fromMap(Map<String, dynamic> json) => EventResult(
        id: json['id'],
        title: json['title'],
        description: json['description'],
        resourceUri: json['resourceURI'],
        urls: List<Url>.from(json['urls'].map((x) => Url.fromMap(x))),
        modified: json['modified'],
        start: json['start'],
        end: json['end'],
        thumbnail: Thumbnail.fromMap(json['thumbnail']),
        comics: Comics.fromMap(json['comics']),
        stories: Stories.fromMap(json['stories']),
        series: Comics.fromMap(json['series']),
        characters: Characters.fromMap(json['characters']),
        creators: Characters.fromMap(json['creators']),
        next: Next.fromMap(json['next']),
        previous: Next.fromMap(json['previous']),
      );

  Map<String, dynamic> toMap() => {
        'id': id,
        'title': title,
        'description': description,
        'resourceURI': resourceUri,
        'urls': List<dynamic>.from(urls!.map((x) => x.toMap())),
        'modified': modified,
        'start': start,
        'end': end,
        'thumbnail': thumbnail!.toMap(),
        'comics': comics!.toMap(),
        'stories': stories!.toMap(),
        'series': series!.toMap(),
        'characters': characters!.toMap(),
        'creators': creators!.toMap(),
        'next': next!.toMap(),
        'previous': previous!.toMap(),
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
        available: json['available'],
        returned: json['returned'],
        collectionUri: json['collectionURI'],
        items: List<CharactersItem>.from(
            json['items'].map((x) => CharactersItem.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        'available': available,
        'returned': returned,
        'collectionURI': collectionUri,
        'items': List<dynamic>.from(items!.map((x) => x.toMap())),
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
        resourceUri: json['resourceURI'],
        name: json['name'],
        role: json['role'],
      );

  Map<String, dynamic> toMap() => {
        'resourceURI': resourceUri,
        'name': name,
        'role': role,
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
        available: json['available'],
        returned: json['returned'],
        collectionUri: json['collectionURI'],
        items: List<Next>.from(json['items'].map((x) => Next.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        'available': available,
        'returned': returned,
        'collectionURI': collectionUri,
        'items': List<dynamic>.from(items!.map((x) => x.toMap())),
      };
}

class Next {
  Next({
    this.resourceUri,
    this.name,
  });

  final String? resourceUri;
  final String? name;

  factory Next.fromJson(String str) => Next.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Next.fromMap(Map<String, dynamic> json) => Next(
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
