class VideoLink {
  final String link;
  final String rendition;

  VideoLink({
    required this.link,
    required this.rendition,
  });

  factory VideoLink.fromJson(Map<String, dynamic> json) {
    return VideoLink(
      link: json['link'],
      rendition: json['rendition'],
    );
  }
}

class VideoLinksResponse {
  final List<VideoLink> link;

  VideoLinksResponse({required this.link});

  factory VideoLinksResponse.fromJson(Map<String, dynamic> json) {
    var list = json['link'] as List;
    List<VideoLink> videoLinksList =
        list.map((i) => VideoLink.fromJson(i)).toList();

    return VideoLinksResponse(
      link: videoLinksList,
    );
  }
}
