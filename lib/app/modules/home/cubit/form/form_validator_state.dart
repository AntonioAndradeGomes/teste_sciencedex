import 'package:equatable/equatable.dart';

abstract class FormValidatorState extends Equatable {
  final String name;
  final DateTime? dateInit;
  final DateTime? dateEnd;
  final String? category;
  final String? goal1;
  final String? goal2;

  const FormValidatorState({
    this.name = '',
    this.dateInit,
    this.dateEnd,
    this.category,
    this.goal1,
    this.goal2,
  });

  FormValidatorState copyWith({
    String? name,
    DateTime? dateInit,
    DateTime? dateEnd,
    String? category,
    String? goal1,
    String? goal2,
  });

  @override
  List<Object?> get props => [
        name,
        dateInit,
        dateEnd,
        category,
        goal1,
        goal2,
      ];
}

class FormValidatorUpdate extends FormValidatorState {
  const FormValidatorUpdate({
    String? name,
    DateTime? dateInit,
    DateTime? dateEnd,
    String? category,
    String? goal1,
    String? goal2,
  }) : super(
          name: name ?? "",
          dateInit: dateInit,
          dateEnd: dateEnd,
          category: category,
          goal1: goal1,
          goal2: goal2,
        );

  @override
  FormValidatorState copyWith({
    String? name,
    DateTime? dateInit,
    DateTime? dateEnd,
    String? category,
    String? goal1,
    String? goal2,
  }) {
    return FormValidatorUpdate(
      name: name ?? this.name,
      category: category ?? this.category,
      dateInit: dateInit ?? this.dateInit,
      dateEnd: dateEnd ?? this.dateEnd,
      goal1: goal1 ?? this.goal1,
      goal2: goal2 ?? this.goal2,
    );
  }
}
