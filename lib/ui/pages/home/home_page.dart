import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_generic_app/data/blocs/auth/index.dart';
import 'package:flutter_generic_app/domain/entities/user/user_sealed.dart';

class HomePage extends StatelessWidget {
  static String routeName() => 'HomePage';
  static Route route() {
    return MaterialPageRoute<void>(builder: (_) => HomePage());
  }

  @override
  Widget build(BuildContext context) {
    User user = User.autorizado(name: 'Pepe');

    return Scaffold(
      appBar: AppBar(title: const Text('Home')),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Builder(
              builder: (context) {
                final userId = context.select(
                  (AuthBloc bloc) => bloc.state.user.id,
                );
                return Text('UserID: $userId');
              },
            ),
            Text(
              user.when(
                familia: (familia) => ' Eres familia ${familia}',
                monitor: (monitor) => 'Eres monitor ${monitor}',
                autorizado: (autorizado) => 'Eres autorizado ${autorizado}',
              ),
            ),
            TextButton(
              onPressed: () {
                context.read<AuthBloc>().add(AuthenticationLogoutRequested());
              },
              child: const Text('Logout'),
            ),
          ],
        ),
      ),
    );
  }
}
