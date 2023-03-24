import 'package:conduit_application/cubit/auth_cubit_cubit.dart';
import 'package:conduit_application/model/user.dart';
import 'package:conduit_application/view/main_page.dart';
import 'package:conduit_application/view/sign_up.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PageLogIn extends StatefulWidget {
  const PageLogIn({super.key});

  @override
  State<PageLogIn> createState() => _PageLogInState();
}

class _PageLogInState extends State<PageLogIn> {
  TextEditingController txtPassword = TextEditingController();
  TextEditingController txtLogin = TextEditingController();
  TextEditingController txtUserName = TextEditingController();
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
                    hintText: 'Имя пользователя',
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
                    hintText: 'Пароль',
                  ),
                ),
              ),
              Container(
                  margin: const EdgeInsets.only(top: 10),
                  width: skWidth * 0.5,
                  child: ElevatedButton(
                    child: const Text("Войти"),
                    onPressed: () async {
                      User user = User(
                        id: 0,
                        userName: txtUserName.text,
                        email: txtLogin.text,
                        password: txtPassword.text,
                      );

                      User result =
                          await context.read<AuthCubit>().SignIn(user);

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
                  )),
              // Container(
              //     margin: const EdgeInsets.only(top: 10),
              //     width: skWidth * 0.5,
              //     child: ElevatedButton(
              //       child: const Text("Войти"),
              //       onPressed: () {
              //         // User usr = await context.read<AuthCubit>().SignIn(User(
              //         //       id: 0,
              //         //       userName: txtUserName.text,
              //         //       email: txtLogin.text,
              //         //       password: txtPassword.text,
              //         //     ));
              //         FutureBuilder<User>(
              //           future: context.read<AuthCubit>().SignIn(User(
              //                 id: 0,
              //                 userName: txtUserName.text,
              //                 email: txtLogin.text,
              //                 password: txtPassword.text,
              //               )),
              //           builder: (BuildContext context,AsyncSnapshot<User> snapshot) {
              //             if (snapshot.hasData && context.read<AuthCubit>().state is SuccesState){
              //               Navigator.pushNamed(
              //               context,
              //               PageMain.routeName,
              //               arguments: snapshot.data,
              //             );
              //             }
              //             else if (snapshot.hasError) {
              //               return const Center(child: CircularProgressIndicator());
              //             }
              //             else {
              //               return const Center(child: CircularProgressIndicator());
              //             }
              //             return const Center(child: CircularProgressIndicator());
              //           },
              //         );
              //         // if (context.read<AuthCubit>().state is SuccesState)
              //         //   {
              //             // Navigator.pushNamed(
              //             //   context,
              //             //   PageMain.routeName,
              //             //   arguments:
              //             // )
              //         //     // Navigator.of(context).push(MaterialPageRoute(
              //         //     //     builder: (context) => const PageMain())),
              //         //   },
              //       },
              //     )),
              Container(
                child: GestureDetector(
                  child: const Text(
                    "Зарегистрироваться",
                    style: TextStyle(decoration: TextDecoration.underline),
                  ),
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const PageSignUp()));
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
