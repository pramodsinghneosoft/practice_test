import 'package:sqflite/sqflite.dart';
import 'package:sqflite/sqlite_api.dart';
import 'package:sqflite_test/sqflite_files/alarm_model.dart';

final String tableAlarm = "alarm";
final String columnId = "id";
final String columnTitle = "title";
final String columnDateTime = "alarmDateTime";
final String columnPending = "isPending";
final String columnColorIndex = "gradientColorIndex";

class SQFLiteHelper {
  static Database _database;
  static SQFLiteHelper _sqfLiteHelper;
  SQFLiteHelper._createInstance();

  //! singleton instance
  factory SQFLiteHelper() {
    if (_sqfLiteHelper == null) {
      _sqfLiteHelper = SQFLiteHelper._createInstance();
    }
    return _sqfLiteHelper;
  }

  //! singleton instance
  Future<Database> get database async {
    if (_database == null) {
      _database = await initializeDatabase();
    }

    return _database;
  }

  Future<Database> initializeDatabase() async {
    var dir = await getDatabasesPath();
    var path = dir + "alarm.db";

    var database = openDatabase(
      path,
      version: 1,
      onCreate: (db, version) {
        db.execute('''
        create table $tableAlarm(
          $columnId integer primary key autoincrement,
          $columnTitle text not null,
          $columnDateTime text not null,
          $columnPending integer,
          $columnColorIndex integer)
        ''');
      },
    );
    return database;
  }

  void insertAlarm(AlarmModel alarmModel) async {
    var db = await this.database;
    var result = await db.insert(tableAlarm, alarmModel.toMap());
    print("result: $result");
  }

  Future<List<AlarmModel>> getAlarm() async {
    List<AlarmModel> _alarms = [];
    var db = await this.database;
    var result = await db.query(tableAlarm);
    result.forEach((element) {
      var alarmModel = AlarmModel.fromJson(element);
      _alarms.add(alarmModel);
    });
    return _alarms;
  }

  Future<int> delete(int id) async {
    var db = await this.database;
    return await db.delete(tableAlarm, where: "$columnId = ?", whereArgs: [id]);
  }
}
