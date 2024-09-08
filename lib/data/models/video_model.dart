class Video {
  final String courseName;
  final String videoName;
  final String key;
  final String? description;
  final int videoId;

  Video(
      {required this.courseName,
      required this.videoName,
      required this.key,
      required this.description,
      required this.videoId});

  factory Video.fromMap(Map<String, dynamic> map) {
    return Video(
        courseName: map['courseName'],
        videoName: map['videoName'],
        key: map['encryptedKey'],
        description: map['description'],
        videoId: map['videoId']);
  }
}
