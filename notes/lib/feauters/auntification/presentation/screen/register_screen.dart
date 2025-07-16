import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes/core/theme/app_colors.dart';
import 'package:notes/feauters/auntification/presentation/bloc/auth_bloc.dart';
import 'package:notes/feauters/auntification/presentation/bloc/auth_event.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final TextEditingController _controllerEmail = TextEditingController();
  final TextEditingController _controllerPassword = TextEditingController();
  final TextEditingController _controllerRepeatPassword =
      TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backGroundColor,
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: 200,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Регистрация',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              SizedBox(
                height: 70,
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 25),
                decoration: BoxDecoration(
                    color: Color(0xFFCCCCCC),
                    borderRadius: BorderRadius.circular(18)),
                child: Padding(
                  padding: EdgeInsetsGeometry.only(left: 10),
                  child: TextField(
                    controller: _controllerEmail,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Почта',
                      hintStyle: TextStyle(
                          color: AppColors.backGroundColor,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 17,
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 25),
                decoration: BoxDecoration(
                    color: Color(0xFFCCCCCC),
                    borderRadius: BorderRadius.circular(18)),
                child: Padding(
                  padding: EdgeInsetsGeometry.only(left: 10),
                  child: TextField(
                    controller: _controllerPassword,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Пороль',
                      hintStyle: TextStyle(
                          color: AppColors.backGroundColor,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 17,
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 25),
                decoration: BoxDecoration(
                    color: Color(0xFFCCCCCC),
                    borderRadius: BorderRadius.circular(18)),
                child: Padding(
                  padding: EdgeInsetsGeometry.only(left: 10),
                  child: TextField(
                    controller: _controllerRepeatPassword,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Повторите пороль',
                      hintStyle: TextStyle(
                          color: AppColors.backGroundColor,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 50,
              ),
              SizedBox(
                height: 53,
                width: 339,
                child: ElevatedButton(
                    style: ButtonStyle(
                        shape: WidgetStateProperty.all(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                        backgroundColor: WidgetStateProperty.all(
                            AppColors.floatingActionButtonColor)),
                    onPressed: () {
                      BlocProvider.of<AuthBloc>(context).add(RegisterAuthEvent(
                          email: _controllerEmail.text,
                          password: _controllerPassword.text));
                      Navigator.pop(context);
                    },
                    child: Text(
                      'Зарегистрироваться',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    )),
              ),
              SizedBox(
                height: 21,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Уже есть аккаунт?',
                    style: TextStyle(
                        color: const Color.fromARGB(255, 255, 255, 255),
                        fontSize: 14,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Text(
                      'Войти.',
                      style: TextStyle(
                          color: AppColors.floatingActionButtonColor,
                          fontSize: 14,
                          fontWeight: FontWeight.bold),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
