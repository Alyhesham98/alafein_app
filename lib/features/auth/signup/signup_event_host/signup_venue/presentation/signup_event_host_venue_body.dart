import 'package:alafein/core/utility/colors_data.dart';
import 'package:alafein/features/auth/signup/application/signup_cubit/signup_cubit.dart';
import 'package:alafein/features/auth/signup/signup_event_host/signup_venue/presentation/widgets/venue_name_field.dart';
import 'package:alafein/features/auth/signup/signup_event_host/signup_venue/presentation/widgets/venue_description_field.dart';
import 'package:alafein/features/auth/signup/signup_event_host/signup_venue/presentation/widgets/venue_phone_field.dart';
import 'package:alafein/features/auth/signup/signup_event_organiser/presentation/widgets/event_organizer_dropdown_field.dart';
import 'package:alafein/features/auth/signup/signup_event_organiser/presentation/widgets/event_organizer_facebook.dart';
import 'package:alafein/features/auth/signup/signup_event_organiser/presentation/widgets/event_organizer_instagram.dart';
import 'package:alafein/features/auth/signup/signup_event_organiser/presentation/widgets/event_organizer_other.dart';
import 'package:alafein/features/auth/signup/signup_event_organiser/presentation/widgets/event_organizer_webiste.dart';
import 'package:alafein/features/auth/signup/widgets/signup_custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_builder/responsive_builder.dart';

class SignupEventHostVenueBody extends StatelessWidget {
  const SignupEventHostVenueBody({super.key});

  @override
  Widget build(BuildContext context) {
    final signupCubit = BlocProvider.of<SignupCubit>(context);

    return BlocBuilder<SignupCubit, SignupState>(
      builder: (context, state) {
        return Form(
          key: signupCubit.formKeyVenue,
          child: SafeArea(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 6.sw),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SignupTopCustomText(
                      title: "VENUE INFORMATION",
                      subtitle: "General Information",
                    ),
                    Gap(4.sw),
                    // Text(
                    //   "Branch ${signupCubit.branchesNum}",
                    //   style: GoogleFonts.anton(
                    //       fontSize: 4.25.sw, fontWeight: FontWeight.w400),
                    // ),
                    // Gap(4.sw),
                    const VenuNameField(),
                    Gap(4.sw),
                    const VenuePhoneField(),
                    Gap(4.sw),
                    // const VenueMap(),

                    // const VenuAddressField(),
                    // Gap(4.sw),
                    const VenuDescriptionField(),
                    Gap(4.sw),
                    const EventOrganiserDropDown(),
                    Gap(4.sw),
                    Text(
                      "Social Media",
                      style: GoogleFonts.anton(
                          color: kSemiBlack,
                          fontSize: 4.2.sw,
                          fontWeight: FontWeight.w400),
                    ),
                    Gap(4.sw),
                    const EventOrganizerInstagram(),
                    Gap(4.sw),
                    const EventOrganizerFacebook(),
                    Gap(4.sw),
                    const EventOrganizerWebsite(),
                    Gap(4.sw),
                    const EventOrganizerOther(),
                    Gap(24.sw),
                    // Text(
                    //   "Please select your working days",
                    //   style: GoogleFonts.anton(
                    //       color: kSemiBlack,
                    //       fontSize: 4.2.sw,
                    //       fontWeight: FontWeight.w400),
                    // ),
                    // Gap(6.sw),
                    // const DaysPerWeekChips(),
                    // Gap(24.sw),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
