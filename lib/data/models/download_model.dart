class DownloadResponse {
  List<DownloadModel> downloadOptions = [];
  DownloadResponse.fromJson(Map<String, dynamic> json) {
    downloadOptions = json['download'] != null
        ? List<DownloadModel>.from(
            json['download'].map((e) => DownloadModel.fromJson(e)))
        : [];
  }
}

class DownloadModel {
  String? quality;
  String? link;
  DownloadModel.fromJson(Map<String, dynamic> json) {
    quality = json['rendition'];
    link = json['link'];
  }
}
