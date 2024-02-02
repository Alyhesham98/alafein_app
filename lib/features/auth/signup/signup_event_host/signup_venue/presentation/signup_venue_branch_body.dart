import 'package:alafein/core/utility/colors_data.dart';
import 'package:alafein/core/utility/strings.dart';
import 'package:alafein/features/auth/signup/application/signup_cubit/signup_cubit.dart';
import 'package:alafein/features/auth/signup/model/lookup_model.dart';
import 'package:alafein/features/auth/signup/presentation/widgets/branch_name_field.dart';
import 'package:alafein/features/auth/signup/signup_event_host/signup_venue/presentation/widgets/days_per_week_chips.dart';
import 'package:alafein/features/auth/signup/signup_event_organiser/presentation/widgets/event_organizer_address.dart';
import 'package:alafein/features/auth/signup/signup_event_organiser/presentation/widgets/event_organizer_map.dart';
import 'package:alafein/features/auth/signup/widgets/signup_custom_text.dart';
import 'package:alafein/features/create_event/organizer/presentation/widget/image_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:multi_select_flutter/multi_select_flutter.dart';
import 'package:responsive_builder/responsive_builder.dart';

import '../../../../../../core/utility/assets_data.dart';

class SignupVenueBranchBody extends StatefulWidget {
  const SignupVenueBranchBody({super.key});

  @override
  State<SignupVenueBranchBody> createState() => _SignupVenueBranchBodyState();
}

class _SignupVenueBranchBodyState extends State<SignupVenueBranchBody> {
  @override
  Widget build(BuildContext context) {
    final signupCubit = context.read<SignupCubit>();
    final daysWidget = const DaysPerWeekChips();
    return SingleChildScrollView(
      child: Form(
        key: signupCubit.keys[signupCubit.branchIndex],
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            BlocBuilder<SignupCubit, SignupState>(
              builder: (context, state) {
                return SignupTopCustomText(
                  title: "Branch ${signupCubit.branchIndex + 1}",
                );
              },
            ),
            Gap(4.sw),
            Image.asset(AssetsData.map),
            Gap(4.sw),
            const BranchNameField(),
            Gap(4.sw),
            const EventOrganizerMap(),
            Gap(4.sw),
            const EventOrganizerAddress(),
            Gap(4.sw),
            Text(
              "Please select your working days",
              style: GoogleFonts.anton(
                  color: kSemiBlack,
                  fontSize: 4.2.sw,
                  fontWeight: FontWeight.w400),
            ),
            Gap(6.sw),
            daysWidget,
            Gap(15.sw),
            BlocBuilder<SignupCubit, SignupState>(
              builder: (context, state) {
                return MultiSelectChipField<Facility?>(
                  items: signupCubit.lookupModel?.facility
                          ?.map((e) => MultiSelectItem(e, e.imageName ?? ""))
                          .toList() ??
                      [],
                  scroll: false,
                  initialValue: [],
                  title: const Text(
                    "Facilities",
                    style: TextStyle(
                      color: Color(0xFF3D3D3D),
                      fontSize: 17,
                      fontFamily: StringConst.formulaFont,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  headerColor: Colors.white,
                  // itemBuilder: (item, p1) {
                  //   return Row(
                  //     children: [
                  //       SvgPicture.network(
                  //           "${APICallerConfiguration.baseImageUrl}${item.value?.imagePath}"),
                  //       Text(item.label),
                  //     ],
                  //   );
                  // },
                  // icon: signupCubit.lookupModel?.facility,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.white, width: 1.8),
                  ),
                  selectedChipColor: kPrimaryColor,
                  selectedTextStyle: const TextStyle(color: Colors.white),
                  onTap: (values) {
                    signupCubit.selectedFacilities[signupCubit.branchIndex] =
                        values;
                  },
                );
              },
            ),
            const ImagesPicker(),
          ],
        ),
      ),
    );
  }
}
