import 'package:dental_crm_flutter_front/features/auth/widgets/widgets.dart';
import 'package:dental_crm_flutter_front/utils/utils.dart';
import 'package:dental_crm_flutter_front/widgets/widgets.dart';
import 'package:flutter/material.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
        backgroundColor: AppColors.backColor,
        body: SizedBox(
          height: height,
          width: width,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              ResponsiveWidget.isSmallScreen(context)
                  ? const SizedBox()
                  : Expanded(
                      child: Container(
                        height: height,
                        color: AppColors.mainBlueColor,
                        child: Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Стоматологічний кабінет',
                                style: AppStyles.ralewayStyle.copyWith(
                                    fontSize: 48.0,
                                    color: AppColors.whiteColor,
                                    fontWeight: FontWeight.w800),
                              ),
                              Text(
                                'Дентас',
                                style: AppStyles.ralewayStyle.copyWith(
                                    fontSize: 48.0,
                                    color: AppColors.whiteColor,
                                    fontWeight: FontWeight.w800),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
              Expanded(
                child: SingleChildScrollView(
                  child: Container(
                    height: height,
                    margin: EdgeInsets.symmetric(
                        horizontal: ResponsiveWidget.isSmallScreen(context)
                            ? height * 0.032
                            : height * 0.12),
                    color: AppColors.backColor,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SizedBox(
                            height: ResponsiveWidget.isSmallScreen(context)
                                ? height * 0.13
                                : height * 0.18),
                        RichText(
                          text: TextSpan(
                            children: [
                              TextSpan(
                                text: 'Зареєструйтеся до',
                                style: AppStyles.ralewayStyle.copyWith(
                                    fontSize: 35.0,
                                    color: AppColors.blueDarkColor,
                                    fontWeight: FontWeight.normal),
                              ),
                              TextSpan(
                                  text: ' особистого кабінету',
                                  style: AppStyles.ralewayStyle.copyWith(
                                      fontSize: 35.0,
                                      color: AppColors.blueDarkColor,
                                      fontWeight: FontWeight.w800))
                            ],
                          ),
                        ),
                        SizedBox(height: height * 0.02),
                        Text(
                          ResponsiveWidget.isSmallScreen(context)
                              ? 'Введіть пошту та ваш пароль для того, щоб зайти до особистого кабінету'
                              : 'Введіть ваше ім\'я, пошту та ваш пароль для того, \nщоб зареєструватися до особистого кабінету',
                          style: AppStyles.ralewayStyle.copyWith(
                            fontSize: 18.0,
                            fontWeight: FontWeight.w400,
                            color: AppColors.textColor,
                          ),
                        ),
                        SizedBox(height: height * 0.02),
                        Row(
                          children: [
                            Text(
                              'Вже зареєстровані?',
                              style: AppStyles.ralewayStyle.copyWith(
                                fontSize: 18.0,
                                fontWeight: FontWeight.w400,
                                color: AppColors.textColor,
                              ),
                            ),
                            TextButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              child: Text(
                                'Увійти в особистий кабінет',
                                style: AppStyles.ralewayStyle.copyWith(
                                  fontSize: 18.0,
                                  color: AppColors.mainBlueColor,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: height * 0.064),
                        Padding(
                          padding:
                              const EdgeInsets.only(left: 20.0, bottom: 10.0),
                          child: Text(
                            'Ваше ім\'я',
                            style: AppStyles.ralewayStyle.copyWith(
                              fontSize: 18.0,
                              fontWeight: FontWeight.w700,
                              color: AppColors.textColor,
                            ),
                          ),
                        ),
                        FormTextField(
                          height: height,
                          width: width,
                          hintText: 'Ім\'я',
                          icon: const Icon(Icons.account_box_outlined),
                        ),
                        SizedBox(height: height * 0.015),
                        Padding(
                          padding:
                              const EdgeInsets.only(left: 20.0, bottom: 10.0),
                          child: Text(
                            'Е-пошта',
                            style: AppStyles.ralewayStyle.copyWith(
                              fontSize: 18.0,
                              fontWeight: FontWeight.w700,
                              color: AppColors.textColor,
                            ),
                          ),
                        ),
                        FormTextField(
                          height: height,
                          width: width,
                          hintText: 'Е-пошта',
                          icon: const Icon(Icons.email_outlined),
                        ),
                        SizedBox(height: height * 0.015),
                        Padding(
                          padding:
                              const EdgeInsets.only(left: 20.0, bottom: 10.0),
                          child: Text(
                            'Пароль',
                            style: AppStyles.ralewayStyle.copyWith(
                              fontSize: 18.0,
                              fontWeight: FontWeight.w700,
                              color: AppColors.textColor,
                            ),
                          ),
                        ),
                        FormPasswordField(
                          height: height,
                          width: width,
                          hintText: 'Пароль',
                          prefixIcon: const Icon(Icons.lock),
                          suffixIcon: const Icon(Icons.remove_red_eye_outlined),
                        ),
                        SizedBox(height: height * 0.015),
                        Align(
                          alignment: Alignment.centerRight,
                          child: TextButton(
                            onPressed: () {},
                            child: Text(
                              'Забули пароль?',
                              style: AppStyles.ralewayStyle.copyWith(
                                fontSize: 18.0,
                                color: AppColors.mainBlueColor,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: height * 0.05),
                        const AuthButton(
                          text: 'Увійти',
                          color: AppColors.mainBlueColor,
                        )
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ));
  }
}
