import 'package:alafein/core/presentation/routes/app_router.gr.dart';
import 'package:alafein/core/presentation/widgets/main_custom_button.dart';
import 'package:alafein/features/auth/signup/application/signup_cubit/signup_cubit.dart';
import 'package:alafein/features/auth/signup/presentation/signup_type_selector_body.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:responsive_builder/responsive_builder.dart';

@RoutePage()
class SignupTypeSelectorPage extends StatelessWidget {
  const SignupTypeSelectorPage({super.key});

  @override
  Widget build(BuildContext context) {
    final signupCubit = BlocProvider.of<SignupCubit>(context);

    return BlocConsumer<SignupCubit, SignupState>(
      listener: (context, state) {
        if (state is SignupStateLoaded) {
          AutoRouter.of(context).push(const SignupAudienceRoute());
        }
      },
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(),
          body: SafeArea(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 6.sw),
              child: Stack(
                children: [
                  const SignupTypeSelectorBody(),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Padding(
                      padding: EdgeInsets.only(bottom: 4.sw),
                      child: MainCustomButton(
                        buttonName: 'Next',
                        onPressed: signupCubit.isAuduence
                            ? () async {
                                await signupCubit.signup();
                              }
                            : signupCubit.isEventHost &&
                                    signupCubit.isVenue &&
                                    signupCubit.getBranchesNum > 0
                                ? () {
                                    AutoRouter.of(context).push(
                                        const SignupEventHostVenueRoute());
                                  }
                                : signupCubit.isEventHost &&
                                        signupCubit.isEventOrganiser
                                    ? () {
                                        AutoRouter.of(context)
                                            .push(const EventOrganiserRoute());
                                      }
                                    : null,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
