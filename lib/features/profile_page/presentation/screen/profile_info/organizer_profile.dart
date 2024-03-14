
import 'package:alafein/core/api/constants/api_caller_config.dart';
import 'package:alafein/core/utility/assets_data.dart';
import 'package:alafein/features/auth/signup/presentation/widgets/profile_picture.dart';
import 'package:alafein/features/profile_page/presentation/widgets/organizer_widget.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:responsive_builder/responsive_builder.dart';

import '../../../../../core/local_data/session_management.dart';
import '../../../../../core/utility/colors_data.dart';
import '../../../../../core/utility/theme.dart';
import '../../bloc/profile_page_bloc.dart';
import '../../widgets/custom_text_field_item.dart';

class OrganizerProfile extends StatefulWidget {
  const OrganizerProfile(
      {super.key, required this.successState, required this.profilePageBloc});

  final ProfilePageFetchingSuccessfulState successState;
  final ProfilePageBloc profilePageBloc;

  @override
  State<OrganizerProfile> createState() => _OrganizerProfileState();
}

class _OrganizerProfileState extends State<OrganizerProfile> {
  final TextEditingController _fNameController= TextEditingController() ;
  final TextEditingController  _lastNameController = TextEditingController();
  final TextEditingController  _phoneController = TextEditingController();
  final TextEditingController  _emailController = TextEditingController();
  final TextEditingController _maplinkController= TextEditingController() ;
  final TextEditingController  _adressController = TextEditingController();
  final TextEditingController  _instgramController = TextEditingController();
  final TextEditingController  _facebookController = TextEditingController();
  final TextEditingController  _websiteController = TextEditingController();
  final TextEditingController  _otherController = TextEditingController();
  final TextEditingController  _descriptionController = TextEditingController();
  final TextEditingController  _catNameController = TextEditingController();

  bool checker = false;
  
  
  @override
  void initState() {
     _fNameController.text = widget.successState.profilePage?.firstName??"----";
    _lastNameController.text = widget.successState.profilePage?.lastName??"----";
    _phoneController.text = widget.successState.profilePage?.phone??"----";
    _emailController.text = widget.successState.profilePage?.email??"----";
    _maplinkController.text = widget.successState.profilePage?.organizer?.mapLink??"----";
    _adressController.text = widget.successState.profilePage?.organizer?.address??"----";
    _instgramController.text = widget.successState.profilePage?.organizer?.instagram??"----";
    _facebookController.text = widget.successState.profilePage?.organizer?.facebook??"----";
    _websiteController.text = widget.successState.profilePage?.organizer?.websiteURL??"----";
    _otherController.text = widget.successState.profilePage?.organizer?.other??"----";
    _descriptionController.text = widget.successState.profilePage?.organizer?.description??"----";
    _catNameController.text = widget.successState.profilePage?.organizer?.category?.name??"----";
    super.initState();
  }
  
