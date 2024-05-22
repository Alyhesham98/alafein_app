import 'package:alafein/core/presentation/routes/app_router.gr.dart';
import 'package:alafein/core/utility/theme.dart';
import 'package:alafein/features/profile_page/presentation/screen/profile_info/profile_info.dart';
import 'package:alafein/features/profile_page/presentation/widgets/profile_item_text.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:gap/gap.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:path_provider/path_provider.dart';

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
    GoogleSignIn googleSignIn = GoogleSignIn();

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
            : () async {
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
                        EasyLoading.show();
                        SessionManagement.signOut();
                        if (await googleSignIn.isSignedIn()) {
                          await googleSignIn.signOut().whenComplete(() {
                            AutoRouter.of(context)
                                .replaceAll([const LoginRoute()]);
                          });
                        } else {
                          AutoRouter.of(context)
                              .replaceAll([const LoginRoute()]);
                        }
                      } else {
                        AutoRouter.of(context).replaceAll([const LoginRoute()]);
                      }
                      await _deleteCacheDir();
                      EasyLoading.dismiss();
                    }
                    break;
                  case 5:
                    {
                      // Show confirmation dialog
                      bool confirmed = await showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: const Text("Delete Account"),
                            content: const Text(
                                "Are you sure you want to delete your account?"),
                            actions: <Widget>[
                              TextButton(
                                onPressed: () {
                                  Navigator.of(context).pop(false);
                                },
                                child: const Text("No"),
                              ),
                              TextButton(
                                onPressed: () {
                                  Navigator.of(context).pop(true);
                                },
                                child: const Text("Yes"),
                              ),
                            ],
                          );
                        },
                      );

                      if (confirmed == true) {
                        // User confirmed, proceed with account deletion
                        EasyLoading.show(status: 'Deleting Account');
                        await Future.delayed(const Duration(seconds: 2));
                        SessionManagement.signOut();
                        if (await googleSignIn.isSignedIn()) {
                          await googleSignIn.signOut().whenComplete(() {
                            AutoRouter.of(context)
                                .replaceAll([const LoginRoute()]);
                          });
                        } else {
                          AutoRouter.of(context)
                              .replaceAll([const LoginRoute()]);
                        }
                        await _deleteCacheDir();
                        EasyLoading.dismiss();
                      }
                    }
                    break;
                }
              },
      ),
    );
  }

  // Future<void> _deleteCacheDir() async {
  //   final cacheDir = await getTemporaryDirectory();
  //
  //   if (cacheDir.existsSync()) {
  //     cacheDir.deleteSync(recursive: true);
  //   }
  // }
  Future<void> _deleteCacheDir() async {
    try {
      final cacheDir = await getTemporaryDirectory();

      if (await cacheDir.exists()) {
        await cacheDir.delete(recursive: true);
      }
    } catch (e) {
      print("Failed to delete cache directory: $e");
    }
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
                    borderRadius: BorderRadius.circular(17.0),
                    onTap: () {},
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
                    borderRadius: BorderRadius.circular(17.0),
                    onTap: () {},
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
