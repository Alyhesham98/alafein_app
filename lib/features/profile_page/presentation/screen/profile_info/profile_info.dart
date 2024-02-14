// import 'dart:ffi';

// import 'package:alafein/core/local_data/session_management.dart';
import 'package:alafein/features/profile_page/presentation/bloc/profile_page_bloc.dart';
import 'package:alafein/features/profile_page/presentation/widgets/custom_profile_list_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:responsive_builder/responsive_builder.dart';
// import 'package:svg_flutter/svg.dart';

import '../../../../../core/utility/colors_data.dart';
import '../../../../../core/utility/theme.dart';

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
              return Center(child: CircularProgressIndicator( color: kPrimaryColor,)) ;

            case ProfilePageFetchingSuccessfulState:
              final successState = state as ProfilePageFetchingSuccessfulState;
              return CustomScrollView(
              physics: const BouncingScrollPhysics(),
              slivers: [
                SliverToBoxAdapter(
                  child: Container(
                    color: Colors.white,
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(24, 50, 24, 8),
                      child:
                          Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                        const Gap(16),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            const Text(
                              'PERSONAL INFORMATION',
                              style: homeLabeProfileStyle,
                            ),
                            InkWell(
                              onTap: () {
                                //Call  the update user info function in the bloc
                                // get the event ProfilePageEditEvent ()
                                profilePageBloc.add(ProfilePageEditEvent());
                              },
                              child: const Text(
                                'Edit profile',
                                style: personalInfoLabelPrimary,
                              ),
                            ),
                          ],
                        ),
                        const Gap(40),
                        const Text(
                          'PROFILE PICTURE',
                          style: homeLabel4Style,
                        ),
                        Container(
                          width: 27.sw,
                          height: 27.sw,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  fit: BoxFit.cover,
                                  image: NetworkImage(successState.profilePage.photo != null ? successState.profilePage.photo:"")),
                              shape: BoxShape.circle,
                              border: Border.all(width: 0, color: Colors.transparent),
                              color: kProfilePicBackgroundColor),
                          child: null,
                        ),
                        const Gap(24),
                        const Text(
                          'PERSONAL INFORMATION',
                          style: homeLabel4Style,
                        ),
                        const Gap(16),
                        CustomProfileAppBarEvent(
                          title: successState.profilePage.firstName,
                          onTap: null,
                        ),
                        const Gap(16),
                        CustomProfileAppBarEvent(
                          title: successState.profilePage.lastName,
                          onTap: null,
                        ),
                        const Gap(16),
                        CustomProfileAppBarEvent(
                          title: successState.profilePage.email,
                          onTap: null,
                        ),
                        const Gap(16),
                        CustomProfileAppBarEvent(
                          title: successState.profilePage.phone == null ? "No Data":successState.profilePage.phone,
                          // title: "01022971429",
                          onTap: null,
                        ),
                        const Gap(24),
                        const Text(
                          'SECURITY',
                          style: homeLabel4Style,
                        ),
                        const Gap(16),
                        const CustomProfileAppBarEvent(
                          title: "••••••••",
                          onTap: null,
                        )
                      ]),
                    ),
                  ),
                ),
              ],
            );

          }
          return const CircularProgressIndicator( color: kPrimaryColor,) ;
        }
      ),
    );

    /*
    Column(
      children: [
        Text(successState.profilePage.id),
        Text(successState.profilePage.firstName),
        Text(successState.profilePage.lastName),
        Text(successState.profilePage.email),
        
      ],
    );
    
     */

    //  Center(
    //         child: InkWell(
    //             onTap: () {
    //               SessionManagement.signOut();
    //               AutoRouter.of(context).replaceAll([const LoginRoute()]);
    //             },
    //             child: const Text("Log ouuuut")),
    //       );

    //  BlocProvider(
    //   create: (context) => GetEventCubit()..getEventPagination(),
    //   child: Eventbody(size: size),
    // );
  }
}


/*
CustomScrollView(
      physics: const BouncingScrollPhysics(),
      slivers: [
        SliverToBoxAdapter(
          child: Container(
            color: Colors.white,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(24, 50, 24, 8),
              child:
                  Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                const Gap(16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Text(
                      'PERSONAL INFORMATION',
                      style: homeLabeProfileStyle,
                    ),
                    InkWell(
                      onTap: () {},
                      child: const Text(
                        'Edit profile',
                        style: personalInfoLabelPrimary,
                      ),
                    ),
                  ],
                ),
                const Gap(40),
                const Text(
                  'PROFILE PICTURE',
                  style: homeLabel4Style,
                ),
                Container(
                  width: 27.sw,
                  height: 27.sw,
                  decoration: BoxDecoration(
                      image: const DecorationImage(
                          fit: BoxFit.cover,
                          image: NetworkImage(
                              "https://th.bing.com/th/id/R.3bf6defde5c52b2dd385ed4b3d18818c?rik=XZ4f8hPBaB2gLg&pid=ImgRaw&r=0")),
                      shape: BoxShape.circle,
                      border: Border.all(width: 0, color: Colors.transparent),
                      color: kProfilePicBackgroundColor),
                  child: null,
                ),
                const Gap(24),
                const Text(
                  'PERSONAL INFORMATION',
                  style: homeLabel4Style,
                ),
                const Gap(16),
                const CustomProfileAppBarEvent(
                  title: "Ahmed",
                  onTap: null,
                ),
                const Gap(16),
                const CustomProfileAppBarEvent(
                  title: "Ehab",
                  onTap: null,
                ),
                const Gap(16),
                const CustomProfileAppBarEvent(
                  title: "Ahmed@gmail.com",
                  onTap: null,
                ),
                const Gap(16),
                const CustomProfileAppBarEvent(
                  title: "01069595665",
                  onTap: null,
                ),
                const Gap(24),
                const Text(
                  'SECURITY',
                  style: homeLabel4Style,
                ),
                const Gap(16),
                const CustomProfileAppBarEvent(
                  title: "••••••••",
                  onTap: null,
                )
              ]),
            ),
          ),
        ),
      ],

      ///buttons
    );

*/