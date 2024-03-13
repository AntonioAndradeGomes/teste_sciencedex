import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:teste_sciencedex/app/modules/home/cubit/user/user_state.dart';
import 'package:teste_sciencedex/app/shared/localstorage/i_local_storage.dart';

class UserCubit extends Cubit<UserState> {
  final ILocalStorage localStorage;
  UserCubit(
    this.localStorage,
  ) : super(
          LoadingUser(),
        ) {
    getUser();
  }

  getUser() async {
    emit(
      LoadingUser(),
    );
    final username = await localStorage.getItem(
      'username',
    );
    emit(
      DoneUser(
        username: username,
      ),
    );
  }
}
