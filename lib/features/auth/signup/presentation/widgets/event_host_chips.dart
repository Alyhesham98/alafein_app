import 'package:alafein/core/utility/colors_data.dart';
import 'package:alafein/features/auth/signup/application/signup_cubit/signup_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_builder/responsive_builder.dart';

class EventHostChips extends StatelessWidget {
  const EventHostChips({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final signupCubit = BlocProvider.of<SignupCubit>(context);
    return BlocBuilder<SignupCubit, SignupState>(
      builder: (context, state) {
        return Row(
          children: [
            Expanded(
              child: InputChip(
                onSelected: (value) {
                  signupCubit.isVenue = true;
                  signupCubit.isEventOrganiser = false;
                  signupCubit.updateState();
                },
                elevation: 0,
                pressElevation: 0,
                selectedShadowColor: Colors.transparent,
                surfaceTintColor: Colors.transparent,
                color: const MaterialStatePropertyAll(Colors.white),
                padding: EdgeInsets.symmetric(vertical: 3.sw),
                backgroundColor: Colors.white,
                selectedColor: Colors.white,
                showCheckmark: false,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(2.5.sw),
                    side: BorderSide(
                        color: signupCubit.isVenue
                            ? kSecondaryColor
                            : kDividerColor,
                        width: 1.5)),
                label: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Venue',
                      style: GoogleFonts.anton(
                          color: kGreyFontColor,
                          fontSize: 3.5.sw,
                          fontWeight: FontWeight.w400),
                    ),
                  ],
                ),
                selected: signupCubit.isVenue,
              ),
            ),
            Gap(6.sw),
            Expanded(
              child: InputChip(
                onSelected: (value) {
                  signupCubit.isEventOrganiser = true;
                  signupCubit.isVenue = false;
                  signupCubit.branchesNum = null;
                  signupCubit.updateState();
                },
                elevation: 0,
                pressElevation: 0,
                selectedShadowColor: Colors.transparent,
                surfaceTintColor: Colors.transparent,
                color: const MaterialStatePropertyAll(Colors.white),
                padding: EdgeInsets.symmetric(vertical: 3.sw),
                backgroundColor: Colors.white,
                selectedColor: Colors.white,
                showCheckmark: false,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(2.5.sw),
                    side: BorderSide(
                        color: signupCubit.isEventOrganiser
                            ? kSecondaryColor
                            : kDividerColor,
                        width: 1.5)),
                label: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Event Organiser',
                      style: GoogleFonts.anton(
                          color: kGreyFontColor,
                          fontSize: 3.5.sw,
                          fontWeight: FontWeight.w400),
                    ),
                  ],
                ),
                selected: signupCubit.isEventOrganiser,
              ),
            ),
          ],
        );
      },
    );
  }
}
