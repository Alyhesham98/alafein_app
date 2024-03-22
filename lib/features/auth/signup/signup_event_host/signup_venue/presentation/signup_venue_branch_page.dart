import 'package:alafein/core/presentation/widgets/main_custom_button.dart';
import 'package:alafein/core/utility/colors_data.dart';
import 'package:alafein/features/auth/signup/application/signup_cubit/signup_cubit.dart';
import 'package:alafein/features/auth/signup/widgets/signup_custom_text.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:responsive_builder/responsive_builder.dart';

@RoutePage()
class SignupVenueBranchPage extends StatefulWidget {
  const SignupVenueBranchPage({super.key});

  @override
  State<SignupVenueBranchPage> createState() => _SignupVenueBranchPageState();
}

class _SignupVenueBranchPageState extends State<SignupVenueBranchPage> {
  @override
  Widget build(BuildContext context) {
    final signupCubit = context.read<SignupCubit>();
    final pageController = PageController(initialPage: 0);
    return Scaffold(
      appBar: AppBar(),
      body: Builder(builder: (context) {
        return SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 6.sw),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                BlocBuilder<SignupCubit, SignupState>(
                  builder: (context, state) {
                    return Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(
                        signupCubit.getBranchesNum,
                        (index) => AnimatedContainer(
                          duration: 1.seconds,
                          margin: const EdgeInsets.symmetric(horizontal: 4),
                          width: 80.screenWidth / signupCubit.getBranchesNum,
                          height: 8,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: index > signupCubit.branchIndex
                                ? Colors.grey.withOpacity(0.5)
                                : kPrimaryColor,
                          ),
                        ).animate().shimmer(duration: 2.seconds),
                      ),
                    );
                  },
                ),
                const Gap(8),
                const SignupTopCustomText(
                  title: "VENUE INFORMATION",
                  subtitle: "Additional Informations",
                ),
                Gap(4.sw),
                Expanded(
                  child: PageView(
                    controller: pageController,
                    children: signupCubit.branchesPages,
                  ),
                ),
                Container(
                  color: Colors.white,
                  child: Padding(
                    padding: EdgeInsets.only(bottom: 4.sw),
                    child: MainCustomButton(
                      buttonName: 'Next',
                      onPressed: () async {
                        if (signupCubit
                            .keys[signupCubit.branchIndex].currentState!
                            .validate()) {
                          signupCubit
                              .keys[signupCubit.branchIndex].currentState!
                              .save();
                          signupCubit.saveBranchData();

                          if (signupCubit.branchIndex <
                              signupCubit.getBranchesNum - 1) {
                            signupCubit.branchIndex++;

                            pageController.nextPage(
                                duration: const Duration(microseconds: 300),
                                curve: Curves.linear);
                            signupCubit.updateState();
                          } else {
                            await signupCubit.signup(context);
                          }
                        }
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      }),
    );
  }
}
