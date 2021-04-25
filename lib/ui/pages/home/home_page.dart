import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_generic_app/core/blocs/language_bloc.dart';
import 'package:flutter_generic_app/data/blocs/auth/index.dart';
import 'package:flutter_generic_app/domain/entities/user/user_sealed.dart';
import 'package:flutter_generic_app/localizations/app_localizations.dart';
import 'package:flutter_generic_app/localizations/enums.dart';

class HomePage extends StatelessWidget {
  static String routeName() => 'HomePage';
  static Route route() {
    return MaterialPageRoute<void>(builder: (_) => HomePage());
  }

  @override
  Widget build(BuildContext context) {
    User user = User.autorizado(name: 'Pepe', tieneAutorizacion: true);

    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.translate('home')),
        actions: [
          DropdownButton<Language>(
            value: BlocProvider.of<LanguageBloc>(context).state.language,
            icon: Icon(Icons.arrow_downward),
            iconSize: 24,
            elevation: 16,
            onChanged: (language) {
              BlocProvider.of<LanguageBloc>(context).add(LanguageSelected(language as Language));
            },
            items: <Language>[Language.EN, Language.ES, Language.CA].map<DropdownMenuItem<Language>>((Language value) {
              return DropdownMenuItem<Language>(
                value: value,
                child: Text(AppLocalizations.of(context)!.translate(value.toString())),
              );
            }).toList(),
          )
        ],
      ),
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
                familia: (familia, es) => ' Eres familia ${familia}',
                monitor: (monitor) => 'Eres monitor ${monitor}',
                autorizado: (autorizado, atorizado) => 'Eres autorizado ${autorizado}',
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
