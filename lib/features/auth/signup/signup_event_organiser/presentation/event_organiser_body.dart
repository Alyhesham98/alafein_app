import 'package:alafein/core/utility/assets_data.dart';
import 'package:alafein/core/utility/colors_data.dart';
import 'package:alafein/features/auth/signup/application/signup_cubit/signup_cubit.dart';
import 'package:alafein/features/auth/signup/signup_event_organiser/presentation/widgets/event_organizer_address.dart';
import 'package:alafein/features/auth/signup/signup_event_organiser/presentation/widgets/event_organizer_description.dart';
import 'package:alafein/features/auth/signup/signup_event_organiser/presentation/widgets/event_organizer_dropdown_field.dart';
import 'package:alafein/features/auth/signup/signup_event_organiser/presentation/widgets/event_organizer_facebook.dart';
import 'package:alafein/features/auth/signup/signup_event_organiser/presentation/widgets/event_organizer_instagram.dart';
import 'package:alafein/features/auth/signup/signup_event_organiser/presentation/widgets/event_organizer_map.dart';
import 'package:alafein/features/auth/signup/signup_event_organiser/presentation/widgets/event_organizer_other.dart';
import 'package:alafein/features/auth/signup/signup_event_organiser/presentation/widgets/event_organizer_webiste.dart';
import 'package:alafein/features/auth/signup/widgets/signup_custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_builder/responsive_builder.dart';

class EventOrganiserBody extends StatelessWidget {
  const EventOrganiserBody({super.key});

  @override
  Widget build(BuildContext context) {
    final signupCubit = BlocProvider.of<SignupCubit>(context);

    return SingleChildScrollView(
      child: Form(
        key: signupCubit.formKeyOrganizer,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SignupTopCustomText(
              title: "EVENT ORGANIZER INFORMATION",
              subtitle: "General Informations",
            ),
            Gap(4.sw),
            Image.asset(AssetsData.map),
            Gap(4.sw),
            const EventOrganizerMap(),
            Gap(4.sw),
            const EventOrganizerAddress(),
            Gap(4.sw),
            const EventOrganizerDescription(),
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
          ],
        ),
      ),
    );
  }
}
