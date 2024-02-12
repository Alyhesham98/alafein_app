import 'package:alafein/core/presentation/routes/app_router.gr.dart';
import 'package:alafein/core/utility/theme.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:svg_flutter/svg.dart';

import '../../../../core/local_data/session_management.dart';
import '../../../../core/utility/assets_data.dart';
import '../../../../core/utility/colors_data.dart';
import '../../../../core/utility/strings.dart';

class CustomProfileAppBarEvent extends StatelessWidget {
  const CustomProfileAppBarEvent(
      {super.key,
      required this.title,
      required this.onTap,
      this.color = Colors.black});

  final String title;
  final int onTap;
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
        title: Text(
          title,
          textAlign: TextAlign.start,
          style: TextStyle(
              color: color,
              fontFamily: StringConst.formulaFont,
              fontWeight: FontWeight.w300,
              fontSize: 16),
        ),
        trailing: SvgPicture.asset(AssetsData.arrowRight),
        onTap:(){
          switch(onTap){
            case 1:
              {}
              break;
            case 2:
              {}
              break;
            case 3:
              {}
              break;
            case 4:
              {}
              break;
            case 5:
              {}
              break;
            case 6:
              {}
              break;
            case 7:
              {
                SessionManagement.signOut();
                AutoRouter.of(context).replaceAll([const LoginRoute()]);
              }
              break;
            default:
              break;

          }
        },
      ),
    );
  }
}

