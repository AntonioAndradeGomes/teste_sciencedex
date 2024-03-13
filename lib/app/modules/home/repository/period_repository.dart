import 'package:teste_sciencedex/app/modules/home/models/period_model.dart';

abstract class PeriodRepository {
  Future<PeriodModel?> insertPeriod(PeriodModel periodModel);
  Future<void> removePeriod(PeriodModel periodModel);
  Future<PeriodModel?> updatePeriod(PeriodModel periodModel);
  Future<List<PeriodModel>> getAllPeriods();
}
