import 'package:equatable/equatable.dart';
import 'package:teste_sciencedex/app/modules/home/models/period_model.dart';

abstract class FormValidatorState extends Equatable {
  final String name;
  final DateTime? dateInit;
  final DateTime? dateEnd;
  final String? category;
  final String? goal1;
  final String? goal2;
  final PeriodModel? editPeriod;

  const FormValidatorState({
    this.name = '',
    this.dateInit,
    this.dateEnd,
    this.category,
    this.goal1,
    this.goal2,
    this.editPeriod,
  });

  FormValidatorState copyWith({
    String? name,
    DateTime? dateInit,
    DateTime? dateEnd,
    String? category,
    String? goal1,
    String? goal2,
    PeriodModel? editPeriod,
  });

  @override
  List<Object?> get props => [
        name,
        dateInit,
        dateEnd,
        category,
        goal1,
        goal2,
        editPeriod,
      ];
}

class FormValidatorUpdate extends FormValidatorState {
  const FormValidatorUpdate({
    String? name,
    super.dateInit,
    super.dateEnd,
    super.category,
    super.goal1,
    super.goal2,
    super.editPeriod,
  }) : super(
          name: name ?? "",
        );

  @override
  FormValidatorState copyWith({
    String? name,
    DateTime? dateInit,
    DateTime? dateEnd,
    String? category,
    String? goal1,
    String? goal2,
    PeriodModel? editPeriod,
  }) {
    return FormValidatorUpdate(
      name: name ?? this.name,
      category: category ?? this.category,
      dateInit: dateInit ?? this.dateInit,
      dateEnd: dateEnd ?? this.dateEnd,
      goal1: goal1 ?? this.goal1,
      goal2: goal2 ?? this.goal2,
      editPeriod: editPeriod ?? this.editPeriod,
    );
  }
}
