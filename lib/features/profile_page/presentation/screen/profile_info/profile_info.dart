import 'dart:ffi';

// import 'package:alafein/core/local_data/session_management.dart';
import 'package:alafein/features/profile_page/presentation/bloc/profile_page_bloc.dart';
import 'package:alafein/features/profile_page/presentation/screen/profile_info/venue_profile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:responsive_builder/responsive_builder.dart';
// import 'package:svg_flutter/svg.dart';

import '../../../../../core/local_data/session_management.dart';
import '../../../../../core/utility/colors_data.dart';
import '../../../../../core/utility/theme.dart';
import '../../widgets/custom_profile_list_item.dart';
import 'audience_profile.dart';

class ProfileInfoPage extends StatefulWidget {
  const ProfileInfoPage({super.key});

  @override
  State<ProfileInfoPage> createState() => _ProfileInfoPageState();
}

class _ProfileInfoPageState extends State<ProfileInfoPage> {
  final ProfilePageBloc profilePageBloc = ProfilePageBloc();

  @override
  void initState() {
    profilePageBloc.add(ProfilePageInitialFetchEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // var size = MediaQuery.of(context).size;
    return Center(
        child: BlocConsumer<ProfilePageBloc, ProfilePageState>(
            bloc: profilePageBloc,
            listenWhen: (previous, current) =>
                current is ProfilePageActionState,
            buildWhen: (previous, current) =>
                current is! ProfilePageActionState,
            listener: (context, state) {},
            builder: (context, state) {
              switch (state.runtimeType) {
                case ProfilePageLoadingState :
                  return const Center(
                      child: CircularProgressIndicator(
                    color: kPrimaryColor,
                  ));

                case ProfilePageFetchingSuccessfulState:
                  final successState =
                      state as ProfilePageFetchingSuccessfulState;
                  switch (SessionManagement.getUserRole()) {
                    case "Audience":
                      {
                        return AudienceProfile(
                          successState: successState,
                          profilePageBloc: profilePageBloc,
                        );
                      }
                    case "Host Venue":
                      {
                        return const VenueProfile();
                      }
                    default:
                      {
                        return const Text("Organizer");
                      }
                  }
              }
              return const CircularProgressIndicator(
                color: kPrimaryColor,
              );
            }));
  }
}
