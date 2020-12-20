import 'package:adjust_sdk/adjust.dart';
import 'package:authentication_repository/authentication_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_generic_app/services/services.dart';
import 'package:flutter_generic_app/theme.dart';
import 'package:flutter_generic_app/ui/home/home.dart';
import 'package:flutter_generic_app/ui/login/login.dart';
import 'package:flutter_generic_app/ui/splash/splash.dart';

import 'blocs/authentication/authentication.dart';
import 'locator.dart';

class App extends StatelessWidget {
  const App({
    Key key,
    @required this.authenticationRepository,
  })  : assert(authenticationRepository != null),
        super(key: key);

  final AuthenticationRepository authenticationRepository;

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider.value(
      value: authenticationRepository,
      child: BlocProvider(
        create: (_) => AuthenticationBloc(
          authenticationRepository: authenticationRepository,
        ),
        child: AppView(),
      ),
    );
  }
}

class AppView extends StatefulWidget {
  @override
  _AppViewState createState() => _AppViewState();
}

class _AppViewState extends State<AppView> with WidgetsBindingObserver {
  final _navigatorKey = GlobalKey<NavigatorState>();
  final _prefs = locator<PreferencesService>();
  final _analyticsSrv = locator<AnalyticsService>();

  // ThemeData theme;
  // ThemeData darkTheme;
  NavigatorState get _navigator => _navigatorKey.currentState;

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    setState(() {
      switch (state) {
        case AppLifecycleState.resumed:
          Adjust.onResume();
          _analyticsSrv.track(Events.appToForeground);
          break;
        case AppLifecycleState.inactive:
          // TODO: Handle this case.
          break;
        case AppLifecycleState.paused:
          Adjust.onPause();
          break;
        case AppLifecycleState.detached:
          // TODO: Handle this case.
          break;
      }
    });
  }


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: theme,
      navigatorKey: _navigatorKey,
      builder: (context, child) {
        return BlocListener<AuthenticationBloc, AuthenticationState>(
          listener: (context, state) {
            switch (state.status) {
              case AuthenticationStatus.authenticated:
                _navigator.pushAndRemoveUntil<void>(
                  HomePage.route(),
                  (route) => false,
                );
                break;
              case AuthenticationStatus.unauthenticated:
                _navigator.pushAndRemoveUntil<void>(
                  LoginPage.route(),
                  (route) => false,
                );
                break;
              default:
                break;
            }
          },
          child: child,
        );
      },
      onGenerateRoute: (_) => SplashPage.route(),
    );
  }
}
