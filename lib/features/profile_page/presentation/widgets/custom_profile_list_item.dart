import 'package:alafein/core/presentation/routes/app_router.gr.dart';
import 'package:alafein/core/utility/theme.dart';
import 'package:alafein/features/about_us/presentation/screen/about_us_screen.dart';
import 'package:alafein/features/profile_page/presentation/screen/profile_info/profile_info.dart';
import 'package:alafein/features/profile_page/presentation/widgets/profile_item_text.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:responsive_builder/responsive_builder.dart';

// import 'package:google_fonts/google_fonts.dart';
import 'package:svg_flutter/svg.dart';

import '../../../../core/local_data/session_management.dart';
import '../../../../core/utility/assets_data.dart';
import '../../../../core/utility/colors_data.dart';

// import '../../../../core/utility/strings.dart';
// import '../../../main/main_screen.dart';

class CustomProfileAppBarEvent extends StatelessWidget {
  const CustomProfileAppBarEvent(
      {super.key,
      required this.title,
      required this.onTap,
      this.color = Colors.black});

  final String title;
  final int? onTap;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      color: Colors.white,
      // Remove the shadow
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.0),
        side: const BorderSide(color: kDividerColor, width: 1.0),
      ),
      child: ListTile(
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
        title: onTap == null
            ? Text(
                title,
                style: personalInfoTextStyle,
              )
            : ProfileItemText(
                text: title,
                textColor: color,
              ),
        trailing:
            onTap == null ? null : SvgPicture.asset(AssetsData.arrowRight),
        onTap: onTap == null
            ? null
            : () {
                switch (onTap) {
                  case 1:
                    {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (c) => const ProfileInfoPage(),
                          ));
                    }
                    break;
                  case 2:
                    {
                      _showPopUp(context);
                    }
                    break;
                  case 3:
                    {}
                    break;
                  case 4:
                    {
                      if (SessionManagement.getUserRole() != "") {
                        SessionManagement.signOut();
                        AutoRouter.of(context).replaceAll([const LoginRoute()]);
                      } else {
                        AutoRouter.of(context)
                            .replaceAll([const SignupRoute()]);
                      }
                    }
                    break;
                  default:
                    break;
                }
              },
      ),
    );
  }

  Future<void> _showPopUp(BuildContext context) async {
    return showModalBottomSheet(
        backgroundColor: Colors.white,
        context: context,
        builder: (context) {
          return SizedBox(
            height: 200,
            child: Padding(

              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Column(
                children: [
                  const Gap(20),
                  // Padding(
                  //   padding: EdgeInsets.symmetric(horizontal: 10.sw),
                  //   child: Container(),
                  // ),
                  InkWell(
                    borderRadius:BorderRadius.circular(17.0) ,
                    onTap: (){},
                    child: Card(
                      elevation: 0,
                      color: Colors.white,
                      // Remove the shadow
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(17.0),
                        side: const BorderSide(color: kHintColor, width: 2.0),
                      ),
                      child: ListTile(
                        contentPadding: const EdgeInsets.symmetric(
                            horizontal: 16.0, vertical: 8.0),
                        title: ProfileItemText(
                          text: "English",
                          textColor: color,
                        ),
                      ),
                    ),
                  ),
                  InkWell(
                    borderRadius:BorderRadius.circular(17.0) ,
                    onTap: (){},
                    child: Card(
                      elevation: 0,
                      color: Colors.white,
                      // Remove the shadow
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(17.0),
                        side: const BorderSide(color: kHintColor, width: 2.0),
                      ),
                      child: ListTile(
                        contentPadding: const EdgeInsets.symmetric(
                            horizontal: 16.0, vertical: 8.0),
                        title: ProfileItemText(
                          text: "العربية",
                          textColor: color,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }
}
