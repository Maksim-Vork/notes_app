import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes/core/theme/app_colors.dart';
import 'package:notes/feauters/auntification/presentation/bloc/auth_bloc.dart';
import 'package:notes/feauters/auntification/presentation/bloc/auth_event.dart';
import 'package:notes/feauters/auntification/presentation/bloc/auth_state.dart';
import 'package:notes/feauters/auntification/presentation/screen/register_screen.dart';
import 'package:notes/home_page.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _controllerEmail = TextEditingController();
  final TextEditingController _controllerPassword = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthBloc, AuthState>(builder: (context, state) {
      if (state is InitialAuthState) {
        return Scaffold(
          backgroundColor: AppColors.backGroundColor,
          body: SingleChildScrollView(
            child: Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 107,
                  ),
                  Icon(
                    Icons.message,
                    size: 117,
                    color: Colors.white,
                  ),
                  SizedBox(
                    height: 24,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Добро пожаловать в',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'приложение заметок !',
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
                          BlocProvider.of<AuthBloc>(context).add(LoginAuthEvent(
                              email: _controllerEmail.text,
                              password: _controllerPassword.text));
                        },
                        child: Text(
                          'Войти',
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
                        'Еще нет аккаунта?',
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
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (_) => RegisterScreen()));
                        },
                        child: Text(
                          'Зарегестироваться.',
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
      } else if (state is LoadingAuthState) {
        return Center(
          child: CircularProgressIndicator(),
        );
      } else if (state is SuccefulAuthState) {
        return HomePage();
      } else if (state is ErrorAuthState) {
        return Center(
          child: Text(state.error),
        );
      } else {
        return Center(
          child: Text('Перезапустите приложение'),
        );
      }
    });
  }
}
