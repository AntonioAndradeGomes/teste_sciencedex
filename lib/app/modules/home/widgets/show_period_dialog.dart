import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:intl/intl.dart';
import 'package:teste_sciencedex/app/modules/home/models/form_return.dart';
import 'package:teste_sciencedex/app/modules/home/models/period_model.dart';
import 'package:teste_sciencedex/app/modules/home/widgets/divider_widget.dart';
import 'package:teste_sciencedex/app/modules/home/widgets/form_text_indicator_widget.dart';
import 'package:teste_sciencedex/app/modules/home/widgets/name_text_field_for_dialog_widget.dart';
import 'package:teste_sciencedex/app/shared/theme/app_colors.dart';

class ShowPeriodDialog extends StatelessWidget {
  final PeriodModel entity;
  const ShowPeriodDialog({
    super.key,
    required this.entity,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.white,
      elevation: 0,
      titlePadding: const EdgeInsets.only(
        top: 15,
        right: 15,
        left: 15,
      ),
      contentPadding: EdgeInsets.zero,
      title: Row(
        children: [
          const Expanded(
            child: Text(
              'Novo Período',
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w600,
                color: Colors.black,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          InkWell(
            onTap: Modular.to.pop,
            borderRadius: BorderRadius.circular(100),
            child: const Icon(
              color: AppColors.grey2,
              size: 17,
              Icons.close,
            ),
          ),
        ],
      ),
      content: GestureDetector(
        onTap: FocusScope.of(context).unfocus,
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(
            vertical: 20,
            horizontal: 15,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              NameTextFieldForDialogWidget(
                initialNameValue: entity.name,
                readOnly: true,
              ),
              Container(
                margin: const EdgeInsets.symmetric(
                  vertical: 18,
                ),
                width: 260,
                padding: const EdgeInsets.symmetric(
                  vertical: 20,
                  horizontal: 17,
                ),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Row(
                      children: [
                        const FormTextIndicatorWidget(
                          label: 'Começa',
                        ),
                        Text(
                          DateFormat('dd/MM/yyyy').format(entity.dateInit),
                          style: const TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 10,
                          ),
                        ),
                      ],
                    ),
                    const DividerWidget(
                      top: 16,
                      bottom: 7,
                    ),
                    Row(
                      children: [
                        const FormTextIndicatorWidget(
                          label: 'Termina',
                        ),
                        Text(
                          DateFormat('dd/MM/yyyy').format(
                            entity.dateEnd,
                          ),
                          style: const TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 10,
                          ),
                        ),
                      ],
                    ),
                    const Padding(
                      padding: EdgeInsets.only(
                        top: 16,
                        bottom: 7,
                      ),
                      child: Divider(
                        color: AppColors.grey3,
                        height: 1.9,
                      ),
                    ),
                    Row(
                      children: [
                        const FormTextIndicatorWidget(
                          label: 'Categoria',
                        ),
                        Text(
                          entity.category,
                          style: const TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 10,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Container(
                margin: const EdgeInsets.symmetric(
                  horizontal: 18,
                ),
                child: Column(
                  children: [
                    Row(
                      children: [
                        const FormTextIndicatorWidget(
                          label: 'Meta 1',
                        ),
                        Text(
                          entity.goal1 ?? '',
                          style: const TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 10,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: [
                        const FormTextIndicatorWidget(
                          label: 'Meta 2',
                        ),
                        Text(
                          entity.goal2 ?? '',
                          style: const TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 10,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 35,
                    horizontal: 15,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        width: 89,
                        height: 30,
                        child: FilledButton(
                          onPressed: () {
                            Modular.to.pop(
                              TypeReturn.del,
                            );
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: AppColors.red,
                          ),
                          child: const Text(
                            'Excluir',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                            ),
                          ), // Define o texto do botão
                        ),
                      ),
                      SizedBox(
                        width: 89,
                        height: 30,
                        child: FilledButton(
                          onPressed: () {
                            Modular.to.pop(
                              TypeReturn.up,
                            );
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: AppColors.blue,
                          ),
                          child: const Text(
                            'Editar',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                            ),
                          ), // Define o texto do botão
                        ),
                      ),
                    ],
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
