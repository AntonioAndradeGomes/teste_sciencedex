import 'dart:developer';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:teste_sciencedex/app/modules/home/cubit/periods/periods_state.dart';
import 'package:teste_sciencedex/app/modules/home/models/period_model.dart';
import 'package:teste_sciencedex/app/modules/home/repository/period_repository.dart';

class PeriodsCubit extends Cubit<PeriodsState> {
  final PeriodRepository repository;

  PeriodsCubit(
    this.repository,
  ) : super(
          LoadingPeriodsState(),
        ) {
    onGetPeriods();
  }

  void onGetPeriods() async {
    emit(LoadingPeriodsState());
    final periods = await repository.getAllPeriods();
    emit(DonePeriodsState(periods));
  }

  void addPeriod(PeriodModel periodModel) async {
    final period = await repository.insertPeriod(periodModel);
    if (period != null) {
      final updatedPeriods = List<PeriodModel>.from(
        state.periods ?? [],
      );
      updatedPeriods.add(period);
      emit(DonePeriodsState(updatedPeriods));
    } else {
      log('Periodo não adicionado');
      emit(DonePeriodsState(state.periods!));
    }
  }

  void removePeriod(PeriodModel periodModel) async {
    try {
      emit(LoadingPeriodsState());
      await repository.removePeriod(periodModel);
      final periods = await repository.getAllPeriods();
      emit(DonePeriodsState(periods));
    } catch (e) {
      log(e.toString());
      emit(DonePeriodsState(state.periods!));
    }
  }

  void updatePeriod(PeriodModel periodModel) async {
    try {
      emit(LoadingPeriodsState());
      await repository.updatePeriod(periodModel);
      final periods = await repository.getAllPeriods();
      emit(DonePeriodsState(periods));
    } catch (e) {
      log(e.toString());
      emit(DonePeriodsState(state.periods!));
    }
  }
}
