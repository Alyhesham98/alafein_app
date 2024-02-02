import 'package:alafein/core/presentation/routes/app_router.gr.dart' as rout;
import 'package:alafein/core/presentation/widgets/main_custom_button.dart';
import 'package:alafein/features/auth/signup/application/signup_cubit/signup_cubit.dart';
import 'package:alafein/features/auth/signup/signup_event_host/signup_venue/presentation/signup_event_host_venue_body.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:responsive_builder/responsive_builder.dart';

@RoutePage()
class SignupEventHostVenuePage extends StatelessWidget {
  const SignupEventHostVenuePage({super.key});

  @override
  Widget build(BuildContext context) {
    final signupCubit = BlocProvider.of<SignupCubit>(context);

    return Scaffold(
      appBar: AppBar(),
      body: Stack(
        children: [
          const SignupEventHostVenueBody(),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              color: Colors.white,
              child: Padding(
                padding: EdgeInsets.only(
                  bottom: 4.sw,
                  left: 6.sw,
                  right: 6.sw,
                ),
                child: MainCustomButton(
                    buttonName: 'NEXT',
                    onPressed: () {
                      if (signupCubit.formKeyVenue.currentState!.validate()) {
                        signupCubit.formKeyVenue.currentState!.save();
                        if (signupCubit.selectedCategory == null) {
                          EasyLoading.showError("Select Category");
                        }
                        signupCubit.createBrances();
                        AutoRouter.of(context).push(
                          const rout.SignupVenueBranchRoute(),
                        );
                      }
                    }),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
