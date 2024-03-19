import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:teste_sciencedex/app/modules/home/cubit/periods/periods_cubit.dart';
import 'package:teste_sciencedex/app/modules/home/cubit/periods/periods_state.dart';
import 'package:teste_sciencedex/app/modules/home/models/form_return.dart';
import 'package:teste_sciencedex/app/modules/home/widgets/modals/add_period_dialog.dart';
import 'package:teste_sciencedex/app/modules/home/widgets/period_item.dart';
import 'package:teste_sciencedex/app/modules/home/widgets/modals/show_period_dialog.dart';

class ListPeriodsWidget extends StatelessWidget {
  const ListPeriodsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final periodsCubit = Modular.get<PeriodsCubit>();
    return BlocBuilder<PeriodsCubit, PeriodsState>(
      bloc: periodsCubit,
      builder: (context, state) {
        if (state is LoadingPeriodsState) {
          return const Center(
            child: CircularProgressIndicator.adaptive(),
          );
        }
        if (state is DonePeriodsState) {
          return ListView.separated(
            padding: const EdgeInsets.symmetric(
              horizontal: 7,
              vertical: 23,
            ),
            itemCount: state.periods!.length,
            itemBuilder: (context, index) {
              final period = state.periods![index];
              return PeriodItem(
                entity: period,
                onTap: () async {
                  FocusScope.of(context).unfocus();
                  final type = await showDialog<TypeReturn?>(
                    barrierColor: Colors.black.withOpacity(0.25),
                    context: context,
                    builder: (context) {
                      return ShowPeriodDialog(
                        entity: period,
                      );
                    },
                  ).then((value) {
                    FocusScope.of(context).requestFocus(FocusNode());
                    return value;
                  });
                  if (type != null) {
                    if (type == TypeReturn.del) {
                      periodsCubit.removePeriod(period);
                    } else {
                      final entity = await showDialog<FormReturn?>(
                        barrierColor: Colors.black.withOpacity(0.25),
                        // ignore: use_build_context_synchronously
                        context: context,
                        builder: (context) {
                          return AddPeriodDialog(
                            entity: period,
                          );
                        },
                      );
                      if (entity != null) {
                        periodsCubit.updatePeriod(entity.periodModel);
                      }
                    }
                  }
                },
              );
            },
            separatorBuilder: (context, index) => const SizedBox(
              height: 10,
            ),
          );
        }
        return const SizedBox();
      },
    );
  }
}
