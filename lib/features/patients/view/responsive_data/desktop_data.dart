import 'package:dental_crm_flutter_front/utils/utils.dart';
import 'package:dental_crm_flutter_front/widgets/widgets.dart';
import 'package:flutter/material.dart';

class DesktopDataScreen extends StatefulWidget {
  const DesktopDataScreen({Key? key}) : super(key: key);

  @override
  State<DesktopDataScreen> createState() => _DesktopDataScreenState();
}

class _DesktopDataScreenState extends State<DesktopDataScreen> {
  bool _isEditing = false;

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
                              const Text(
                                'Ім\'я Призвище',
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(height: 10),
                              const Text(
                                'Телефон',
                                style: TextStyle(fontSize: 16),
                              ),
                              const SizedBox(height: 10),
                              const Text(
                                'Адреса',
                                style: TextStyle(fontSize: 16),
                              ),
                              const SizedBox(height: 10),
                              const Text(
                                'Email',
                                style: TextStyle(fontSize: 16),
                              ),
                              const SizedBox(height: 10),
                              const Text(
                                'Стать',
                                style: TextStyle(fontSize: 16),
                              ),
                              const SizedBox(height: 10),
                              const Text(
                                'Важлива інформація',
                                style: TextStyle(fontSize: 16),
                              ),
                              const SizedBox(height: 10),
                              const Text(
                                'Коментар',
                                style: TextStyle(fontSize: 16),
                              ),
                              const SizedBox(height: 10),
                              const Text(
                                'Дата народження',
                                style: TextStyle(fontSize: 16),
                              ),
                              const SizedBox(height: 10),
                              if (!_isEditing) ...[
                                ElevatedButton(
                                  onPressed: () {
                                    setState(() {
                                      _isEditing = true;
                                    });
                                  },
                                  child: const Text('Редагувати'),
                                ),
                              ],
                              if (_isEditing) ...[
                                ElevatedButton(
                                  onPressed: () {
                                    setState(() {
                                      _isEditing = false;
                                    });
                                  },
                                  child: const Text('Зберегти'),
                                ),
                                const SizedBox(height: 10),
                                ElevatedButton(
                                  onPressed: () {
                                    setState(() {
                                      _isEditing = false;
                                    });
                                  },
                                  child: const Text('Відмінити'),
                                ),
                              ],
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
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
              icon: Icon(Icons.close),
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

  Widget _buildPatientImage() {
    return Container(
      width: 200,
      height: 200,
      color: AppColors.tilesBgColor,
      child: Image.asset('assets/images/profile2.png'),
    );
  }
}
