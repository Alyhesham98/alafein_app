import 'package:alafein/core/debugging/log.dart';
import 'package:alafein/core/presentation/routes/app_router.gr.dart';
import 'package:alafein/core/presentation/widgets/main_custom_button.dart';
import 'package:alafein/features/auth/signup/application/signup_cubit/signup_cubit.dart';
import 'package:alafein/features/auth/signup/signup_event_organiser/presentation/event_organiser_body.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:responsive_builder/responsive_builder.dart';

@RoutePage()
class EventOrganiserPage extends StatelessWidget {
  const EventOrganiserPage({super.key});

  @override
  Widget build(BuildContext context) {
    final signupCubit = BlocProvider.of<SignupCubit>(context);

    return BlocListener<SignupCubit, SignupState>(
      listener: (context, state) {
        if (state is SignupStateLoaded) {
          AutoRouter.of(context)
              .push(YouAreAllSetRoute(route: const LoginRoute()));
        }
      },
      child: Scaffold(
        appBar: AppBar(),
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 6.sw),
            child: Stack(
              children: [
                const EventOrganiserBody(),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    color: Colors.white,
                    child: Padding(
                      padding: EdgeInsets.only(bottom: 4.sw),
                      child: MainCustomButton(
                        buttonName: 'Next',
                        onPressed: () async {
                          if (signupCubit.formKeyOrganizer.currentState!
                              .validate()) {
                            signupCubit.formKeyOrganizer.currentState!.save();
                            if (signupCubit.selectedCategory == null) {
                              EasyLoading.showError("Select Event Type");
                            }
                            await signupCubit.signup();
                            Log.debug("validate");
                          }
                        },
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
