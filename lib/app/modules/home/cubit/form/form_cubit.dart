import 'dart:math';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:teste_sciencedex/app/modules/home/cubit/form/form_validator_state.dart';
import 'package:teste_sciencedex/app/modules/home/models/form_return.dart';
import 'package:teste_sciencedex/app/modules/home/models/period_model.dart';

class FormCubit extends Cubit<FormValidatorState> {
  List<String> listCategory = <String>[
    'Categoria 1',
    'Categoria 2',
    'Categoria 3',
    'Categoria 4',
    'Categoria 5'
  ];

  FormCubit() : super(const FormValidatorUpdate());

  void _initForm({
    String? name,
    DateTime? dateInit,
    DateTime? dateEnd,
    String? category,
    String? goal1,
    String? goal2,
    PeriodModel? entity,
  }) {
    emit(state.copyWith(
      name: name,
      dateInit: dateInit,
      dateEnd: dateEnd,
      category: category,
      goal1: goal1,
      goal2: goal2,
      editPeriod: entity,
    ));
  }

  void initFormByEntity({
    required PeriodModel periodEntity,
  }) {
    _initForm(
      name: periodEntity.name,
      category: periodEntity.category,
      dateEnd: periodEntity.dateEnd,
      dateInit: periodEntity.dateInit,
      goal1: periodEntity.goal1,
      goal2: periodEntity.goal2,
      entity: periodEntity,
    );
  }

  void updateName(String? name) {
    emit(state.copyWith(name: name));
  }

  void updateDateInit(DateTime? date) {
    emit(state.copyWith(dateInit: date));
  }

  void updateDateEnd(DateTime? date) {
    emit(state.copyWith(dateEnd: date));
  }

  void updayteCategory(String? category) {
    emit(state.copyWith(category: category));
  }

  void updateGoal1(String? value) {
    emit(state.copyWith(goal1: value));
  }

  void updateGoal2(String? value) {
    emit(state.copyWith(goal2: value));
  }

  bool isValid() {
    return state.name.isNotEmpty &&
        state.dateInit != null &&
        state.dateEnd != null &&
        state.category != null;
  }

  FormReturn returnPeriod(TypeReturn type) {
    switch (type) {
      case TypeReturn.add:
        return FormReturn(
          periodModel: PeriodModel(
            name: state.name,
            dateInit: state.dateInit!,
            dateEnd: state.dateEnd!,
            category: state.category!,
            goal1: state.goal1,
            goal2: state.goal2,
          ),
          typeReturn: TypeReturn.add,
        );
      case TypeReturn.del:
        return FormReturn(
          periodModel: state.editPeriod!,
          typeReturn: TypeReturn.del,
        );
      case TypeReturn.up:
        return FormReturn(
          periodModel: PeriodModel(
            id: state.editPeriod!.id,
            name: state.name,
            dateInit: state.dateInit!,
            dateEnd: state.dateEnd!,
            category: state.category!,
            goal1: state.goal1,
            goal2: state.goal2,
          ),
          typeReturn: TypeReturn.up,
        );
    }
  }

  void reset() {
    emit(const FormValidatorUpdate());
  }
}
