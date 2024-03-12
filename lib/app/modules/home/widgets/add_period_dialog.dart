import 'package:flutter/material.dart';
import 'package:teste_sciencedex/app/shared/theme/app_colors.dart';

class AddPeriodDialog extends StatefulWidget {
  const AddPeriodDialog({super.key});

  @override
  State<AddPeriodDialog> createState() => _AddPeriodDialogState();
}

class _AddPeriodDialogState extends State<AddPeriodDialog> {
  List<String> list = <String>[
    'Categoria 1',
    'Categoria 2',
    'Categoria 3',
    'Categoria 4',
    'Categoria 5'
  ];

  String? category;

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
      title: const Row(
        children: [
          Expanded(
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
          Icon(
            Icons.close,
          ),
        ],
      ),
      content: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(
          vertical: 20,
          horizontal: 15,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextFormField(
              decoration: InputDecoration(
                filled: true,
                fillColor: AppColors.grey2,
                border: UnderlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.circular(5),
                ),
                hintText: 'Nomeie seu período',
                hintStyle: TextStyle(
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
                      Text(
                        'Começa',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
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
                      Text(
                        'Termina',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
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
                      const Expanded(
                        child: Text(
                          'Categoria',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                      Container(
                        height: 30,
                        width: 110,
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: AppColors.grey3,
                          ), // Cor da borda
                          color: Colors.white,
                          borderRadius:
                              BorderRadius.circular(7), // Raio da borda
                        ),
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
                            value: category,
                            items: list
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
                            onChanged: (value) {
                              category = value;
                              setState(() {});
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Container(
              child: Column(
                children: [
                  Row(
                    children: [
                      Text('Meta 1'),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              children: [
                Text('Meta 2'),
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 35,
              ),
              child: Align(
                alignment: Alignment.center,
                child: FilledButton(
                  onPressed: () {},
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
        ),
      ),
    );
  }
}
