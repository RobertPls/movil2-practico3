import 'dart:convert';

List<Noticia> noticiaFromJson(String str) =>
    List<Noticia>.from(json.decode(str).map((x) => Noticia.fromJson(x)));
Noticia oneNoticiaFromJson(String str) => Noticia.fromJson(json.decode(str));

String noticiaToJson(List<Noticia> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Noticia {
  Noticia({
    required this.source,
    required this.author,
    required this.title,
    required this.description,
    required this.url,
    required this.urlToImage,
    required this.publishedAt,
    required this.content,
  });

  Source source;
  String author;
  String title;
  String description;
  String url;
  String urlToImage;
  DateTime publishedAt;
  String content;

  factory Noticia.fromJson(Map<String, dynamic> json) => Noticia(
        source: Source.fromJson(json["source"] ?? {}),
        author: json["author"] ?? "",
        title: json["title"] ?? "",
        description: json["description"] ?? "",
        url: json["url"] ?? "",
        urlToImage: json["urlToImage"] ?? "",
        publishedAt:
            DateTime.parse(json["publishedAt"] ?? DateTime.now().toString()),
        content: json["content"] ?? "",
      );

  Map<String, dynamic> toJson() => {
        "source": source.toJson(),
        "author": author == null ? null : author,
        "title": title,
        "description": description,
        "url": url,
        "urlToImage": urlToImage,
        "publishedAt": publishedAt.toIso8601String(),
        "content": content,
      };
}

class Source {
  Source({
    required this.id,
    required this.name,
  });

  String id;
  String name;

  factory Source.fromJson(Map<String, dynamic> json) => Source(
        id: json["id"] ?? "",
        name: json["name"] ?? "",
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
      };
}
