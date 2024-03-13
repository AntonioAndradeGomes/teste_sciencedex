import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class AppDatabase {
  AppDatabase._();

  static final AppDatabase appDb = AppDatabase._();

  static Database? _database;

  final _databaseName = 'teste_sciencedex.db';

  final tableName = 'periods';

  Future<Database> get database async {
    if (_database != null) {
      return _database!;
    }
    _database = await _initDatabase();
    return _database!;
  }

  _initDatabase() async {
    final documentsDirectory = await getApplicationDocumentsDirectory();
    final path = join(documentsDirectory.path, _databaseName);
    return openDatabase(
      path,
      onCreate: (db, version) async {
        await db.execute(
          '''
            CREATE TABLE $tableName (
              id INTEGER PRIMARY KEY AUTOINCREMENT,
              name TEXT NOT NULL,
              dateInit TEXT NOT NULL,
              dateEnd TEXT NOT NULL,
              category TEXT NOT NULL,
              goal1 TEXT,
              goal2 TEXT
            )
          ''',
        );
      },
      version: 1,
    );
  }
}
