import 'dart:convert';

class CreatorsModel {
  CreatorsModel({
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
  final CreatorData? data;
  final String? etag;

  factory CreatorsModel.fromJson(String str) =>
      CreatorsModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory CreatorsModel.fromMap(Map<String, dynamic> json) => CreatorsModel(
        code: json['code'],
        status: json['status'],
        copyright: json['copyright'],
        attributionText: json['attributionText'],
        attributionHtml: json['attributionHTML'],
        data: CreatorData.fromMap(json['data']),
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

class CreatorData {
  CreatorData({
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
  final List<CreatorResult>? results;

  factory CreatorData.fromJson(String str) =>
      CreatorData.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory CreatorData.fromMap(Map<String, dynamic> json) => CreatorData(
        offset: json['offset'],
        limit: json['limit'],
        total: json['total'],
        count: json['count'],
        results: List<CreatorResult>.from(
            json['results'].map((x) => CreatorResult.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        'offset': offset,
        'limit': limit,
        'total': total,
        'count': count,
        'results': List<dynamic>.from(results!.map((x) => x.toMap())),
      };
}

class CreatorResult {
  CreatorResult({
    this.id,
    this.firstName,
    this.middleName,
    this.lastName,
    this.suffix,
    this.fullName,
    this.modified,
    this.resourceUri,
    this.urls,
    this.thumbnail,
    this.series,
    this.stories,
    this.comics,
    this.events,
  });

  final int? id;
  final String? firstName;
  final String? middleName;
  final String? lastName;
  final String? suffix;
  final String? fullName;
  final String? modified;
  final String? resourceUri;
  final List<Url>? urls;
  final Thumbnail? thumbnail;
  final Comics? series;
  final Stories? stories;
  final Comics? comics;
  final Comics? events;

  factory CreatorResult.fromJson(String str) =>
      CreatorResult.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory CreatorResult.fromMap(Map<String, dynamic> json) => CreatorResult(
        id: json['id'],
        firstName: json['firstName'],
        middleName: json['middleName'],
        lastName: json['lastName'],
        suffix: json['suffix'],
        fullName: json['fullName'],
        modified: json['modified'],
        resourceUri: json['resourceURI'],
        urls: List<Url>.from(json['urls'].map((x) => Url.fromMap(x))),
        thumbnail: Thumbnail.fromMap(json['thumbnail']),
        series: Comics.fromMap(json['series']),
        stories: Stories.fromMap(json['stories']),
        comics: Comics.fromMap(json['comics']),
        events: Comics.fromMap(json['events']),
      );

  Map<String, dynamic> toMap() => {
        'id': id,
        'firstName': firstName,
        'middleName': middleName,
        'lastName': lastName,
        'suffix': suffix,
        'fullName': fullName,
        'modified': modified,
        'resourceURI': resourceUri,
        'urls': List<dynamic>.from(urls!.map((x) => x.toMap())),
        'thumbnail': thumbnail!.toMap(),
        'series': series!.toMap(),
        'stories': stories!.toMap(),
        'comics': comics!.toMap(),
        'events': events!.toMap(),
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
