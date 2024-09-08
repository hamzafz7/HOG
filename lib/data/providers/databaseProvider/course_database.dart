import 'package:hog/data/models/courses_model.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class CourseDatabase {
  static final CourseDatabase _instance = CourseDatabase._internal();
  factory CourseDatabase() => _instance;
  static Database? _database;

  CourseDatabase._internal();

  static Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  static Future<Database> _initDatabase() async {
    String path = join(await getDatabasesPath(), 'courses.db');
    return await openDatabase(
      path,
      version: 1,
      onCreate: _onCreate,
    );
  }

  static Future<void> _onCreate(Database db, int version) async {
    await db.execute('''
      CREATE TABLE courses (
        id INTEGER PRIMARY KEY,
        name TEXT,
        image TEXT,
        telegram_channel_link TEXT,
        is_open INTEGER,
        is_visible INTEGER,
        is_paid INTEGER
      )
    ''');
  }

  static Future<void> insertCourse(Map<String, dynamic> course) async {
    final db = await database;
    await db.insert('courses', course,
        conflictAlgorithm: ConflictAlgorithm.replace);
  }

  static Future<List<Map<String, dynamic>>> getCourses() async {
    final db = await database;
    return await db.query('courses');
  }

  // Method to save courses fetched from the API to the database
  static Future<void> saveCoursesToDatabase(List<CourseModel> courses) async {
    for (var course in courses) {
      await insertCourse(course.toMap());
    }
  }

  // Method to fetch courses from the database when there's no internet
  static Future<List<CourseModel>> getCoursesFromDatabase() async {
    final List<Map<String, dynamic>> courseMaps = await getCourses();
    return courseMaps
        .map((courseMap) => CourseModel.fromMap(courseMap))
        .toList();
  }
}
