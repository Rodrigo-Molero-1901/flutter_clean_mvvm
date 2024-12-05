import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';

import 'src/app/features/landing/presentation/view/landing_page.dart';
import 'src/app/features/notes/presentation/view/notes_page.dart';
import 'src/app/features/profile/presentation/view/profile_page.dart';
import 'src/core/di/injection.dart';
import 'src/core/l10n/app_l10n.dart';
import 'src/core/router/page_routes.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitDown,
    DeviceOrientation.portraitUp,
  ]);
  await configureModuleDependencies();
  runApp(const FlutterCleanMVVM());
}

class FlutterCleanMVVM extends StatefulWidget {
  const FlutterCleanMVVM({super.key});

  @override
  State<FlutterCleanMVVM> createState() => _FlutterCleanMVVMState();
}

class _FlutterCleanMVVMState extends State<FlutterCleanMVVM> {
  final GoRouter _router = GoRouter(
    initialLocation: PageRoutes.pathLandingPage,
    routes: [
      GoRoute(
        path: PageRoutes.pathLandingPage,
        builder: (context, state) {
          return injector<LandingPage>();
        },
      ),
      GoRoute(
        path: PageRoutes.pathNotesPage,
        builder: (context, state) {
          return injector<NotesPage>();
        },
      ),
      GoRoute(
        path: PageRoutes.pathProfilePage,
        builder: (context, state) {
          return injector<ProfilePage>();
        },
      ),
    ],
  );

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Proyecto Flutter con Arquitectura Limpia y MVVM',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      supportedLocales: AppLocalizations.supportedLocales,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      routerConfig: _router,
    );
  }
}
