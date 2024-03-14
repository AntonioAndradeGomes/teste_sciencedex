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
    final filePath = await localStorage.getImagePath(
      'image',
    );
    emit(
      DoneUser(
        username: username,
        pathImage: filePath,
      ),
    );
  }

  setNameUser(String name) async {
    emit(
      DoneUser(
        username: name,
        pathImage: state.pathImage,
      ),
    );
    await localStorage.putItem('username', name);
  }

  setFilePath(String path) async {
    emit(
      DoneUser(
        username: state.username,
        pathImage: path,
      ),
    );
    await localStorage.saveImagePath(
      path,
      'image',
    );
  }
}
