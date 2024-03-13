import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:teste_sciencedex/app/modules/home/cubit/periods/periods_cubit.dart';
import 'package:teste_sciencedex/app/modules/home/cubit/user/user_cubit.dart';
import 'package:teste_sciencedex/app/modules/home/models/form_return.dart';
import 'package:teste_sciencedex/app/modules/home/widgets/add_period_dialog.dart';
import 'package:teste_sciencedex/app/modules/home/widgets/divider_widget.dart';
import 'package:teste_sciencedex/app/modules/home/widgets/image_button.dart';
import 'package:teste_sciencedex/app/modules/home/widgets/list_periods_widget.dart';
import 'package:teste_sciencedex/app/shared/theme/app_colors.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _periodsCubit = Modular.get<PeriodsCubit>();
  final _userCubit = Modular.get<UserCubit>();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Configurações'),
          elevation: 0,
          backgroundColor: Colors.white,
          centerTitle: false,
        ),
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Row(
                children: [
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        fillColor: Colors.white,
                        filled: true,
                        border: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: AppColors.grey3,
                          ),
                          borderRadius: BorderRadius.all(
                            Radius.circular(7),
                          ),
                        ),
                        contentPadding: EdgeInsets.symmetric(
                          horizontal: 5,
                        ),
                        labelText: 'Apelido',
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: AppColors.grey3,
                          ),
                          borderRadius: BorderRadius.all(
                            Radius.circular(7),
                          ),
                        ),
                      ),
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 13,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  ImageButton(),
                ],
              ),
              const DividerWidget(),
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
                margin: const EdgeInsets.only(
                  top: 17,
                  bottom: 12,
                ),
                decoration: BoxDecoration(
                  color: AppColors.grey2,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: const ListPeriodsWidget(),
              ),
              Align(
                alignment: Alignment.topRight,
                child: FilledButton(
                  onPressed: () async {
                    final entity = await showDialog<FormReturn?>(
                      barrierColor: Colors.black.withOpacity(0.25),
                      context: context,
                      builder: (context) {
                        return const AddPeriodDialog();
                      },
                    );
                    if (entity != null) {
                      _periodsCubit.addPeriod(
                        entity.periodModel,
                      );
                    }
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
      ),
    );
  }
}
