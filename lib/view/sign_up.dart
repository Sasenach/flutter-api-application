import 'package:conduit_application/cubit/auth_cubit_cubit.dart';
import 'package:conduit_application/model/user.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'main_page.dart';

class PageSignUp extends StatefulWidget {
  const PageSignUp({super.key});

  @override
  State<PageSignUp> createState() => _PageSignUpState();
}

TextEditingController txtPassword = TextEditingController();
TextEditingController txtLogin = TextEditingController();
TextEditingController txtUserName = TextEditingController();

class _PageSignUpState extends State<PageSignUp> {
  @override
  Widget build(BuildContext context) {
    final double skWidth = MediaQuery.of(context).size.width;
    final double skHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                padding: const EdgeInsets.all(4),
                decoration: BoxDecoration(
                  border:
                      Border.all(width: 1, color: Colors.deepOrange.shade300),
                  borderRadius: BorderRadius.circular(10),
                ),
                width: skWidth * 0.7,
                height: skHeight * 0.07,
                child: TextField(
                  controller: txtUserName,
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                    hintText: 'Придумайте Никнейм',
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 10),
                padding: const EdgeInsets.all(4),
                decoration: BoxDecoration(
                  border:
                      Border.all(width: 1, color: Colors.deepOrange.shade300),
                  borderRadius: BorderRadius.circular(10),
                ),
                width: skWidth * 0.7,
                height: skHeight * 0.07,
                child: TextField(
                  controller: txtLogin,
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                    hintText: 'Введите Е-маил',
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 10),
                padding: const EdgeInsets.all(4),
                decoration: BoxDecoration(
                  border:
                      Border.all(width: 1, color: Colors.deepOrange.shade300),
                  borderRadius: BorderRadius.circular(10),
                ),
                width: skWidth * 0.7,
                height: skHeight * 0.07,
                child: TextField(
                  controller: txtPassword,
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                    hintText: 'Придумайте пароль входа в систему',
                  ),
                ),
              ),
              Container(
                  margin: const EdgeInsets.only(top: 10),
                  width: skWidth * 0.5,
                  child: ElevatedButton(
                    child: const Text("Регистрация"),
                    onPressed: () async {
                      User user = User(
                        id: 0,
                        userName: txtUserName.text,
                        email: txtLogin.text,
                        password: txtPassword.text,
                      );

                      User result =
                          await context.read<AuthCubit>().SignUp(user);

                      if (result != null &&
                          context.read<AuthCubit>().state is SuccesState) {
                        Navigator.pushNamed(
                          context,
                          PageMain.routeName,
                          arguments: result,
                        );
                      } else {
                        // handle error or show loading indicator
                      }
                    },
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
