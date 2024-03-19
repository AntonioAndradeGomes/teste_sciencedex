import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:teste_sciencedex/app/modules/home/cubit/periods/periods_cubit.dart';
import 'package:teste_sciencedex/app/modules/home/cubit/user/user_cubit.dart';
import 'package:teste_sciencedex/app/modules/home/cubit/user/user_state.dart';
import 'package:teste_sciencedex/app/modules/home/models/form_return.dart';
import 'package:teste_sciencedex/app/modules/home/widgets/add_period_dialog.dart';
import 'package:teste_sciencedex/app/modules/home/widgets/divider_widget.dart';
import 'package:teste_sciencedex/app/modules/home/widgets/image_button.dart';
import 'package:teste_sciencedex/app/modules/home/widgets/input_user_name_widget.dart';
import 'package:teste_sciencedex/app/modules/home/widgets/list_periods_widget.dart';
import 'package:teste_sciencedex/app/modules/home/widgets/logout_widget.dart';
import 'package:teste_sciencedex/app/modules/home/widgets/user_data_loading_widget.dart';
import 'package:teste_sciencedex/app/shared/theme/app_colors.dart';

class HomePage extends StatefulWidget {
  const HomePage({
    super.key,
  });
  @override
  State createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _periodsCubit = Modular.get<PeriodsCubit>();
  final _userCubit = Modular.get<UserCubit>();
  final _picker = Modular.get<ImagePicker>();
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: FocusScope.of(context).unfocus,
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: Row(
            children: [
              const Icon(
                Icons.arrow_back_ios_new_rounded,
              ),
              const SizedBox(
                width: 5,
              ),
              Text(
                'Configurações',
                style: GoogleFonts.inter(
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
          elevation: 0,
          backgroundColor: Colors.white,
          centerTitle: false,
        ),
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              BlocBuilder<UserCubit, UserState>(
                bloc: _userCubit,
                builder: (context, state) {
                  if (state is LoadingUser) {
                    return const UserDataLoadingWidget();
                  }
                  if (state is DoneUser) {
                    return Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Expanded(
                          child: InputUserNameWidget(
                            initialValue: state.username,
                            onChanged: _userCubit.setNameUser,
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        ImageButton(
                          imagePath: state.pathImage,
                          onTap: () async {
                            final XFile? image = await _picker.pickImage(
                              source: ImageSource.gallery,
                            );
                            if (image != null) {
                              _userCubit.setFilePath(
                                image.path,
                              );
                            }
                          },
                        ),
                      ],
                    );
                  }
                  return const SizedBox();
                },
              ),
              const DividerWidget(),
              Text(
                'Períodos',
                style: GoogleFonts.inter(
                  color: Colors.black,
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Container(
                height: 345,
                margin: const EdgeInsets.only(
                  top: 17.82,
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
                child: SizedBox(
                  height: 24,
                  child: ElevatedButton(
                    onPressed: () async {
                      final entity = await showDialog<FormReturn?>(
                        barrierColor: Colors.black.withOpacity(0.25),
                        context: context,
                        builder: (context) {
                          return const AddPeriodDialog();
                        },
                      ).then(
                        (value) {
                          FocusScope.of(context).requestFocus(FocusNode());
                          return value;
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
                    child: Text(
                      'Adicionar Periodo',
                      style: GoogleFonts.inter(
                        color: Colors.white,
                        fontSize: 10,
                        fontWeight: FontWeight.w600,
                      ),
                    ), // Define o texto do botão
                  ),
                ),
              ),
              const SizedBox(
                height: 65.64,
              ),
              BlocBuilder<UserCubit, UserState>(
                bloc: _userCubit,
                builder: (context, state) {
                  if (state is DoneUser) {
                    return LogoutWidget(
                      pathImage: state.pathImage,
                      username: state.username,
                    );
                  }
                  return const SizedBox();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
