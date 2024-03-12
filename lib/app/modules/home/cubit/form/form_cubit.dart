import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:teste_sciencedex/app/modules/home/cubit/form/form_validator_state.dart';

class FormCubit extends Cubit<FormValidatorState> {
  List<String> listCategory = <String>[
    'Categoria 1',
    'Categoria 2',
    'Categoria 3',
    'Categoria 4',
    'Categoria 5'
  ];

  FormCubit() : super(const FormValidatorUpdate());

  void initForm({
    String? name,
    DateTime? dateInit,
    DateTime? dateEnd,
    String? category,
    String? goal1,
    String? goal2,
  }) {
    emit(state.copyWith(
      name: name,
      dateInit: dateInit,
      dateEnd: dateEnd,
      category: category,
      goal1: goal1,
      goal2: goal2,
    ));
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

  void reset() {
    emit(const FormValidatorUpdate());
  }
}
