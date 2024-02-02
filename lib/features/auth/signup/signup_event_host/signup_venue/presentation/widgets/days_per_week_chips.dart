import 'package:alafein/core/utility/colors_data.dart';
import 'package:alafein/features/auth/signup/application/signup_cubit/signup_cubit.dart';
import 'package:alafein/features/auth/signup/signup_event_host/signup_venue/presentation/widgets/datetime_item.dart';
import 'package:alafein/features/auth/signup/widgets/signup_custom_text.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_builder/responsive_builder.dart';

import '../../../../../../../core/presentation/widgets/main_custom_button.dart';
import '../../domain/days.dart';

class DaysPerWeekChips extends StatelessWidget {
  const DaysPerWeekChips({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SignupCubit, SignupState>(
      builder: (context, state) {
        final signupCubit = BlocProvider.of<SignupCubit>(context);
        List<Days> days = signupCubit.days[signupCubit.branchIndex];
        return SizedBox(
          height: 52.sw,
          width: 100.sh,
          child: GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              childAspectRatio: 2,
              crossAxisSpacing: 3.sw,
              mainAxisSpacing: 3.sw,
            ),
            itemCount: 7,
            itemBuilder: (context, index) => InputChip(
              onSelected: (a) {
                showModalBottomSheet(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(2.5.sw)),
                  barrierColor: Colors.black54,
                  isScrollControlled: true,
                  isDismissible: true,
                  showDragHandle: true,
                  useSafeArea: true,
                  backgroundColor: Colors.white,
                  context: context,
                  builder: (context) => BlocBuilder<SignupCubit, SignupState>(
                    builder: (context, state) {
                      return Container(
                          height: 90.sw,
                          padding: EdgeInsets.symmetric(horizontal: 6.sw),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const SignupTopCustomText(
                                title: "VENUE INFORMATION",
                                subtitle: "Additional Information",
                              ),
                              Gap(4.sw),
                              GestureDetector(
                                onTap: () async {
                                  await showTimePicker(
                                          context: context,
                                          initialTime: const TimeOfDay(
                                              hour: 00, minute: 00))
                                      .then((value) {
                                    if (value != null) {
                                      days[index].opening = value;
                                      signupCubit.updateState();
                                    }
                                  });
                                },
                                child: TimeItem(
                                    time: days[index].opening,
                                    label: "Opening time"),
                              ),
                              Gap(4.sw),
                              GestureDetector(
                                onTap: () async {
                                  await showTimePicker(
                                          context: context,
                                          initialTime: const TimeOfDay(
                                              hour: 00, minute: 00))
                                      .then((value) {
                                    if (value != null) {
                                      days[index].closing = (value);
                                      signupCubit.updateState();
                                    }
                                  });
                                },
                                child: TimeItem(
                                    time: days[index].closing,
                                    label: "Closing time"),
                              ),
                              Gap(4.sw),
                              Row(
                                children: [
                                  const Text('Open'),
                                  Checkbox(
                                      tristate: false,
                                      value: days[index].isOpen
                                      //  == null
                                      //     ? days[index].isClosed
                                      //     : !days[index].isClosed!
                                      ,
                                      onChanged: (a) {
                                        days[index].isOpen = a ?? false;
                                        signupCubit.updateState();
                                      }),
                                ],
                              ),
                              Gap(4.sw),
                              MainCustomButton(
                                  buttonName: "OK",
                                  onPressed: () {
                                    AutoRouter.of(context).pop();
                                  })
                            ],
                          ));
                    },
                  ),
                );
              },
              elevation: 0,
              pressElevation: 0,
              selectedShadowColor: Colors.transparent,
              surfaceTintColor: Colors.transparent,
              // color: ,
              padding: EdgeInsets.symmetric(vertical: 3.sw),
              backgroundColor: days[index].isOpen == null
                  ? Colors.white
                  : days[index].isOpen ?? false
                      ? kSecondaryColor
                      : Colors.white,
              selectedColor: Colors.white,
              showCheckmark: false,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(2.5.sw),
                  side: BorderSide(
                      color: days[index].isOpen == null
                          ? kDividerColor
                          : days[index].isOpen ?? false
                              ? Colors.transparent
                              : kDividerColor,
                      width: 1.5)),
              label: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    days[index].name,
                    style: GoogleFonts.anton(
                        decoration: days[index].isOpen == null
                            ? null
                            : days[index].isOpen ?? false
                                ? null
                                : TextDecoration.lineThrough,
                        color: days[index].isOpen == null
                            ? kGreyFontColor
                            : days[index].isOpen ?? false
                                ? Colors.white
                                : kGreyFontColor,
                        fontSize: 3.5.sw,
                        fontWeight: FontWeight.w400),
                  ),
                ],
              ),
              selected: false,
            ),
            scrollDirection: Axis.vertical,
          ),
        );
      },
    );
  }
}
