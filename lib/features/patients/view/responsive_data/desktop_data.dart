import 'dart:io';

import 'package:dental_crm_flutter_front/features/patients/bloc/patients_bloc.dart';
import 'package:dental_crm_flutter_front/features/patients/widgets/date_selection.dart';
import 'package:dental_crm_flutter_front/features/patients/widgets/form_button.dart';
import 'package:dental_crm_flutter_front/repositories/patient/patient_repository.dart';
import 'package:dental_crm_flutter_front/utils/utils.dart';
import 'package:dental_crm_flutter_front/widgets/widgets.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_multi_formatter/flutter_multi_formatter.dart';
import 'package:intl/intl.dart';

class DesktopDataScreen extends StatefulWidget {
  final int patientId;
  const DesktopDataScreen({Key? key, required this.patientId})
      : super(key: key);

  @override
  State<DesktopDataScreen> createState() => _DesktopDataScreenState();
}

class _DesktopDataScreenState extends State<DesktopDataScreen> {
  PatientRepository patientRepository = PatientRepository();
  late PatientsBloc patientsBloc;

  bool _isEditing = false;
  String? _gender = 'Чоловік';
  final TextEditingController _surnameController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _phone1Controller = TextEditingController();
  final TextEditingController _phone2Controller = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();
  final TextEditingController _infoController = TextEditingController();
  final TextEditingController _commentController = TextEditingController();
  String selectedDate =
      DateFormat("yyyy-MM-dd'T'HH:mm:ss'Z'").format(DateTime.now());

  @override
  void initState() {
    super.initState();
    patientsBloc = PatientsBloc(patientRepository);
    patientsBloc.add(GetPatientByIdEvent(widget.patientId));
  }

