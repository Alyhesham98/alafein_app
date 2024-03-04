// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:alafein/core/presentation/onboarding_page.dart' as _i7;
import 'package:alafein/features/auth/login/presentation/login_page.dart'
    as _i5;
import 'package:alafein/features/auth/signup/presentation/signup_page.dart'
    as _i10;
import 'package:alafein/features/auth/signup/presentation/signup_type_selector_page.dart'
    as _i11;
import 'package:alafein/features/auth/signup/presentation/you_are_all_set_page.dart'
    as _i14;
import 'package:alafein/features/auth/signup/signup_audience/signup_audience_page.dart'
    as _i8;
import 'package:alafein/features/auth/signup/signup_event_host/signup_venue/presentation/signup_event_host_venue_page.dart'
    as _i9;
import 'package:alafein/features/auth/signup/signup_event_host/signup_venue/presentation/signup_venue_branch_page.dart'
    as _i12;
import 'package:alafein/features/auth/signup/signup_event_organiser/presentation/event_organiser_page.dart'
    as _i3;
import 'package:alafein/features/create_event/organizer/presentation/create_event_page.dart'
    as _i1;
import 'package:alafein/features/event/organizer/presentation/views/event_deatils.dart'
    as _i2;
import 'package:alafein/features/home/presentation/home_page.dart' as _i4;
import 'package:alafein/features/main/main_screen.dart' as _i6;
import 'package:alafein/features/splash/splash_page.dart' as _i13;
import 'package:auto_route/auto_route.dart' as _i15;
import 'package:flutter/material.dart' as _i16;

abstract class $AppRouter extends _i15.RootStackRouter {
  $AppRouter({super.navigatorKey});

  @override
  final Map<String, _i15.PageFactory> pagesMap = {
    CreateEventRoute.name: (routeData) {
      return _i15.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i1.CreateEventPage(),
      );
    },
    EventDeatilsPage.name: (routeData) {
      final pathParams = routeData.inheritedPathParams;
      final args = routeData.argsAs<EventDeatilsPageArgs>(
          orElse: () => EventDeatilsPageArgs(index: pathParams.getInt('id')));
      return _i15.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i2.EventDeatils(
          key: args.key,
          index: args.index,
        ),
      );
    },
    EventOrganiserRoute.name: (routeData) {
      return _i15.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i3.EventOrganiserPage(),
      );
    },
    HomeRoute.name: (routeData) {
      final args = routeData.argsAs<HomeRouteArgs>();
      return _i15.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i4.HomePage(
          key: args.key,
          onCatTapped: args.onCatTapped,
        ),
      );
    },
    LoginRoute.name: (routeData) {
      return _i15.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i5.LoginPage(),
      );
    },
    MainRoute.name: (routeData) {
      final args =
          routeData.argsAs<MainRouteArgs>(orElse: () => const MainRouteArgs());
      return _i15.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i6.MainScreen(
          key: args.key,
          index: args.index,
        ),
      );
    },
    OnboardingRoute.name: (routeData) {
      final args = routeData.argsAs<OnboardingRouteArgs>();
      return _i15.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i7.OnboardingPage(
          key: args.key,
          route: args.route,
        ),
      );
    },
    SignupAudienceRoute.name: (routeData) {
      return _i15.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i8.SignupAudiencePage(),
      );
    },
    SignupEventHostVenueRoute.name: (routeData) {
      return _i15.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i9.SignupEventHostVenuePage(),
      );
    },
    SignupRoute.name: (routeData) {
      return _i15.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i10.SignupPage(),
      );
    },
    SignupTypeSelectorRoute.name: (routeData) {
      return _i15.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i11.SignupTypeSelectorPage(),
      );
    },
    SignupVenueBranchRoute.name: (routeData) {
      return _i15.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i12.SignupVenueBranchPage(),
      );
    },
    SplashRoute.name: (routeData) {
      return _i15.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i13.SplashPage(),
      );
    },
    YouAreAllSetRoute.name: (routeData) {
      final args = routeData.argsAs<YouAreAllSetRouteArgs>();
      return _i15.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i14.YouAreAllSetPage(
          key: args.key,
          route: args.route,
        ),
      );
    },
  };
}

