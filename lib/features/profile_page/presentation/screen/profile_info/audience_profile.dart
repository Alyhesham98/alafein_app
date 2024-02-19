import 'dart:ffi';

import 'package:alafein/core/local_data/session_management.dart';
import 'package:alafein/features/profile_page/presentation/widgets/custom_profile_list_item.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:svg_flutter/svg.dart';

import '../../../../../core/utility/colors_data.dart';
import '../../../../../core/utility/theme.dart';
import '../../bloc/profile_page_bloc.dart';
import '../../model/profile_page_ui_model.dart';
import '../../widgets/custom_text_field_item.dart';

class AudienceProfile extends StatefulWidget {
  const AudienceProfile(
      {super.key, required this.successState, required this.profilePageBloc});

  final ProfilePageFetchingSuccessfulState successState;
  final ProfilePageBloc profilePageBloc;

  @override
  State<AudienceProfile> createState() => _AudienceProfileState();
}

class _AudienceProfileState extends State<AudienceProfile> {
  final TextEditingController _fNameController= TextEditingController() ;
  final TextEditingController  _lastNameController = TextEditingController();
  final TextEditingController  _emailController = TextEditingController();
  final TextEditingController  _mobilefNameController = TextEditingController();

  @override
  void dispose() {
    _fNameController.dispose();
    super.dispose();
  }
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      physics: const BouncingScrollPhysics(),
      slivers: [
        SliverToBoxAdapter(
          child: Container(
            color: Colors.white,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(24, 50, 24, 8),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
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
                            widget.profilePageBloc.add(ProfilePageEditEvent());
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
                              image: NetworkImage(
                                  widget.successState.profilePage?.photo != null
                                      ? widget.successState.profilePage
                                      ?.photo ?? "photo"
                                      : "")),
                          shape: BoxShape.circle,
                          border:
                          Border.all(width: 0, color: Colors.transparent),
                          color: kProfilePicBackgroundColor),
                      child: null,
                    ),
                    const Gap(24),
                    const Text(
                      'PERSONAL INFORMATION',
                      style: homeLabel4Style,
                    ),
                    const Gap(16),
                    CustomInput(
                      title: widget.successState.profilePage?.firstName ??
                          "first name", controller:_fNameController, enabled: true,),
                    const Gap(16),
                    CustomProfileAppBarEvent(
                      title: widget.successState.profilePage?.lastName ??
                          "last name",
                      onTap: null,
                    ),
                    const Gap(16),
                    CustomProfileAppBarEvent(
                      title: widget.successState.profilePage?.email ?? "Email",
                      onTap: null,
                    ),
                    const Gap(16),
                    CustomProfileAppBarEvent(
                      title: widget.successState.profilePage?.phone == null
                          ? "No Data"
                          : widget.successState.profilePage?.phone ?? "phone",
                      // title: "01022971429",
                      onTap: null,
                    ),
                    const Gap(24),

                  ]),
            ),
          ),
        ),
      ],
    );
  }
}
