import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_generic_app/data/blocs/auth/index.dart';
import 'package:flutter_generic_app/data/repositories/auth_repository.dart';
import 'package:flutter_generic_app/di/injection.dart';
import 'package:flutter_generic_app/domain/services/index.dart';
import 'package:flutter_generic_app/ui/theme.dart';
import 'package:flutter_generic_app/ui/pages/home/home_page.dart';
import 'package:flutter_generic_app/ui/pages/login/login_page.dart';
import 'package:flutter_generic_app/ui/pages/splash/splash_page.dart';

class App extends StatelessWidget {
  const App({
    Key? key,
    required this.authenticationRepository,
  }) : super(key: key);

  final AuthRepository authenticationRepository;

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider.value(
      value: authenticationRepository,
      child: BlocProvider(
        create: (_) => AuthBloc(
          authRepository: authenticationRepository,
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
  final _analyticsSrv = getIt<IAnalyticsService>();

  // ThemeData theme;
  // ThemeData darkTheme;
  NavigatorState? get _navigator => _navigatorKey.currentState;

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    setState(() {
      switch (state) {
        case AppLifecycleState.resumed:
          _analyticsSrv.track(Events.appOnResumed);
          break;
        case AppLifecycleState.inactive:
          _analyticsSrv.track(Events.appOnInactive);
          break;
        case AppLifecycleState.paused:
          _analyticsSrv.track(Events.appOnPaused);
          break;
        case AppLifecycleState.detached:
          _analyticsSrv.track(Events.appOnDetached);
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
        return BlocListener<AuthBloc, AuthState>(
          listener: (context, state) {
            switch (state.status) {
              case AuthStatus.authenticated:
                _navigator?.pushAndRemoveUntil<void>(
                  HomePage.route(),
                  (route) => false,
                );
                break;
              case AuthStatus.unauthenticated:
                _navigator?.pushAndRemoveUntil<void>(
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