/// generated route for
/// [_i1.CreateEventPage]
class CreateEventRoute extends _i15.PageRouteInfo<void> {
  const CreateEventRoute({List<_i15.PageRouteInfo>? children})
      : super(
          CreateEventRoute.name,
          initialChildren: children,
        );

  static const String name = 'CreateEventRoute';

  static const _i15.PageInfo<void> page = _i15.PageInfo<void>(name);
}

/// generated route for
/// [_i2.EventDeatils]
class EventDeatilsPage extends _i15.PageRouteInfo<EventDeatilsPageArgs> {
  EventDeatilsPage({
    _i16.Key? key,
    required int index,
    List<_i15.PageRouteInfo>? children,
  }) : super(
          EventDeatilsPage.name,
          args: EventDeatilsPageArgs(
            key: key,
            index: index,
          ),
          rawPathParams: {'id': index},
          initialChildren: children,
        );

  static const String name = 'EventDeatilsPage';

  static const _i15.PageInfo<EventDeatilsPageArgs> page =
      _i15.PageInfo<EventDeatilsPageArgs>(name);
}

class EventDeatilsPageArgs {
  const EventDeatilsPageArgs({
    this.key,
    required this.index,
  });

  final _i16.Key? key;

  final int index;

  @override
  String toString() {
    return 'EventDeatilsPageArgs{key: $key, index: $index}';
  }
}

/// generated route for
/// [_i3.EventOrganiserPage]
class EventOrganiserRoute extends _i15.PageRouteInfo<void> {
  const EventOrganiserRoute({List<_i15.PageRouteInfo>? children})
      : super(
          EventOrganiserRoute.name,
          initialChildren: children,
        );

  static const String name = 'EventOrganiserRoute';

  static const _i15.PageInfo<void> page = _i15.PageInfo<void>(name);
}

/// generated route for
/// [_i4.HomePage]
class HomeRoute extends _i15.PageRouteInfo<HomeRouteArgs> {
  HomeRoute({
    _i16.Key? key,
    required void Function() onCatTapped,
    List<_i15.PageRouteInfo>? children,
  }) : super(
          HomeRoute.name,
          args: HomeRouteArgs(
            key: key,
            onCatTapped: onCatTapped,
          ),
          initialChildren: children,
        );

  static const String name = 'HomeRoute';

  static const _i15.PageInfo<HomeRouteArgs> page =
      _i15.PageInfo<HomeRouteArgs>(name);
}

class HomeRouteArgs {
  const HomeRouteArgs({
    this.key,
    required this.onCatTapped,
  });

  final _i16.Key? key;

  final void Function() onCatTapped;

  @override
  String toString() {
    return 'HomeRouteArgs{key: $key, onCatTapped: $onCatTapped}';
  }
}

/// generated route for
/// [_i5.LoginPage]
class LoginRoute extends _i15.PageRouteInfo<void> {
  const LoginRoute({List<_i15.PageRouteInfo>? children})
      : super(
          LoginRoute.name,
          initialChildren: children,
        );

  static const String name = 'LoginRoute';

  static const _i15.PageInfo<void> page = _i15.PageInfo<void>(name);
}

/// generated route for
/// [_i6.MainScreen]
class MainRoute extends _i15.PageRouteInfo<MainRouteArgs> {
  MainRoute({
    _i16.Key? key,
    int? index = 0,
    List<_i15.PageRouteInfo>? children,
  }) : super(
          MainRoute.name,
          args: MainRouteArgs(
            key: key,
            index: index,
          ),
          initialChildren: children,
        );

  static const String name = 'MainRoute';

  static const _i15.PageInfo<MainRouteArgs> page =
      _i15.PageInfo<MainRouteArgs>(name);
}

class MainRouteArgs {
  const MainRouteArgs({
    this.key,
    this.index = 0,
  });

  final _i16.Key? key;

  final int? index;

  @override
  String toString() {
    return 'MainRouteArgs{key: $key, index: $index}';
  }
}

/// generated route for
/// [_i7.OnboardingPage]
class OnboardingRoute extends _i15.PageRouteInfo<OnboardingRouteArgs> {
  OnboardingRoute({
    _i16.Key? key,
    required _i15.PageRouteInfo<dynamic> route,
    List<_i15.PageRouteInfo>? children,
  }) : super(
          OnboardingRoute.name,
          args: OnboardingRouteArgs(
            key: key,
            route: route,
          ),
          initialChildren: children,
        );

