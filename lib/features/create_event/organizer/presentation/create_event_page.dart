import 'package:alafein/core/presentation/widgets/main_custom_button.dart';
import 'package:alafein/core/utility/colors_data.dart';
import 'package:alafein/features/create_event/organizer/cubit/create_event_cubit.dart';
import 'package:alafein/features/create_event/organizer/presentation/widget/page_one.dart';
import 'package:alafein/features/create_event/organizer/presentation/widget/page_three.dart';
import 'package:alafein/features/create_event/organizer/presentation/widget/page_two.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:responsive_builder/responsive_builder.dart';

import '../../../auth/signup/widgets/signup_custom_text.dart';

@RoutePage()
class CreateEventPage extends StatelessWidget {
  const CreateEventPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CreateEventCubit()..getDropdowns(),
      child: Builder(builder: (context) {
        final creaveEventCubit = BlocProvider.of<CreateEventCubit>(context);
        return Scaffold(
          appBar: AppBar(),
          body: BlocListener<CreateEventCubit, CreateEventState>(
            listener: (context, state) {
              if (state is CreateEventSuccessed) {
                AutoRouter.of(context).pop();
              }
            },
            child: SafeArea(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 6.sw),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SignupTopCustomText(
                      title: "EVENT FORM SUBMISSION",
                      subtitle: "Enter your event details",
                    ),
                    Gap(4.sw),
                    BlocBuilder<CreateEventCubit, CreateEventState>(
                      builder: (context, state) {
                        return Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: List.generate(
                            3,
                            (index) => AnimatedContainer(
                              duration: 1.seconds,
                              margin: const EdgeInsets.symmetric(horizontal: 4),
                              width: 80.screenWidth / 3,
                              height: 8,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: index > creaveEventCubit.index
                                    ? Colors.grey.withOpacity(0.5)
                                    : kPrimaryColor,
                              ),
                            ).animate().shimmer(duration: 2.seconds),
                          ),
                        );
                      },
                    ),
                    Gap(8.sw),
                    Expanded(
                      child: PageView(
                        physics: const NeverScrollableScrollPhysics(),
                        reverse: false,
                        controller: creaveEventCubit.pageController,
                        children: const [
                          OrganizerCreateEventPageOne(),
                          OrganizerCreateEventPageTwo(),
                          OrganizerCreateEventPageThree()
                        ],
                        // children: signupCubit.branches_pages,
                      ),
                    ),
                    Container(
                      color: Colors.white,
                      child: Padding(
                        padding: EdgeInsets.only(bottom: 4.sw),
                        child: MainCustomButton(
                          buttonName: 'Next',
                          onPressed: () async {
                            await creaveEventCubit.next();
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      }),
    );
  }
}
