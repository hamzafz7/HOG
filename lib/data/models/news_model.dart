class NewsResponse {
  String? message;
  List<NewsModel> news = [];

  NewsResponse.fromJson(Map<String, dynamic> json) {
    message = json["message"];
    json["data"].forEach((e) {
      news.add(NewsModel.fromJson(e));
    });
  }
}

class NewsModel {
  int? id;
  String? image;
  String? title;

  NewsModel({this.image, this.title, this.id});

  NewsModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    image = json['image'];
    title = json['title'];
  }
}