  @override
  void dispose() {
    _fNameController.dispose();
    _lastNameController.dispose();
    _phoneController.dispose();
    _emailController.dispose();
    _maplinkController.dispose();
    _adressController.dispose();
    _instgramController.dispose();
    _facebookController.dispose();
    _websiteController.dispose();
    _otherController.dispose();
    _descriptionController.dispose();
    _catNameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      physics: const BouncingScrollPhysics(),
      slivers: [  SliverToBoxAdapter(
          child: Container(
            color: Colors.white,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(24, 50, 24, 8),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Gap(16),
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          'ORGANIZER PERSONAL INFORMATION',
                          style: homeLabeProfileStyle,
                        ),
                      ],
                    ),
                    const Gap(40),
                    const Text(
                      'PROFILE PICTURE',
                      style: homeLabel4Style,
                    ),
                    checker ?
                      const  ProfilePicture() :
                      Container(    
                        width: 27.sw,
                        height: 27.sw,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                fit: BoxFit.cover,
                                image: NetworkImage(
                                    "${APICallerConfiguration.baseImageUrl}${imageUrl()}")),
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
                      title: "First Name:${widget.successState.profilePage?.firstName ??
                          "first name"}", 
                          controller: _fNameController,
                          enabled: checker,),
                     CustomInput(
                      title: "last Name:${widget.successState.profilePage?.lastName??
                          "last name"}", 
                          controller: _lastNameController,
                          enabled: checker,),
                     CustomInput(
                      title: "Email email:${widget.successState.profilePage?.email ??
                          "email"}", 
                          controller: _emailController,
                          enabled: checker,),
                     CustomInput(
                      title: widget.successState.profilePage?.phone ??
                          "phone", 
                          controller: _phoneController,
                          enabled: checker,),
                      CustomInput(
                      title: widget.successState.profilePage?.organizer?.mapLink??"no maplink", 
                          controller: _maplinkController,
                          enabled: checker,),
                      CustomInput(
                      title: widget.successState.profilePage?.organizer?.address??"No adress", 
                          controller: _adressController,
                          enabled: checker,),
                      CustomInput(
                      title:widget.successState.profilePage?.organizer?.instagram??"No instgrame", 
                          controller: _instgramController,
                          enabled: checker,),
                      CustomInput(
                      title:widget.successState.profilePage?.organizer?.facebook??"no Facebook", 
                          controller: _facebookController,
                          enabled: checker,),
                      CustomInput(
                      title:widget.successState.profilePage?.organizer?.websiteURL??"No website", 
                          controller: _websiteController,
                          enabled: checker,),
                      CustomInput(
                      title: widget.successState.profilePage?.organizer?.other??"No others", 
                          controller: _otherController,
                          enabled: checker,),
                      CustomInput(
                      title: widget.successState.profilePage?.organizer?.description??"No discription", 
                          controller: _descriptionController,
                          enabled: checker,),
                      CustomInput(
                      title:  widget.successState.profilePage?.organizer?.description??"no catigory name", 
                          controller: _catNameController,
                          enabled: checker,),
                    // // TempWidget(
                    // //   input: "ID : "+ (widget.successState.profilePage?.organizer?.id.toString() ?? ""),
                    // // ),
                    // // const Gap(16),
                    // TempWidget(
                    //   input: "maplink : ${widget.successState.profilePage?.organizer?.mapLink?? ""}",
                    // ),
                    // TempWidget(
                    //   input: "address : ${widget.successState.profilePage?.organizer?.address ??  ""}",
                    // ),
                    // const Gap(16),
                    // TempWidget(
                    //   input: "instgram : ${widget.successState.profilePage?.organizer?.instagram ?? ""}",
                    // ),
                    // const Gap(16),
                    // TempWidget(
                    //   input: "Facebook : ${widget.successState.profilePage?.organizer?.facebook  ?? ""}",
                    // ),
                    // const Gap(16),
                    // TempWidget(
                    //   input: "website : ${widget.successState.profilePage?.organizer?.websiteURL ?? ""}",
                    // ),
                    // const Gap(16),
                    // TempWidget(
                    //   input: "other : ${widget.successState.profilePage?.organizer?.other ?? ""}",
                    // ),
                    // const Gap(16),
                    // Container(
                    //   padding: const EdgeInsets.all(12),
                    //   decoration: BoxDecoration(
                    //     borderRadius: BorderRadius.circular(10),
                    //     border: Border.all(color: kDividerColor, width: 1.5),
                    //   ),
                    //   child: Text(
                    //     "Description : ${widget.successState.profilePage?.organizer?. description ?? ""}",
                    //     style: secondaryTextStyle,
                    //     maxLines: 5,
                    //   ),
                    // ),
                    // // const Gap(16),TempWidget(
                    // //   input: "Category ID : "+ (widget.successState.profilePage?.organizer?.category?.id.toString() ?? ""),
                    // // ),
                    // const Gap(16),
                    // TempWidget(
                    //   input: "Category name : ${widget.successState.profilePage?.organizer?.category?.name?? ""}",
                    // ),
                    // const Gap(16),
                    // //  Container(
                    // //   padding: const EdgeInsets.all(12),
                    // //   decoration: BoxDecoration(
                    // //     borderRadius: BorderRadius.circular(10),
                    // //     border: Border.all(color: kDividerColor, width: 1.5),
                    // //   ),
                    // //   child: Text(
                    // //     //'${APICallerConfiguration.baseImageUrl}${uiState?.venueImage}' ??""
                    // //     "Category image : "+ (widget.successState.profilePage?.organizer?.category?.image ?? ""),
                    // //     style: secondaryTextStyle,
                    // //     maxLines: 5,
                    // //   ),
                    // ),
                    SizedBox(
                          width: 100,
                          height: 100,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(17),
                            child: CachedNetworkImage(
                              imageUrl: '${APICallerConfiguration.baseImageUrl}${widget.successState.profilePage?.organizer?.category?.image}' ??"",
                              fit: BoxFit.cover,
                              errorWidget: (context, url, error) => Image.asset(
                                AssetsData.eventImg,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                    const Gap(24),
              ]),
            ),
          ),
        ),
      ],
    );
  }
  String imageUrl() {
    String url = "";
    if (SessionManagement
        .getValue(SessionManagement.IMAGE_URL_KEY)
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
