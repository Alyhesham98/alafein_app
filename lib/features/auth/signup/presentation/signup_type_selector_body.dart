import 'package:alafein/core/utility/assets_data.dart';
import 'package:alafein/core/utility/colors_data.dart';
import 'package:alafein/core/utility/strings.dart';
import 'package:alafein/features/auth/signup/application/signup_cubit/signup_cubit.dart';
import 'package:alafein/features/auth/signup/presentation/widgets/branches_drop_down.dart';
import 'package:alafein/features/auth/signup/presentation/widgets/custom_selector_tile.dart';
import 'package:alafein/features/auth/signup/presentation/widgets/event_host_chips.dart';
import 'package:alafein/features/auth/signup/widgets/signup_custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_builder/responsive_builder.dart';

class SignupTypeSelectorBody extends StatelessWidget {
  const SignupTypeSelectorBody({super.key});

  @override
  Widget build(BuildContext context) {
    final signupCubit = BlocProvider.of<SignupCubit>(context);
    return BlocBuilder<SignupCubit, SignupState>(
      builder: (context, state) {
        return SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SignupTopCustomText(
                title: "PERSONAL INFORMATION",
                subtitle: "Enter Your Personal Information To Proceed",
              ),
              Gap(7.25.sw),
              Text(
                "Please select your profile type",
                style: GoogleFonts.anton(
                    fontSize: 4.25.sw, fontWeight: FontWeight.w400),
              ),
              Gap(6.5.sw),
              GestureDetector(
                onTap: () {
                  signupCubit.isAuduence = true;
                  signupCubit.isEventHost = false;
                  signupCubit.branchesNum = null;
                  signupCubit.updateState();
                },
                child: CustomSelectorTile(
                  image: AssetsData.user,
                  isSelected: signupCubit.isAuduence,
                  isEventHost: signupCubit.isEventHost,
                  titile: StringConst.audienceTitle,
                  subtitile: StringConst.audienceSubTitle,
                ),
              ),
              Gap(5.sw),
              const Divider(color: kDividerColor, height: 2),
              Gap(5.sw),
              GestureDetector(
                onTap: () {
                  signupCubit.isAuduence = false;
                  signupCubit.isEventHost = true;
                  signupCubit.branchesNum = null;
                  signupCubit.updateState();
                },
                child: CustomSelectorTile(
                  image: AssetsData.users,
                  isSelected: !signupCubit.isAuduence,
                  isEventHost: signupCubit.isEventHost,
                  titile: StringConst.eventHostTitle,
                  subtitile: StringConst.eventHostSubTitle,
                ),
              ),
              Gap(4.sw),
              if (signupCubit.isEventHost) const EventHostChips(),
              Gap(4.sw),
              if (signupCubit.isVenue && signupCubit.isEventHost)
                const BranchesDropDown(),
            ],
          ),
        );
      },
    );
  }
}
