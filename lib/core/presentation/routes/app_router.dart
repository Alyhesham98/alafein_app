import 'package:auto_route/auto_route.dart';
import 'app_router.gr.dart';

@AutoRouterConfig()
class AppRouter extends $AppRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(page: SplashRoute.page, path: '/', initial: true),
        AutoRoute(page: OnboardingRoute.page, path: '/onboarding'),
        AutoRoute(page: LoginRoute.page, path: '/sign-in'),
        AutoRoute(page: SignupRoute.page, path: '/sign-up'),
        AutoRoute(
            page: SignupTypeSelectorRoute.page, path: '/sign-up-selector'),
        AutoRoute(
            page: SignupEventHostVenueRoute.page,
            path: '/sign-up-event-host-venue'),
        AutoRoute(page: EventOrganiserRoute.page, path: '/event-organiser',),
        AutoRoute(page: SignupAudienceRoute.page, path: '/sign-up-audience'),
        AutoRoute(page: YouAreAllSetRoute.page, path: '/you-are-all-set'),
        AutoRoute(page: HomeRoute.page, path: '/home'),
        AutoRoute(page: MainRoute.page, path: '/main'),
        AutoRoute(
            page: SignupVenueBranchRoute.page, path: '/signup-venue-branch'),
        AutoRoute(page: CreateEventRoute.page, path: '/create_event_route'),
        AutoRoute(page: EventDeatilsPage.page, path: '/event_details_route/:id'),
      ];

}

class AppRouterSingleton {
  static final AppRouterSingleton _instance = AppRouterSingleton._internal();
  late final AppRouter appRouter;

  factory AppRouterSingleton() {
    return _instance;
  }
  AppRouterSingleton._internal() {
    appRouter = AppRouter();
  }
}
