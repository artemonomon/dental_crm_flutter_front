import 'package:dental_crm_flutter_front/features/user_profile/bloc/user_bloc.dart';
import 'package:dental_crm_flutter_front/features/user_profile/widgets/form_button.dart';
import 'package:dental_crm_flutter_front/features/user_profile/widgets/form_pass_field.dart';
import 'package:dental_crm_flutter_front/features/user_profile/widgets/form_text_field.dart';
import 'package:dental_crm_flutter_front/repositories/user/user_repository.dart';
import 'package:dental_crm_flutter_front/utils/utils.dart';
import 'package:dental_crm_flutter_front/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DesktopProfile extends StatefulWidget {
  const DesktopProfile({super.key});

  @override
  State<DesktopProfile> createState() => _DesktopProfileState();
}

class _DesktopProfileState extends State<DesktopProfile> {
  UserRepository userRepository = UserRepository();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _newPasswordController = TextEditingController();
  final TextEditingController _repPasswordController = TextEditingController();
  bool _isPasswordVisible = false;
  // bool _isNewPasswordVisible = false;
  bool _isRepeatPasswordVisible = false;
  late UserBloc _userBloc;
  String _name = ' ';
  String _email = ' ';

  @override
  void initState() {
    super.initState();
    _userBloc = UserBloc(UserRepository());
    _userBloc.add(FetchUserEvent());
  }

  @override
  void dispose() {
    _userBloc.close();
    _nameController.dispose();
    _passwordController.dispose();
    _newPasswordController.dispose();
    _repPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Row(
        children: [
          const SideMenu(),
          BlocBuilder<UserBloc, UserState>(
            bloc: _userBloc,
            builder: (context, state) {
              if (state is UserLoadignState) {
                return Expanded(
                  child: Container(
                    color: Colors.white,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: const [
                        SizedBox(
                          height: 25,
                          width: 25,
                          child: CircularProgressIndicator(
                            valueColor: AlwaysStoppedAnimation<Color>(
                                AppColors.mainBlueColor),
                            strokeWidth: 5.0,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              } else if (state is UserLoadedState) {
                _name = state.user.name;
                _email = state.user.email;
                return userPage();
              } else if (state is UserErrorState) {
                return Center(
                  child: Text(state.error),
                );
              } else {
                return const Center(
                  child: Text('Something went wrong!'),
                );
              }
            },
          )
        ],
      ),
    );
  }

  Expanded userPage() {
    return Expanded(
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
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
                  Container(
                    padding: const EdgeInsets.only(bottom: 20),
                    child: const Text(
                      'Інформація про аккаунт',
                      style:
                          TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        margin: const EdgeInsets.only(left: 20, top: 10),
                        width: 100,
                        height: 100,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(
                            fit: BoxFit.cover,
                            image: AssetImage('assets/images/profile2.png'),
                          ),
                        ),
                      ),
                      const SizedBox(width: 20),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Ім\'я: $_name',
                            style: const TextStyle(fontSize: 20),
                          ),
                          const SizedBox(height: 10),
                          Text(
                            "Пошта: $_email",
                            style: const TextStyle(fontSize: 16),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Container(
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
                  Container(
                    padding: const EdgeInsets.only(bottom: 20),
                    child: const Text(
                      'Змінити ім\'я',
                      style:
                          TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                  ),
                  FormTextField(
                    controller: _nameController,
                    hintText: 'Введіть нове ім\'я',
                    icon: const Icon(Icons.person, color: Colors.black),
                    obscureText: false,
                  ),
                  const SizedBox(height: 20),
                  FormButton(
                    text: "Зберегти зміни",
                    color: AppColors.mainBlueColor,
                    onTap: () {},
                  )
                ],
              ),
            ),
            Container(
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
                  Container(
                    padding: const EdgeInsets.only(bottom: 20),
                    child: const Text(
                      'Змінити пароль',
                      style:
                          TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                  ),
                  FormPasswordField(
                    controller: _passwordController,
                    hintText: 'Ваш поточний пароль',
                    prefixIcon: const Icon(Icons.lock),
                    suffixIcon: GestureDetector(
                      onTap: () {
                        setState(() {
                          _isPasswordVisible =
                              !_isPasswordVisible; // Toggle the visibility state
                        });
                      },
                      child: Icon(
                        _isPasswordVisible
                            ? Icons.visibility_off
                            : Icons.visibility,
                      ),
                    ),
                    obscureText: !_isPasswordVisible,
                  ),
                  const SizedBox(height: 20),
                  Row(
                    children: [
                      Expanded(
                        child: FormPasswordField(
                          controller: _newPasswordController,
                          hintText: 'Ваш новий пароль',
                          prefixIcon: const Icon(Icons.lock),
                          suffixIcon: GestureDetector(
                            child: Icon(
                              _isRepeatPasswordVisible
                                  ? Icons.visibility_off
                                  : Icons.visibility,
                              color: Colors.transparent,
                            ),
                          ),
                          obscureText: !_isRepeatPasswordVisible,
                        ),
                      ),
                      const SizedBox(width: 20),
                      Expanded(
                        child: FormPasswordField(
                          controller: _repPasswordController,
                          hintText: 'Повторіть пароль',
                          prefixIcon: const Icon(Icons.lock),
                          suffixIcon: GestureDetector(
                            onTap: () {
                              setState(() {
                                _isRepeatPasswordVisible =
                                    !_isRepeatPasswordVisible; // Toggle the visibility state
                              });
                            },
                            child: Icon(
                              _isRepeatPasswordVisible
                                  ? Icons.visibility_off
                                  : Icons.visibility,
                            ),
                          ),
                          obscureText: !_isRepeatPasswordVisible,
                        ),
                      )
                    ],
                  ),
                  const SizedBox(height: 20),
                  FormButton(
                    text: "Зберегти зміни",
                    color: AppColors.mainBlueColor,
                    onTap: () {},
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
