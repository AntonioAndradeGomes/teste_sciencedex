import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:teste_sciencedex/app/modules/home/entities/period_entity.dart';
import 'package:teste_sciencedex/app/modules/home/widgets/add_period_dialog.dart';
import 'package:teste_sciencedex/app/modules/home/widgets/image_button.dart';
import 'package:teste_sciencedex/app/modules/home/widgets/period_item.dart';
import 'package:teste_sciencedex/app/shared/theme/app_colors.dart';

import 'counter_cubit.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final CounterCubit _counterCubit = Modular.get();
  List<PeriodEntity> periods = [
    PeriodEntity(
      name: 'Super Feirão',
      dateInit: DateTime(24, DateTime.january, 1),
      dateEnd: DateTime(24, DateTime.january, 20),
      category: 'Categoria 5',
      goal1: 300,
      goal2: 500,
    ),
    PeriodEntity(
      name: 'Super Feirão',
      dateInit: DateTime(24, DateTime.january, 1),
      dateEnd: DateTime(24, DateTime.january, 20),
      category: 'Categoria 5',
      goal1: 300,
      goal2: 500,
    ),
    PeriodEntity(
      name: 'Super Feirão',
      dateInit: DateTime(24, DateTime.january, 1),
      dateEnd: DateTime(24, DateTime.january, 20),
      category: 'Categoria 5',
      goal1: 300,
      goal2: 500,
    ),
    PeriodEntity(
      name: 'Super Feirão',
      dateInit: DateTime(24, DateTime.january, 1),
      dateEnd: DateTime(24, DateTime.january, 20),
      category: 'Categoria 5',
      goal1: 300,
      goal2: 500,
    ),
    PeriodEntity(
      name: 'Super Feirão',
      dateInit: DateTime(24, DateTime.january, 1),
      dateEnd: DateTime(24, DateTime.january, 20),
      category: 'Categoria 5',
      goal1: 300,
      goal2: 500,
    ),
    PeriodEntity(
      name: 'Super Feirão',
      dateInit: DateTime(24, DateTime.january, 1),
      dateEnd: DateTime(24, DateTime.january, 20),
      category: 'Categoria 5',
      goal1: 300,
      goal2: 500,
    ),
    PeriodEntity(
      name: 'Super Feirão',
      dateInit: DateTime(24, DateTime.january, 1),
      dateEnd: DateTime(24, DateTime.january, 20),
      category: 'Categoria 5',
      goal1: 300,
      goal2: 500,
    ),
    PeriodEntity(
      name: 'Super Feirão',
      dateInit: DateTime(24, DateTime.january, 1),
      dateEnd: DateTime(24, DateTime.january, 20),
      category: 'Categoria 5',
      goal1: 300,
      goal2: 500,
    ),
    PeriodEntity(
      name: 'Super Feirão',
      dateInit: DateTime(24, DateTime.january, 1),
      dateEnd: DateTime(24, DateTime.january, 20),
      category: 'Categoria 5',
      goal1: 300,
      goal2: 500,
    ),
  ];

  @override
  void dispose() {
    _counterCubit.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Configurações'),
        elevation: 0,
        backgroundColor: Colors.white,
        centerTitle: false,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Row(
              children: [
                Expanded(
                  child: TextField(),
                ),
                SizedBox(
                  width: 10,
                ),
                ImageButton(),
              ],
            ),
            const Padding(
              padding: EdgeInsets.only(
                top: 20,
                bottom: 16,
              ),
              child: Divider(
                color: AppColors.grey3,
                height: 1.9,
              ),
            ),
            const Text(
              'Períodos',
              style: TextStyle(
                color: Colors.black,
                fontSize: 14,
                fontWeight: FontWeight.w600,
              ),
            ),
            Container(
              height: 345,
              decoration: BoxDecoration(
                color: AppColors.grey2,
                borderRadius: BorderRadius.circular(15),
              ),
              child: ListView.separated(
                padding: const EdgeInsets.symmetric(
                  horizontal: 7,
                  vertical: 20,
                ),
                itemCount: periods.length,
                itemBuilder: (context, index) {
                  final entity = periods[index];
                  return PeriodItem(
                    entity: entity,
                  );
                },
                separatorBuilder: (context, index) => const SizedBox(
                  height: 10,
                ),
              ),
            ),
            Align(
              alignment: Alignment.topRight,
              child: FilledButton(
                onPressed: () {
                  showDialog(
                    barrierColor: Colors.black.withOpacity(0.25),
                    context: context,
                    builder: (context) {
                      return AddPeriodDialog();
                    },
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.blue,
                  padding: const EdgeInsets.all(6),
                ),
                child: const Text(
                  'Adicionar Periodo',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 10,
                    fontWeight: FontWeight.w600,
                  ),
                ), // Define o texto do botão
              ),
            ),
            const SizedBox(
              height: 60,
            ),
            Row(
              children: [
                const CircleAvatar(
                  backgroundColor: Colors.pink,
                  maxRadius: 25,
                ),
                const SizedBox(
                  width: 14,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Antonio Andrade',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: AppColors.blue,
                      ),
                    ),
                    InkWell(
                      borderRadius: BorderRadius.circular(15),
                      onTap: () {},
                      child: const Text(
                        'Sair',
                        style: TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.w500,
                          color: AppColors.blue,
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
