import 'package:conduit_application/cubit/auth_cubit_cubit.dart';
import 'package:conduit_application/view/log_in.dart';
import 'package:conduit_application/view/main_page.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthCubit(Dio()),
      child: MaterialApp(
        routes: {
          PageMain.routeName: (context) => const PageMain(),
        },
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.orange.shade400),
          useMaterial3: true,
        ),
        home: const PageLogIn(),
      ),
    );
  }
}
