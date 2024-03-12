import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:intl/intl.dart';
import 'package:teste_sciencedex/app/modules/home/cubit/form/form_cubit.dart';
import 'package:teste_sciencedex/app/modules/home/cubit/form/form_validator_state.dart';
import 'package:teste_sciencedex/app/modules/home/widgets/divider_widget.dart';
import 'package:teste_sciencedex/app/modules/home/widgets/error_form_alert_dialog.dart';
import 'package:teste_sciencedex/app/modules/home/widgets/form_container_item_widget.dart';
import 'package:teste_sciencedex/app/modules/home/widgets/form_item_click_widget.dart';
import 'package:teste_sciencedex/app/modules/home/widgets/form_text_indicator_widget.dart';
import 'package:teste_sciencedex/app/shared/theme/app_colors.dart';
import 'package:teste_sciencedex/app/shared/utils/helpers.dart';

class AddPeriodDialog extends StatefulWidget {
  const AddPeriodDialog({super.key});

  @override
  State<AddPeriodDialog> createState() => _AddPeriodDialogState();
}

class _AddPeriodDialogState extends State<AddPeriodDialog> {
  final _formCubit = Modular.get<FormCubit>();

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
      contentPadding: const EdgeInsets.all(0),
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
                  TextFormField(
                    initialValue: state.name,
                    onChanged: _formCubit.updateName,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: AppColors.grey2,
                      border: UnderlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.circular(5),
                      ),
                      hintText: 'Nomeie seu período',
                      hintStyle: const TextStyle(
                        fontWeight: FontWeight.w500,
                        color: AppColors.grey3,
                      ),
                    ),
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
                                child: DropdownButton<String>(
                                  underline: const SizedBox(),
                                  borderRadius: BorderRadius.circular(8),
                                  iconSize: 15,
                                  isDense: false,
                                  padding: EdgeInsets.zero,
                                  icon: const Icon(
                                    Icons.keyboard_arrow_down_rounded,
                                  ),
                                  value: state.category,
                                  items: _formCubit.listCategory
                                      .map((e) => DropdownMenuItem<String>(
                                            value: e,
                                            child: Text(
                                              e,
                                              style: const TextStyle(
                                                color: Colors.black,
                                                fontSize: 13,
                                                fontWeight: FontWeight.w400,
                                              ),
                                            ),
                                          ))
                                      .toList(),
                                  onChanged: _formCubit.updayteCategory,
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
                            SizedBox(
                              width: 75,
                              height: 30,
                              child: TextFormField(
                                initialValue: _formCubit.state.goal1,
                                onChanged: _formCubit.updateGoal1,
                                keyboardType: TextInputType.number,
                                inputFormatters: [
                                  FilteringTextInputFormatter.allow(
                                      RegExp(r'[0-9]')),
                                ],
                                decoration: const InputDecoration(
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
                                  contentPadding: EdgeInsets.zero,
                                  hintText: 'un',
                                  hintStyle: TextStyle(
                                    color: AppColors.grey3,
                                    fontSize: 13,
                                    fontWeight: FontWeight.w400,
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: AppColors.grey3,
                                    ),
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(7),
                                    ),
                                  ),
                                ),
                                style: const TextStyle(
                                  color: Colors.black,
                                  fontSize: 13,
                                  fontWeight: FontWeight.w400,
                                ),
                                textAlign: TextAlign.center,
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
                            SizedBox(
                              width: 75,
                              height: 30,
                              child: TextFormField(
                                initialValue: _formCubit.state.goal2,
                                onChanged: _formCubit.updateGoal2,
                                keyboardType: TextInputType.number,
                                inputFormatters: [
                                  FilteringTextInputFormatter.allow(
                                      RegExp(r'[0-9]')),
                                ],
                                decoration: const InputDecoration(
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
                                  contentPadding: EdgeInsets.zero,
                                  hintText: 'un',
                                  hintStyle: TextStyle(
                                    color: AppColors.grey3,
                                    fontSize: 13,
                                    fontWeight: FontWeight.w400,
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: AppColors.grey3,
                                    ),
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(7),
                                    ),
                                  ),
                                ),
                                style: const TextStyle(
                                  color: Colors.black,
                                  fontSize: 13,
                                  fontWeight: FontWeight.w400,
                                ),
                                textAlign: TextAlign.center,
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
                    ),
                    child: Align(
                      alignment: Alignment.center,
                      child: FilledButton(
                        onPressed: () {
                          if (_formCubit.isValid()) {
                          } else {
                            showAdaptiveDialog(
                              context: context,
                              builder: (_) => ErrorFormAlertDialog(
                                isName: state.name.isEmpty,
                                isInit: state.dateInit == null,
                                isEnd: state.dateEnd == null,
                                isCategory: state.category == null,
                              ),
                            );
                          }
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.blue,
                          padding: const EdgeInsets.symmetric(
                            vertical: 8,
                            horizontal: 20,
                          ),
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
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
