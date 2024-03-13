import 'dart:developer';
import 'package:sqflite/sqflite.dart';
import 'package:teste_sciencedex/app/modules/home/models/period_model.dart';
import 'package:teste_sciencedex/app/modules/home/repository/period_repository.dart';
import 'package:teste_sciencedex/app/shared/database/app_database.dart';

class PeriodRepositoryImpl extends PeriodRepository {
  final AppDatabase appDatabase;

  PeriodRepositoryImpl(
    this.appDatabase,
  );

  @override
  Future<PeriodModel?> insertPeriod(PeriodModel periodModel) async {
    try {
      final db = await appDatabase.database;
      final id = await db.insert(
        appDatabase.tableName,
        periodModel.toMap(),
        conflictAlgorithm: ConflictAlgorithm.replace,
      );
      return periodModel..id = id;
    } catch (e, s) {
      log(
        e.toString(),
        error: e,
        stackTrace: s,
        time: DateTime.now(),
      );
      return null;
    }
  }

  @override
  Future<List<PeriodModel>> getAllPeriods() async {
    final db = await appDatabase.database;
    final res = await db.query(appDatabase.tableName);
    return res.isNotEmpty
        ? res.map((e) => PeriodModel.fromJson(e)).toList()
        : [];
  }

  @override
  Future<void> removePeriod(PeriodModel periodModel) async {
    try {
      final db = await appDatabase.database;
      await db.delete(
        appDatabase.tableName,
        where: "id = ?",
        whereArgs: [
          periodModel.id!,
        ],
      );
    } catch (e, s) {
      log(
        'Não foi possivel deletar o periodo: ${e.toString()}',
        error: e,
        stackTrace: s,
        time: DateTime.now(),
      );
      rethrow;
    }
  }

  @override
  Future<PeriodModel> updatePeriod(PeriodModel periodModel) async {
    try {
      final db = await appDatabase.database;
      await db.update(
        appDatabase.tableName,
        periodModel.toMap(),
        where: "id = ?",
        whereArgs: [periodModel.id!],
        conflictAlgorithm: ConflictAlgorithm.replace,
      );
      return periodModel;
    } catch (e, s) {
      log(
        e.toString(),
        error: e,
        stackTrace: s,
        time: DateTime.now(),
      );
      rethrow;
    }
  }
}
