import 'package:bloc_tutorial/login_signup_bloc/bloc/Login/login_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late LoginBloc _loginBloc;
  final emailFocusNode = FocusNode();
  final passwordFocusNode = FocusNode();

  @override
  void initState() {
    _loginBloc = LoginBloc();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Login')),
      body: BlocProvider(
        create: (context) => _loginBloc,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Flexible(
                child: BlocBuilder<LoginBloc, LoginState>(
                  buildWhen:
                      (previous, current) => current.email != previous.email,
                  builder: (context, state) {
                    return TextFormField(
                      keyboardType: TextInputType.emailAddress,
                      focusNode: emailFocusNode,
                      decoration: InputDecoration(
                        hintText: 'Email',
                        border: OutlineInputBorder(),
                      ),
                      onChanged: (value) {
                        context.read<LoginBloc>().add(
                          EmailChanged(email: value),
                        );
                      },
                      onFieldSubmitted: (value) {},
                    );
                  },
                ),
              ),
              SizedBox(height: 20),
              Flexible(
                child: BlocBuilder<LoginBloc, LoginState>(
                  buildWhen: (previous, current) =>
                  current.password != previous.password,
                  builder: (context, state) {
                    return TextFormField(
                      keyboardType: TextInputType.text,
                      focusNode: passwordFocusNode,
                      decoration: InputDecoration(
                        hintText: 'Password',
                        border: OutlineInputBorder(),
                      ),
                      onChanged: (value) {
                        context.read<LoginBloc>().add(
                            PasswordChanged(password: value)
                        );
                      },
                      onFieldSubmitted: (value) {},
                    );
                  },
                ),
              ),
              SizedBox(height: 50),
              BlocListener<LoginBloc, LoginState>(
                listener: (context, state) {
                  if(state.loginStatus == LoginStatus.error){
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(state.message.toString())));
                  }
                  if(state.loginStatus == LoginStatus.loading){
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('.....Submitting')));
                  }
                  if(state.loginStatus == LoginStatus.success){
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Login Success')));
                  }
                },
                child: BlocBuilder<LoginBloc, LoginState>(
                  buildWhen: (previous, current) => false,
                  builder: (context, state) {
                    return ElevatedButton(onPressed: () {
                      context.read<LoginBloc>().add(LoginApi());
                    }, child: Text('Login'));
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
