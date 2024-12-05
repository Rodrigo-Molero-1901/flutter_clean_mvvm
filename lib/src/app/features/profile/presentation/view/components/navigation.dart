part of '../profile_page.dart';

extension _NavigationExtension on ProfileNavigation {
  void navigate(BuildContext context) {
    switch (this) {
      case ExitNavigation():
        context.pushReplacement(PageRoutes.pathLandingPage);
    }
  }
}
