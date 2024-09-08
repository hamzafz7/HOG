import 'dart:io';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:hog/data/models/video_model.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';

class VideoDatabase {
  static final VideoDatabase instance = VideoDatabase._init();
  static Database? _database;

  VideoDatabase._init();

  static Future<Database> get database async {
    if (_database != null) return _database!;

    _database = await _initDB('videos.db');
    return _database!;
  }

  static Future<Database> _initDB(String filePath) async {
    final documentsDirectory = await getApplicationDocumentsDirectory();
    final path = join(documentsDirectory.path, filePath);

    return await openDatabase(path, version: 1, onCreate: _createDB);
  }

  static Future<void> _createDB(Database db, int version) async {
    await db.execute(
      '''
      CREATE TABLE videos (
        videoId INTEGER  PRIMARY KEY,
        videoName TEXT ,
        description TEXT ,
        courseName TEXT ,
        encryptedKey TEXT
      )
    ''',
    );
  }

  static Future<void> insertVideo({
    required String courseName,
    required String videoName,
    required String key,
    required int videoId,
    required String? description,
  }) async {
    final db = await VideoDatabase.database;

    Map<String, dynamic> row = {
      'videoId': videoId,
      'videoName': videoName,
      'description': description,
      'courseName': courseName,
      'encryptedKey': key,
    };
    await db.insert(
      'videos',
      row,
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  static Future<List<Video>?>? getVideosByCourseName(String courseName) async {
    final db = await VideoDatabase.database;

    final List<Map<String, dynamic>> maps = await db.query(
      'videos',
      where: 'courseName = ?',
      whereArgs: [courseName],
    );

    final List<Video> videos = [];

    for (final map in maps) {
      final video = Video.fromMap(map);
      videos.add(video);
    }

    return videos;
  }

  static final _secureStorage = FlutterSecureStorage();

  static Future<void> deleteVideo(String courseName, String courseVid) async {
    var path = await _secureStorage.read(key: 'video_$courseName-$courseVid');
    final file = File(path!);
    await file.delete();

    final db = await VideoDatabase.database;
    db.delete('videos',
        where: 'courseName = ? AND videoName = ?',
        whereArgs: [courseName, courseVid]);
    await _secureStorage.delete(key: 'video_$courseName-$courseVid');
  }
}