  static const String name = 'OnboardingRoute';

  static const _i15.PageInfo<OnboardingRouteArgs> page =
      _i15.PageInfo<OnboardingRouteArgs>(name);
}

class OnboardingRouteArgs {
  const OnboardingRouteArgs({
    this.key,
    required this.route,
  });

  final _i16.Key? key;

  final _i15.PageRouteInfo<dynamic> route;

  @override
  String toString() {
    return 'OnboardingRouteArgs{key: $key, route: $route}';
  }
}

/// generated route for
/// [_i8.SignupAudiencePage]
class SignupAudienceRoute extends _i15.PageRouteInfo<void> {
  const SignupAudienceRoute({List<_i15.PageRouteInfo>? children})
      : super(
          SignupAudienceRoute.name,
          initialChildren: children,
        );

  static const String name = 'SignupAudienceRoute';

  static const _i15.PageInfo<void> page = _i15.PageInfo<void>(name);
}

/// generated route for
/// [_i9.SignupEventHostVenuePage]
class SignupEventHostVenueRoute extends _i15.PageRouteInfo<void> {
  const SignupEventHostVenueRoute({List<_i15.PageRouteInfo>? children})
      : super(
          SignupEventHostVenueRoute.name,
          initialChildren: children,
        );

  static const String name = 'SignupEventHostVenueRoute';

  static const _i15.PageInfo<void> page = _i15.PageInfo<void>(name);
}

/// generated route for
/// [_i10.SignupPage]
class SignupRoute extends _i15.PageRouteInfo<void> {
  const SignupRoute({List<_i15.PageRouteInfo>? children})
      : super(
          SignupRoute.name,
          initialChildren: children,
        );

  static const String name = 'SignupRoute';

  static const _i15.PageInfo<void> page = _i15.PageInfo<void>(name);
}

/// generated route for
/// [_i11.SignupTypeSelectorPage]
class SignupTypeSelectorRoute extends _i15.PageRouteInfo<void> {
  const SignupTypeSelectorRoute({List<_i15.PageRouteInfo>? children})
      : super(
          SignupTypeSelectorRoute.name,
          initialChildren: children,
        );

  static const String name = 'SignupTypeSelectorRoute';

  static const _i15.PageInfo<void> page = _i15.PageInfo<void>(name);
}

/// generated route for
/// [_i12.SignupVenueBranchPage]
class SignupVenueBranchRoute extends _i15.PageRouteInfo<void> {
  const SignupVenueBranchRoute({List<_i15.PageRouteInfo>? children})
      : super(
          SignupVenueBranchRoute.name,
          initialChildren: children,
        );

  static const String name = 'SignupVenueBranchRoute';

  static const _i15.PageInfo<void> page = _i15.PageInfo<void>(name);
}

/// generated route for
/// [_i13.SplashPage]
class SplashRoute extends _i15.PageRouteInfo<void> {
  const SplashRoute({List<_i15.PageRouteInfo>? children})
      : super(
          SplashRoute.name,
          initialChildren: children,
        );

  static const String name = 'SplashRoute';

  static const _i15.PageInfo<void> page = _i15.PageInfo<void>(name);
}

/// generated route for
/// [_i14.YouAreAllSetPage]
class YouAreAllSetRoute extends _i15.PageRouteInfo<YouAreAllSetRouteArgs> {
  YouAreAllSetRoute({
    _i16.Key? key,
    required _i15.PageRouteInfo<dynamic> route,
    List<_i15.PageRouteInfo>? children,
  }) : super(
          YouAreAllSetRoute.name,
          args: YouAreAllSetRouteArgs(
            key: key,
            route: route,
          ),
          initialChildren: children,
        );

  static const String name = 'YouAreAllSetRoute';

  static const _i15.PageInfo<YouAreAllSetRouteArgs> page =
      _i15.PageInfo<YouAreAllSetRouteArgs>(name);
}

class YouAreAllSetRouteArgs {
  const YouAreAllSetRouteArgs({
    this.key,
    required this.route,
  });

  final _i16.Key? key;

  final _i15.PageRouteInfo<dynamic> route;

  @override
  String toString() {
    return 'YouAreAllSetRouteArgs{key: $key, route: $route}';
  }
}
