import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_generic_app/data/blocs/login/index.dart';
import 'package:flutter_generic_app/data/repositories/auth_repository.dart';

import 'widgets/login_form.dart';

class LoginPage extends StatelessWidget {
  static Route route() {
    return MaterialPageRoute<void>(builder: (_) => LoginPage());
  }

  @override
  Widget build(BuildContext context) {
    //FirebaseCrashlytics.instance.crash();
    return Scaffold(
      appBar: AppBar(title: const Text('Login')),
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: BlocProvider(
          create: (context) {
            return LoginBloc(
              authRepository:
                  RepositoryProvider.of<AuthRepository>(context),
            );
          },
          child: LoginForm(),
        ),
      ),
    );
  }
}
