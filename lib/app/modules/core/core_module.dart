import 'package:flutter_modular/flutter_modular.dart';
import 'package:image_picker/image_picker.dart';
import 'package:teste_sciencedex/app/shared/database/app_database.dart';
import 'package:teste_sciencedex/app/shared/localstorage/i_local_storage.dart';
import 'package:teste_sciencedex/app/shared/localstorage/local_storage_shared_preferences.dart';

class CoreModule extends Module {
  @override
  void binds(i) {}

  @override
  void exportedBinds(Injector i) {
    super.exportedBinds(i);
    i.addInstance<AppDatabase>(
      AppDatabase.appDb,
    );
    i.addSingleton<ILocalStorage>(
      LocalStorageSharedPreferences.new,
    );
    i.addSingleton(ImagePicker.new);
  }

  @override
  void routes(r) {}
}
