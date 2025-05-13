import 'package:bloc_tutorial/login_signup_bloc/bloc/Login/login_bloc.dart';
import 'package:bloc_tutorial/login_signup_bloc/ui/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => LoginBloc(),)
      ],
      child: MaterialApp(
        title: 'Material App',
        home: LoginScreen()
      ),
    );
  }
}
