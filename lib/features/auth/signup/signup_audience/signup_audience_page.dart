import 'package:alafein/core/presentation/routes/app_router.gr.dart';
import 'package:alafein/core/utility/assets_data.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

@RoutePage()
class SignupAudiencePage extends StatelessWidget {
  const SignupAudiencePage({super.key});

  @override
  Widget build(BuildContext context) {
    // return Scaffold(
    //   backgroundColor: kPrimaryColor,
    //   body: SafeArea(
    //     child: Padding(
    //       padding: EdgeInsets.symmetric(horizontal: 6.sw),
    //       child: Column(
    //         children: [
    //           const Spacer(),
    //           Text(
    //             'Congratulations!',
    //             style: GoogleFonts.anton(
    //                 color: Colors.white,
    //                 fontSize: 8.sw,
    //                 fontWeight: FontWeight.w400),
    //           ),
    //           Padding(
    //             padding: EdgeInsets.symmetric(vertical: 10.sw),
    //             child: SvgPicture.asset(AssetsData.audience, width: 87.sw),
    //           ),
    //           SizedBox(
    //             width: 75.sw,
    //             child: Text(
    //                 'Find a fun activity for yourself and have a great time with your friends ',
    //                 textAlign: TextAlign.center,
    //                 style: secondaryTextStyle.copyWith(color: Colors.white)),
    //           ),
    //           const Spacer(),
    //           Padding(
    //             padding: EdgeInsets.only(bottom: 6.sw),
    //             child: Container(
    //               color: Colors.transparent,
    //               child: MainCustomButton(
    //                   buttonName: 'Start',
    //                   backgroundColor: kSecondaryColor,
    //                   onPressed: () {
    //
    //                   }),
    //             ),
    //           ),
    //         ],
    //       ),
    //     ),
    //   ),
    // );
    Future.delayed(const Duration(milliseconds: 7500), () {
      AutoRouter.of(context).replaceAll([const LoginRoute()]);
    });
    return FittedBox(
      fit: BoxFit.cover,
      child: Center(
        child: Image.asset(AssetsData.youAreAllSet),
      ),
    );
  }
}
