import 'package:equatable/equatable.dart';
import 'package:teste_sciencedex/app/modules/home/models/period_model.dart';

abstract class PeriodsState extends Equatable {
  final List<PeriodModel>? periods;

  const PeriodsState({
    this.periods,
  });

  @override
  List<Object?> get props => [periods];
}

class LoadingPeriodsState extends PeriodsState {}

class DonePeriodsState extends PeriodsState {
  const DonePeriodsState(List<PeriodModel> periods)
      : super(
          periods: periods,
        );
}
