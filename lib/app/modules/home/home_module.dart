import 'package:flutter_modular/flutter_modular.dart';
import 'package:teste_sciencedex/app/modules/home/counter_cubit.dart';
import 'package:teste_sciencedex/app/modules/home/cubit/form/form_cubit.dart';
import 'home_page.dart';

class HomeModule extends Module {
  @override
  void binds(i) {
    i.addLazySingleton(CounterCubit.new);
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