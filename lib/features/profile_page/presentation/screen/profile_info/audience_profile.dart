import 'package:alafein/core/local_data/session_management.dart';
import 'package:alafein/features/auth/signup/presentation/widgets/profile_picture.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:responsive_builder/responsive_builder.dart';

import '../../../../../core/api/constants/api_caller_config.dart';
import '../../../../../core/utility/colors_data.dart';
import '../../../../../core/utility/theme.dart';
import '../../bloc/profile_page_bloc.dart';
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
  final TextEditingController _fNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();

  bool checker = false;

  @override
  void initState() {
    _fNameController.text =
        widget.successState.profilePage?.firstName ?? "----";
    _lastNameController.text =
        widget.successState.profilePage?.lastName ?? "----";
    _phoneController.text = widget.successState.profilePage?.phone ?? "----";
    _emailController.text = widget.successState.profilePage?.email ?? "----";
    super.initState();
  }

  @override
  void dispose() {
    _fNameController.dispose();
    _lastNameController.dispose();
    _phoneController.dispose();
    _emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),

      ),
      body: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: [
          SliverToBoxAdapter(
            child: Container(
              color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(24, 0, 24, 8),
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
                            onTap: () async {
                              //Call  the update user info function in the bloc
                              // get the event ProfilePageEditEvent ()
                              if (checker) {
                                final ProfilePageBloc profilePageBlocEdit =
                                    ProfilePageBloc(
                                        _fNameController.text,
                                        _lastNameController.text,
                                        SessionManagement.getValue(
                                            SessionManagement.IMAGE_URL_KEY),
                                        _phoneController.text);
                                await Future.delayed(
                                    const Duration(milliseconds: 100));
                                profilePageBlocEdit.add(ProfilePageEditEvent());
                                setState(() {
                                  checker = !checker;
                                });
                              } else {
                                setState(() {
                                  checker = !checker;
                                });
                              }
                            },
                            child: Text(
                              checker ? 'Save' : 'Edit profile',
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
                      checker
                          ? const ProfilePicture()
                          : Container(
                              width: 27.sw,
                              height: 27.sw,
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                      fit: BoxFit.cover,
                                      image: NetworkImage(
                                          "${APICallerConfiguration.baseImageUrl}${imageUrl()}")),
                                  shape: BoxShape.circle,
                                  border: Border.all(
                                      width: 0, color: Colors.transparent),
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
                            "first name",
                        controller: _fNameController,
                        enabled: checker,
                      ),
                      const Gap(16),
                      CustomInput(
                        title: widget.successState.profilePage?.lastName ??
                            "last name",
                        controller: _lastNameController,
                        enabled: checker,
                      ),
                      const Gap(16),
                      CustomInput(
                        title:
                            widget.successState.profilePage?.email ?? "Email",
                        controller: _emailController,
                        enabled: false,
                      ),
                      const Gap(16),
                      CustomInput(
                        title:
                            widget.successState.profilePage?.phone ?? "phone",
                        controller: _phoneController,
                        enabled: checker,
                      ),
                      const Gap(24),
                    ]),
              ),
            ),
          ),
        ],
      ),
    );
  }

  String imageUrl() {
    String url = "";
    if (SessionManagement.getValue(SessionManagement.IMAGE_URL_KEY)
        .isNotEmpty) {
      url = SessionManagement.getValue(SessionManagement.IMAGE_URL_KEY);
    } else {
      if (widget.successState.profilePage?.photo != null) {
        url = widget.successState.profilePage!.photo!;
      }
    }
    return url;
  }
}
