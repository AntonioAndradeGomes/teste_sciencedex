import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:teste_sciencedex/app/modules/home/cubit/form/form_cubit.dart';
import 'package:teste_sciencedex/app/modules/home/cubit/form/form_validator_state.dart';
import 'package:teste_sciencedex/app/modules/home/models/form_return.dart';
import 'package:teste_sciencedex/app/modules/home/models/period_model.dart';
import 'package:teste_sciencedex/app/modules/home/widgets/divider_widget.dart';
import 'package:teste_sciencedex/app/modules/home/widgets/drop_down_category_widget.dart';
import 'package:teste_sciencedex/app/modules/home/widgets/modals/error_form_alert_dialog.dart';
import 'package:teste_sciencedex/app/modules/home/widgets/form_container_item_widget.dart';
import 'package:teste_sciencedex/app/modules/home/widgets/form_item_click_widget.dart';
import 'package:teste_sciencedex/app/modules/home/widgets/form_text_indicator_widget.dart';
import 'package:teste_sciencedex/app/modules/home/widgets/name_text_field_for_dialog_widget.dart';
import 'package:teste_sciencedex/app/modules/home/widgets/text_field_for_dialog_widget.dart';
import 'package:teste_sciencedex/app/shared/theme/app_colors.dart';
import 'package:teste_sciencedex/app/shared/utils/helpers.dart';

class AddPeriodDialog extends StatefulWidget {
  final PeriodModel? entity;
  const AddPeriodDialog({
    super.key,
    this.entity,
  });

  @override
  State<AddPeriodDialog> createState() => _AddPeriodDialogState();
}

class _AddPeriodDialogState extends State<AddPeriodDialog> {
  final _formCubit = Modular.get<FormCubit>();

  @override
  void initState() {
    if (widget.entity != null) {
      _formCubit.initFormByEntity(
        periodEntity: widget.entity!,
      );
    }
    super.initState();
  }

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
          Expanded(
            child: Text(
              'Novo Período',
              style: GoogleFonts.inter(
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
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(
            vertical: 20,
            horizontal: 15,
          ),
          child: BlocBuilder<FormCubit, FormValidatorState>(
            bloc: _formCubit,
            builder: (context, state) {
              return Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  NameTextFieldForDialogWidget(
                    initialNameValue: state.name,
                    onChanged: _formCubit.updateName,
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
                      color: AppColors.grey2,
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
                            FormContainerItemWidget(
                              child: FormItemClickWidget(
                                onTap: () async {
                                  FocusScope.of(context)
                                      .requestFocus(FocusNode());
                                  final date = await Helpers.selectDate(
                                    context,
                                    state.dateInit ?? DateTime.now(),
                                  );
                                  _formCubit.updateDateInit(date);
                                },
                                label: state.dateInit != null
                                    ? DateFormat('dd/MM/yyyy')
                                        .format(state.dateInit!)
                                    : '',
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
                            FormContainerItemWidget(
                              child: FormItemClickWidget(
                                onTap: () async {
                                  FocusScope.of(context)
                                      .requestFocus(FocusNode());
                                  final date = await Helpers.selectDate(
                                    context,
                                    state.dateInit ?? DateTime.now(),
                                  );

                                  _formCubit.updateDateEnd(date);
                                },
                                label: state.dateEnd != null
                                    ? DateFormat('dd/MM/yyyy')
                                        .format(state.dateEnd!)
                                    : '',
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
                            FormContainerItemWidget(
                              child: Center(
                                child: DropDownCategoryWidget(
                                  categories: _formCubit.listCategory,
                                  onChanged: _formCubit.updayteCategory,
                                  value: state.category,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(
                      horizontal: 15,
                    ),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            const FormTextIndicatorWidget(
                              label: 'Meta 1',
                            ),
                            TextFieldForDialogWidget(
                              initialValue: state.goal1,
                              onChanged: _formCubit.updateGoal1,
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
                            TextFieldForDialogWidget(
                              initialValue: state.goal2,
                              onChanged: _formCubit.updateGoal2,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: 35,
                    ),
                    child: Align(
                      alignment: Alignment.center,
                      child: SizedBox(
                        height: 30,
                        width: 89,
                        child: FilledButton(
                          onPressed: () {
                            if (_formCubit.isValid()) {
                              if (state.dateEnd!.isAfter(state.dateInit!)) {
                                Modular.to.pop(
                                  _formCubit.returnPeriod(
                                    widget.entity != null
                                        ? TypeReturn.up
                                        : TypeReturn.add,
                                  ),
                                );
                              } else {
                                showAdaptiveDialog(
                                  context: context,
                                  builder: (_) => const ErrorFormAlertDialog(
                                    title: "Erro!",
                                    message:
                                        'Data inicial depois da data final!',
                                  ),
                                );
                              }
                            } else {
                              showAdaptiveDialog(
                                context: context,
                                builder: (_) => ErrorFormAlertDialog(
                                  title:
                                      "Alguns dados devem ser preenchidos corretamente",
                                  message: _generateError(
                                    isName: state.name.isEmpty,
                                    isInit: state.dateInit == null,
                                    isEnd: state.dateEnd == null,
                                    isCategory: state.category == null,
                                  ),
                                ),
                              );
                            }
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: AppColors.blue,
                          ),
                          child: const Text(
                            'Concluir',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                            ),
                          ), // Define o texto do botão
                        ),
                      ),
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }

  String _generateError({
    required bool isName,
    required bool isInit,
    required bool isEnd,
    required bool isCategory,
  }) {
    List<String> missingFields = [];

    if (isName) {
      missingFields.add('Nome');
    }
    if (isInit) {
      missingFields.add('Data de começo');
    }
    if (isEnd) {
      missingFields.add('Data de fim');
    }
    if (isCategory) {
      missingFields.add('Categoria');
    }
    return 'Devem ser preenchidos:\n${missingFields.join('\n')}';
  }
}
