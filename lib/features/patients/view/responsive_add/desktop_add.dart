import 'package:dental_crm_flutter_front/features/patients/widgets/date_selection.dart';
import 'package:dental_crm_flutter_front/features/patients/widgets/form_button.dart';
import 'package:dental_crm_flutter_front/utils/utils.dart';
import 'package:dental_crm_flutter_front/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_multi_formatter/flutter_multi_formatter.dart';

class DesktopAddPatientForm extends StatefulWidget {
  const DesktopAddPatientForm({super.key});

  @override
  State<DesktopAddPatientForm> createState() => _DesktopAddPatientFormState();
}

class _DesktopAddPatientFormState extends State<DesktopAddPatientForm> {
  String? _gender = 'Чоловік';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Row(
        children: [
          const SideMenu(),
          Expanded(
            child: SingleChildScrollView(
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                margin:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                decoration: const BoxDecoration(
                  color: Color.fromARGB(255, 241, 240, 240),
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black12,
                      blurRadius: 5,
                      offset: Offset(0, 5),
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildHeader(),
                    const SizedBox(height: 20),
                    Row(
                      children: [
                        _buildPatientImage(),
                        const SizedBox(width: 20),
                        Expanded(
                          child: Column(
                            children: [
                              const TextField(
                                decoration:
                                    InputDecoration(labelText: 'Прізвище'),
                              ),
                              const SizedBox(height: 10),
                              const TextField(
                                decoration: InputDecoration(labelText: "Ім'я"),
                              ),
                              const SizedBox(height: 10),
                              Stack(
                                alignment: Alignment.centerLeft,
                                children: [
                                  TextFormField(
                                    keyboardType: TextInputType.phone,
                                    inputFormatters: [
                                      MaskedInputFormatter(
                                          '+380 (##) ###-##-##')
                                    ],
                                  ),
                                  IgnorePointer(
                                    child: TextFormField(
                                      decoration: const InputDecoration(
                                        hintText: '+380 (__) ___-__-__',
                                        hintStyle:
                                            TextStyle(color: Colors.grey),
                                      ),
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Column(
                            children: [
                              const TextField(
                                decoration:
                                    InputDecoration(labelText: 'Телефон 2'),
                              ),
                              const SizedBox(height: 10),
                              const TextField(
                                decoration:
                                    InputDecoration(labelText: "Адреса"),
                              ),
                              const SizedBox(height: 10),
                              const TextField(
                                decoration:
                                    InputDecoration(labelText: "E-mail"),
                              ),
                              const SizedBox(height: 10),
                              Row(
                                children: [
                                  const Text('Стать:'),
                                  const SizedBox(width: 10),
                                  Radio(
                                    value: 'Чоловік',
                                    groupValue: _gender,
                                    onChanged: (String? value) =>
                                        setState(() => _gender = value),
                                  ),
                                  const Text('Чоловік'),
                                  Radio(
                                    value: 'Жінка',
                                    groupValue: _gender,
                                    onChanged: (String? value) =>
                                        setState(() => _gender = value),
                                  ),
                                  const Text('Жінка'),
                                ],
                              ),
                              const TextField(
                                decoration:
                                    InputDecoration(labelText: "Валива інф-я"),
                              ),
                              const SizedBox(height: 10),
                              const TextField(
                                decoration:
                                    InputDecoration(labelText: "Коментар"),
                              ),
                              const SizedBox(height: 10),
                              const DateSelection(),
                              const SizedBox(height: 10),
                              Row(
                                children: [
                                  FormButton(
                                    text: 'Зберегти',
                                    color: AppColors.mainBlueColor,
                                    onTap: () {},
                                  ),
                                  const SizedBox(width: 10),
                                  FormButton(
                                    text: 'Відмінити',
                                    textColor: Colors.black,
                                    color: const Color.fromARGB(
                                        255, 201, 199, 199),
                                    onTap: () {},
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _buildHeader() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: const [
            Icon(Icons.add_circle_outline_sharp, size: 24),
            SizedBox(width: 8),
            Text(
              'Новий пацієнт',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        const SizedBox(height: 10),
      ],
    );
  }

  Widget _buildPatientImage() {
    return Stack(
      children: [
        Container(
          width: 200,
          height: 200,
          color: AppColors.tilesBgColor,
          child: Image.asset('assets/images/profile2.png'),
        ),
        Positioned(
          top: 10,
          right: 10,
          child: Container(
            decoration: BoxDecoration(
              color: AppColors.mainBlueColor,
              borderRadius: BorderRadius.circular(50),
            ),
            child: IconButton(
              icon: const Icon(
                Icons.edit,
                color: Colors.white,
              ),
              onPressed: () {
                // Implement edit image logic
              },
            ),
          ),
        ),
        Positioned(
          bottom: 10,
          right: 10,
          child: Container(
            decoration: BoxDecoration(
              color: AppColors.mainBlueColor,
              borderRadius: BorderRadius.circular(50),
            ),
            child: IconButton(
              icon: const Icon(
                Icons.delete,
                color: Colors.white,
              ),
              onPressed: () {
                // Implement delete image logic
              },
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildTextFields() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: const [
        TextField(
          decoration: InputDecoration(labelText: 'Прізвище'),
        ),
        SizedBox(height: 10),
        TextField(
          decoration: InputDecoration(labelText: "Ім'я"),
        ),
        SizedBox(height: 10),
        TextField(
          decoration: InputDecoration(labelText: 'Телефон'),
        ),
      ],
    );
  }
}
