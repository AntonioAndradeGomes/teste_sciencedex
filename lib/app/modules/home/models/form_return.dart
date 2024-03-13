import 'package:equatable/equatable.dart';
import 'package:teste_sciencedex/app/modules/home/models/period_model.dart';

enum TypeReturn { add, del, up }

class FormReturn extends Equatable {
  final PeriodModel periodModel;
  final TypeReturn typeReturn;

  const FormReturn({
    required this.periodModel,
    required this.typeReturn,
  });

  @override
  List<Object?> get props => [
        periodModel,
        typeReturn,
      ];
}
