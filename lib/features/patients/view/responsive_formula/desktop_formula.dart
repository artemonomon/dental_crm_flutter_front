import 'package:animated_custom_dropdown/custom_dropdown.dart';
import 'package:dental_crm_flutter_front/features/patients/widgets/widgets.dart';
import 'package:dental_crm_flutter_front/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';

import '../../../../repositories/patient/models/models.dart';
import '../../../../utils/utils.dart';

class DesktopFormula extends StatefulWidget {
  final Patient patient;

  const DesktopFormula({super.key, required this.patient});

  @override
  State<DesktopFormula> createState() => _DesktopFormulaState();
}

class _DesktopFormulaState extends State<DesktopFormula> {
  String? selectedTooth = "18";
  final TextEditingController toothTypeController = TextEditingController();
  final TextEditingController toothDamageController = TextEditingController();
  final TextEditingController toothParodontController = TextEditingController();
  final TextEditingController toothEndoController = TextEditingController();
  final TextEditingController toothConstructionsController =
      TextEditingController();
  List<Map<String, String>>? toothDamage = [];
  List<Map<String, String>>? toothParodont = [];
  List<Map<String, String>>? toothEndo = [];
  List<Map<String, String>>? toothConstructions = [];

  List<ToothData> teethData = [
    const ToothData(number: 18, imagePath: 'assets/teeth/18.png'),
    const ToothData(number: 17, imagePath: 'assets/teeth/17.png'),
    const ToothData(number: 16, imagePath: 'assets/teeth/16.png'),
    const ToothData(number: 15, imagePath: 'assets/teeth/15.png'),
    const ToothData(number: 14, imagePath: 'assets/teeth/14.png'),
    const ToothData(number: 13, imagePath: 'assets/teeth/13.png'),
    const ToothData(number: 12, imagePath: 'assets/teeth/12.png'),
    const ToothData(number: 11, imagePath: 'assets/teeth/11.png'),
    const ToothData(number: 21, imagePath: 'assets/teeth/21.png'),
    const ToothData(number: 22, imagePath: 'assets/teeth/22.png'),
    const ToothData(number: 23, imagePath: 'assets/teeth/23.png'),
    const ToothData(number: 24, imagePath: 'assets/teeth/24.png'),
    const ToothData(number: 25, imagePath: 'assets/teeth/25.png'),
    const ToothData(number: 26, imagePath: 'assets/teeth/26.png'),
    const ToothData(number: 27, imagePath: 'assets/teeth/27.png'),
    const ToothData(number: 28, imagePath: 'assets/teeth/28.png'),
    const ToothData(number: 48, imagePath: 'assets/teeth/48.png'),
    const ToothData(number: 47, imagePath: 'assets/teeth/47.png'),
    const ToothData(number: 46, imagePath: 'assets/teeth/46.png'),
    const ToothData(number: 45, imagePath: 'assets/teeth/45.png'),
    const ToothData(number: 44, imagePath: 'assets/teeth/44.png'),
    const ToothData(number: 43, imagePath: 'assets/teeth/43.png'),
    const ToothData(number: 42, imagePath: 'assets/teeth/42.png'),
    const ToothData(number: 41, imagePath: 'assets/teeth/41.png'),
    const ToothData(number: 31, imagePath: 'assets/teeth/31.png'),
    const ToothData(number: 32, imagePath: 'assets/teeth/32.png'),
    const ToothData(number: 33, imagePath: 'assets/teeth/33.png'),
    const ToothData(number: 34, imagePath: 'assets/teeth/34.png'),
    const ToothData(number: 35, imagePath: 'assets/teeth/35.png'),
    const ToothData(number: 36, imagePath: 'assets/teeth/36.png'),
    const ToothData(number: 37, imagePath: 'assets/teeth/37.png'),
    const ToothData(number: 38, imagePath: 'assets/teeth/38.png'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Row(
        children: [
          const SideMenu(),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const FormulaHeader(),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        flex: 3,
                        child: Column(
                          children: [
                            Container(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 20, vertical: 20),
                              margin: const EdgeInsets.symmetric(
                                  horizontal: 20, vertical: 20),
                              decoration: const BoxDecoration(
                                color: Color.fromARGB(255, 241, 240, 240),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10)),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black12,
                                    blurRadius: 5,
                                    offset: Offset(0, 5),
                                  ),
                                ],
                              ),
                              child: Column(
                                children: [
                                  const SizedBox(height: 20),
                                  GridView.builder(
                                    shrinkWrap: true,
                                    physics:
                                        const NeverScrollableScrollPhysics(),
                                    gridDelegate:
                                        const SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: 16, // Number of columns
                                      childAspectRatio: 140 / 525,
                                      mainAxisExtent: 200,
                                    ),
                                    itemCount: teethData.length,
                                    itemBuilder: (context, index) {
                                      final tooth = teethData[index];

                                      return GestureDetector(
                                        onTap: () {
                                          setState(() {
                                            selectedTooth =
                                                tooth.number.toString();
                                          });
                                        },
                                        child: Card(
                                          color: Colors.white,
                                          child: Column(
                                            children: [
                                              const SizedBox(height: 5),
                                              if (index >= 16)
                                                Text(
                                                  tooth.number.toString(),
                                                  style: const TextStyle(
                                                    fontSize: 14,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                              Expanded(
                                                child: Image.asset(
                                                  tooth.imagePath,
                                                  fit: BoxFit.contain,
                                                ),
                                              ),
                                              if (index < 16)
                                                Text(
                                                  tooth.number.toString(),
                                                  style: const TextStyle(
                                                    fontSize: 14,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                              const SizedBox(height: 5),
                                            ],
                                          ),
                                        ),
                                      );
                                    },
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 20, vertical: 20),
                              margin:
                                  const EdgeInsets.symmetric(horizontal: 20),
                              decoration: const BoxDecoration(
                                color: Color.fromARGB(255, 241, 240, 240),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10)),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black12,
                                    blurRadius: 5,
                                    offset: Offset(0, 5),
                                  ),
                                ],
                              ),
                              child: Column(
                                children: [
                                  Row(
                                    children: [
                                      const Text(
                                        'Пацієнт:',
                                        style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      const SizedBox(width: 10),
                                      Text(
                                        widget.patient.name,
                                        style: const TextStyle(fontSize: 16),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 10),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      // Column(
                                      //   children: [
                                      //     Text('Тип зуба'),
                                      //     SizedBox(height: 10),
                                      //     //Here i need to show all teeth with type
                                      //   ],
                                      // ),
                                      Column(
                                        children: [
                                          const Text('Ураження'),
                                          const SizedBox(height: 10),
                                          //Here i need to show all teeth with damage
                                          ListView.builder(
                                            shrinkWrap: true,
                                            physics:
                                                const NeverScrollableScrollPhysics(),
                                            itemCount: 5,
                                            itemBuilder: (context, index) {
                                              // final damage =
                                              //     toothDamage?[index];

                                              return const Text(
                                                // '${damage?['damage']} - ${damage?['tooth']}',
                                                'damage',
                                                style: TextStyle(fontSize: 14),
                                              );
                                            },
                                          ),
                                        ],
                                      ),
                                      const Column(
                                        children: [
                                          Text('Пародонт'),
                                          SizedBox(height: 10),
                                          //Here i need to show all teeth with treatment
                                        ],
                                      ),
                                      const Column(
                                        children: [
                                          Text('Endo'),
                                          SizedBox(height: 10),
                                          //Here i need to show all teeth with endo
                                        ],
                                      ),
                                    ],
                                  ),
                                  const Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      Column(
                                        children: [
                                          Text('Конструкції'),
                                          SizedBox(height: 10),
                                          //Here i need to show all teeth with constructions
                                        ],
                                      ),
                                      Column(
                                        children: [
                                          Text('Інше'),
                                          SizedBox(height: 10),
                                          //Here i need to show all teeth with other
                                        ],
                                      )
                                    ],
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20, vertical: 20),
                          margin: const EdgeInsets.only(
                              left: 0, right: 20, top: 20, bottom: 0),
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
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  const Image(
                                    image: AssetImage(
                                      "assets/images/tooth2.png",
                                    ),
                                    height: 50,
                                    width: 50,
                                  ),
                                  const SizedBox(width: 10),
                                  Text(
                                    'Зуб № $selectedTooth',
                                    style: const TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 20),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    'Тип зуба',
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  const SizedBox(height: 10),
                                  CustomDropdown(
                                    items: const [
                                      'Постійний',
                                      'Молочний',
                                      'Відсутній зуб',
                                      'Корінь зуба'
                                    ],
                                    controller: toothTypeController,
                                    hintText: 'Виберіть тип зуба',
                                  ),
                                  const SizedBox(height: 20),
                                  const Text(
                                    'Ураження',
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  const SizedBox(height: 10),
                                  Row(
                                    children: [
                                      Expanded(
                                        child: CustomDropdown(
                                          items: const [
                                            'Фісурна пігментація',
                                            'Карієс',
                                            'Пришийковий карієс',
                                            'Клиновидний дефект'
                                          ],
                                          controller: toothDamageController,
                                          hintText: 'Виберіть ураження',
                                        ),
                                      ),
                                      IconButton(
                                        onPressed: () {
                                          setState(() {
                                            if (toothDamageController
                                                .text.isNotEmpty) {
                                              toothDamage?.add({
                                                'damage':
                                                    toothDamageController.text,
                                                'tooth':
                                                    selectedTooth.toString(),
                                              });
                                            }
                                            toothDamageController.text = '';
                                          });
                                        },
                                        icon: const Icon(Icons.add),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 20),
                                  const Text(
                                    'Пародонт',
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  const SizedBox(height: 10),
                                  Row(
                                    children: [
                                      Expanded(
                                        child: CustomDropdown(
                                          items: const [
                                            'Здоровий пародонт',
                                            'Весь здоровий',
                                            'Пародонтит 1ст',
                                            'Пародонтит 2ст',
                                            'Пародонтит 3ст',
                                            'Весь 1ст',
                                            'Весь 2ст',
                                            'Весь 3ст',
                                            'Відсутній запальний процес',
                                            'Запалені ясна',
                                            'Значно запалені ясна',
                                            'Зубний камінь 1ст',
                                            'Зубний камінь 2ст'
                                          ],
                                          controller: toothParodontController,
                                          hintText: 'Виберіть пародонт',
                                          selectedStyle: const TextStyle(
                                            color: Colors.red,
                                          ),
                                        ),
                                      ),
                                      IconButton(
                                        onPressed: () {
                                          setState(() {
                                            if (toothParodontController
                                                .text.isNotEmpty) {
                                              toothParodont?.add({
                                                'parodont':
                                                    toothParodontController
                                                        .text,
                                                'tooth':
                                                    selectedTooth.toString(),
                                              });
                                            }
                                            toothParodontController.text = '';
                                          });
                                        },
                                        icon: const Icon(Icons.add),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 20),
                                  const Text(
                                    'Endo',
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  const SizedBox(height: 10),
                                  Row(
                                    children: [
                                      Expanded(
                                        child: CustomDropdown(
                                          items: const [
                                            'Пульпіт',
                                            'Канал не запломбований',
                                            'Канал запломбований до верхівки',
                                            'Канал частково запломбований',
                                            'Періодонтит 3мм',
                                            'Періодонтит 3-5мм',
                                            'Періодонтит 5мм',
                                          ],
                                          controller: toothEndoController,
                                          hintText: 'Endo',
                                        ),
                                      ),
                                      IconButton(
                                        onPressed: () {
                                          setState(() {
                                            if (toothEndoController
                                                .text.isNotEmpty) {
                                              toothEndo?.add(
                                                {
                                                  'endo':
                                                      toothEndoController.text,
                                                  'tooth':
                                                      selectedTooth.toString(),
                                                },
                                              );
                                            }
                                            toothEndoController.text = '';
                                          });
                                        },
                                        icon: const Icon(Icons.add),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 20),
                                  const Text(
                                    'Конструкції',
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  const SizedBox(height: 10),
                                  Row(
                                    children: [
                                      Expanded(
                                        child: CustomDropdown(
                                          items: const [
                                            'Пломба',
                                            'Пришийкова пломба',
                                            'Вінір',
                                            'Тимчасова коронка',
                                            'Коронка керамічна',
                                            'Коронка металокерамічна',
                                            'Коронка металева',
                                            'Цирконієва коронка',
                                            'Штифт',
                                            'Культова вкладка',
                                            'Абатмент',
                                            'Формувач',
                                            'Імплант'
                                          ],
                                          controller:
                                              toothConstructionsController,
                                          hintText: 'Виберіть конструкції',
                                        ),
                                      ),
                                      IconButton(
                                        onPressed: () {
                                          setState(() {
                                            if (toothConstructionsController
                                                .text.isNotEmpty) {
                                              toothConstructions?.add(
                                                {
                                                  'constructions':
                                                      toothConstructionsController
                                                          .text,
                                                  'tooth':
                                                      selectedTooth.toString(),
                                                },
                                              );
                                            }
                                            toothConstructionsController.text =
                                                '';
                                          });
                                        },
                                        icon: const Icon(Icons.add),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 20),
                                  const Column(
                                    children: [
                                      Row(
                                        children: [
                                          FormButton(
                                            text: 'Зберегти',
                                            color: AppColors.mainBlueColor,
                                            horizontalEI: 20,
                                            verticalEI: 10,
                                          ),
                                        ],
                                      ),
                                    ],
                                  )
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class ToothData {
  final int number;
  final String imagePath;

  const ToothData({
    required this.number,
    required this.imagePath,
  });
}
