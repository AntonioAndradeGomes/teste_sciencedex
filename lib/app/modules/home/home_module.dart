import 'package:flutter_modular/flutter_modular.dart';
import 'package:teste_sciencedex/app/modules/core/core_module.dart';
import 'package:teste_sciencedex/app/modules/home/cubit/form/form_cubit.dart';
import 'package:teste_sciencedex/app/modules/home/cubit/periods/periods_cubit.dart';
import 'package:teste_sciencedex/app/modules/home/cubit/user/user_cubit.dart';
import 'package:teste_sciencedex/app/modules/home/repository/impl/period_repository_impl.dart';
import 'package:teste_sciencedex/app/modules/home/repository/period_repository.dart';
import 'home_page.dart';

class HomeModule extends Module {
  @override
  List<Module> get imports => [
        CoreModule(),
      ];

  @override
  void binds(i) {
    i.addLazySingleton<PeriodRepository>(PeriodRepositoryImpl.new);
    i.addLazySingleton(PeriodsCubit.new);
    i.addLazySingleton(UserCubit.new);
    //a cada vez que abrir o modal cria um novo
    i.add(FormCubit.new);
  }

  @override
  void routes(r) {
    r.child(
      '/',
      child: (context) => const HomePage(),
    );
  }
}