  @override
  void dispose() {
    super.dispose();
    patientsBloc.close();
    _surnameController.dispose();
    _nameController.dispose();
    _phone1Controller.dispose();
    _phone2Controller.dispose();
    _emailController.dispose();
    _addressController.dispose();
    _infoController.dispose();
    _commentController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Row(
        children: [
          const SideMenu(),
          Expanded(
            child: _editForm(context),
          ),
        ],
      ),
    );
  }

  SingleChildScrollView _editForm(BuildContext context) {
    return SingleChildScrollView(
      child: BlocBuilder<PatientsBloc, PatientsState>(
        bloc: patientsBloc,
        builder: (context, state) {
          if (state is PatientLoadedState) {
            final patient = state.patient;
            List<String> nameParts = patient.name.split(' ');
            _surnameController.text = nameParts[0];
            _nameController.text = nameParts.length > 1 ? nameParts[1] : '';
            _phone1Controller.text = patient.phone1;
            _phone2Controller.text = patient.phone2;
            _emailController.text = patient.email;
            _addressController.text = patient.address;
            _infoController.text = patient.importantInfo;
            _gender = patient.sex;
            _commentController.text = patient.comment;
            final day = patient.dateOfBirth.day;
            final month = patient.dateOfBirth.month;
            final year = patient.dateOfBirth.year;
            return _showDataForm(context, day, month, year);
          }
          return const MyProgressIndicator();
        },
      ),
    );
  }

  SingleChildScrollView _showDataForm(
      BuildContext context, int day, month, year) {
    return SingleChildScrollView(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
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
                      TextField(
                        controller: _surnameController,
                        decoration:
                            const InputDecoration(labelText: 'Прізвище'),
                      ),
                      const SizedBox(height: 10),
                      TextField(
                        controller: _nameController,
                        decoration: const InputDecoration(labelText: "Ім'я"),
                      ),
                      const SizedBox(height: 10),
                      Stack(
                        alignment: Alignment.centerLeft,
                        children: [
                          TextFormField(
                            controller: _phone1Controller,
                            keyboardType: TextInputType.number,
                            inputFormatters: [
                              PhoneInputFormatter(),
                            ],
                            decoration:
                                const InputDecoration(labelText: 'Телефон 1'),
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
                      TextFormField(
                        controller: _phone2Controller,
                        keyboardType: TextInputType.number,
                        inputFormatters: [
                          PhoneInputFormatter(),
                        ],
                        decoration:
                            const InputDecoration(labelText: 'Телефон 2'),
                      ),
                      const SizedBox(height: 10),
                      TextField(
                        controller: _addressController,
                        decoration: const InputDecoration(labelText: "Адреса"),
                      ),
                      const SizedBox(height: 10),
                      TextField(
                        controller: _emailController,
                        decoration: const InputDecoration(labelText: "E-mail"),
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
                      TextField(
                        controller: _infoController,
                        decoration:
                            const InputDecoration(labelText: "Валива інф-я"),
                      ),
                      const SizedBox(height: 10),
                      TextField(
                        controller: _commentController,
                        decoration:
                            const InputDecoration(labelText: "Коментар"),
                      ),
                      const SizedBox(height: 10),
                      DateSelection(
                        day: day,
                        month: month,
                        year: year,
                        onDateSelected: (DateTime date) {
                          final formattedDate =
                              DateFormat('yyyy-MM-ddTHH:mm:ssZ').format(date);
                          setState(() {
                            selectedDate = formattedDate;
                          });
                        },
                      ),
                      const SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          FormButton(
                            text: 'Зберегти',
                            color: AppColors.mainBlueColor,
                            onTap: () {
                              //todo: add validation
                            },
                          ),
                          const SizedBox(width: 10),
                          FormButton(
                            text: 'Відмінити',
                            textColor: Colors.black,
                            color: const Color.fromARGB(255, 201, 199, 199),
                            onTap: () {
                              Navigator.pop(context);
                            },
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
    );
  }

  // SingleChildScrollView oldForm() {
  //   return SingleChildScrollView(
  //           child: Container(
  //             padding:
  //                 const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
  //             margin:
  //                 const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
  //             decoration: const BoxDecoration(
  //               color: Color.fromARGB(255, 241, 240, 240),
  //               borderRadius: BorderRadius.all(Radius.circular(10)),
  //               boxShadow: [
  //                 BoxShadow(
  //                   color: Colors.black12,
  //                   blurRadius: 5,
  //                   offset: Offset(0, 5),
  //                 ),
  //               ],
  //             ),
  //             child: Column(
  //               crossAxisAlignment: CrossAxisAlignment.start,
  //               children: [
  //                 _buildHeader(),
  //                 const SizedBox(height: 20),
  //                 Row(
  //                   children: [
  //                     _buildPatientImage(),
  //                     const SizedBox(width: 20),
  //                     Expanded(
  //                       child: Column(
  //                         children: [
  //                           const Text(
  //                             'Ім\'я Призвище',
  //                             style: TextStyle(
  //                               fontSize: 18,
  //                               fontWeight: FontWeight.bold,
  //                             ),
  //                           ),
  //                           const SizedBox(height: 10),
  //                           const Text(
  //                             'Телефон',
  //                             style: TextStyle(fontSize: 16),
  //                           ),
  //                           const SizedBox(height: 10),
  //                           const Text(
  //                             'Адреса',
  //                             style: TextStyle(fontSize: 16),
  //                           ),
  //                           const SizedBox(height: 10),
  //                           const Text(
  //                             'Email',
  //                             style: TextStyle(fontSize: 16),
  //                           ),
  //                           const SizedBox(height: 10),
  //                           const Text(
  //                             'Стать',
  //                             style: TextStyle(fontSize: 16),
  //                           ),
  //                           const SizedBox(height: 10),
  //                           const Text(
  //                             'Важлива інформація',
  //                             style: TextStyle(fontSize: 16),
  //                           ),
  //                           const SizedBox(height: 10),
  //                           const Text(
  //                             'Коментар',
  //                             style: TextStyle(fontSize: 16),
  //                           ),
  //                           const SizedBox(height: 10),
  //                           const Text(
  //                             'Дата народження',
  //                             style: TextStyle(fontSize: 16),
  //                           ),
  //                           const SizedBox(height: 10),
  //                           if (!_isEditing) ...[
  //                             ElevatedButton(
  //                               onPressed: () {
  //                                 setState(() {
  //                                   _isEditing = true;
  //                                 });
  //                               },
  //                               child: const Text('Редагувати'),
  //                             ),
  //                           ],
  //                           if (_isEditing) ...[
  //                             ElevatedButton(
  //                               onPressed: () {
  //                                 setState(() {
  //                                   _isEditing = false;
  //                                 });
  //                               },
  //                               child: const Text('Зберегти'),
  //                             ),
  //                             const SizedBox(height: 10),
  //                             ElevatedButton(
  //                               onPressed: () {
  //                                 setState(() {
  //                                   _isEditing = false;
  //                                 });
  //                               },
  //                               child: const Text('Відмінити'),
  //                             ),
  //                           ],
  //                         ],
  //                       ),
  //                     ),
  //                   ],
  //                 ),
  //               ],
  //             ),
  //           ),
  //         );
  // }

  Widget _buildPatientImage() {
    return Stack(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(100),
          child: Container(
            width: 200,
            height: 200,
            color: AppColors.tilesBgColor,
            child: _pickedImagePath != null
                ? Image.file(
                    File(_pickedImagePath!),
                    fit: BoxFit.cover,
                  )
                : Image.asset(
                    'assets/images/profile2.png',
                    fit: BoxFit.cover,
                  ),
          ),
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
              onPressed: _selectImage,
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

  String? _pickedImagePath;

  Future<void> _selectImage() async {
    try {
      FilePickerResult? result = await FilePicker.platform.pickFiles(
        type: FileType.image,
        allowMultiple: false,
      );
      if (result != null) {
        PlatformFile file = result.files.first;
        setState(() {
          _pickedImagePath = file.path;
        });
      }
    } on PlatformException catch (e) {
      print('Error while picking the image: $e');
    }
  }

  Widget _buildHeader() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: const [
                Icon(Icons.person, size: 24),
                SizedBox(width: 8),
                Text(
                  'Дані пацієнта',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            IconButton(
              icon: const Icon(Icons.close),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
        const SizedBox(height: 10),
      ],
    );
  }

  // Widget _buildPatientImage() {
  //   return Container(
  //     width: 200,
  //     height: 200,
  //     color: AppColors.tilesBgColor,
  //     child: Image.asset('assets/images/profile2.png'),
  //   );
  // }
}
