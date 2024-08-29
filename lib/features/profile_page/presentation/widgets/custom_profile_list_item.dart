import 'dart:convert';
import 'dart:developer';
import 'package:easy_localization/easy_localization.dart';
import 'package:http/http.dart' as http;

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
import '../../../auth/signup/complete_registration/complete_registration.dart';
import '../../../main/main_screen.dart';
import '../model/Profile.dart';
import '../screen/notifications_page.dart';
import '../screen/profile_page.dart';

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
                title.tr(),
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
                    {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => NotificationsPage(),
                        ),
                      );
                    }
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
                            title: Text("Delete Account").tr(),
                            content: const Text("Are you sure you want to delete your account?"),
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
                        EasyLoading.show(status: 'Fetching Profile');

                        // Fetch the user profile to get the user ID
                        Profile? profile = await fetchProfile();

                        if (profile != null && profile.id != null) {
                          EasyLoading.show(status: 'Deleting Account');
                          bool isDeleted = await deleteProfile(userId: profile.id);

                          if (isDeleted) {
                            // Successfully deleted the profile
                            SessionManagement.signOut();
                            if (await googleSignIn.isSignedIn()) {
                              await googleSignIn.signOut().whenComplete(() {
                                AutoRouter.of(context).replaceAll([const LoginRoute()]);
                              });
                            } else {
                              AutoRouter.of(context).replaceAll([const LoginRoute()]);
                            }
                            await _deleteCacheDir();
                          } else {
                            // Handle the case where deletion failed
                            EasyLoading.showError('Failed to delete account');
                          }
                        } else {
                          EasyLoading.showError('Failed to fetch user profile');
                        }
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

  static Future<Profile?> fetchProfile() async {
    var client = http.Client();

    try {
      var response = await client.get(
        Uri.parse('https://alafein.azurewebsites.net/api/v1/User/Profile'),
        headers: {"Authorization": "Bearer ${SessionManagement.getUserToken()}"},
      );

      debugPrint("Response status: ${response.statusCode}");
      debugPrint("Response body: ${response.body}");

      if (response.statusCode == 200) {
        Map<String, dynamic> result = jsonDecode(response.body);

        if (result.containsKey('Data') && result['Data'] != null) {
          Profile profilePage = Profile.fromJson(result['Data']);
          debugPrint("Profile fetched: ${profilePage.email}");
          return profilePage;
        } else {
          debugPrint("Failed to fetch profile: No data found");
          return null;
        }
      } else {
        debugPrint("Failed to fetch profile: HTTP ${response.statusCode}");
        return null;
      }
    } catch (e) {
      log('Error fetching profile: $e');
      return null;
    } finally {
      EasyLoading.dismiss();
    }
  }


  Future<bool> deleteProfile({required String? userId}) async {
    var client = http.Client();

    try {
      var response = await client.delete(
        Uri.parse('https://alafein.azurewebsites.net/api/v1/User/Delete/$userId'),
        headers: {"Authorization": "Bearer ${SessionManagement.getUserToken()}"},
      );

      // Log the raw response for debugging
      debugPrint("Delete Response status: ${response.statusCode}");
      debugPrint("Delete Response body: ${response.body}");

      if (response.statusCode == 200) {
        Map<String, dynamic> result = jsonDecode(response.body);

        // Ensure the result contains the expected keys
        if (result.containsKey('Succeeded') && result['Succeeded'] == true) {
          debugPrint("User deleted successfully");
          return true;
        } else {
          debugPrint("Failed to delete user: ${result['Message'] ?? 'No message'}");
          return false;
        }
      } else {
        debugPrint("Failed to delete user: HTTP ${response.statusCode}");
        return false;
      }
    } catch (e) {
      log('Error: $e');
      return false;
    } finally {
      EasyLoading.dismiss();
    }
  }


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
                    onTap: () => changeLanguage(context),
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
                    onTap: () => changeLanguage(context),
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
void changeLanguage(BuildContext context) {
  Locale? currentLocale = EasyLocalization.of(context)!.currentLocale;
  Locale newLocale = currentLocale == const Locale('en', 'US')
      ? const Locale('ar', 'EG')
      : const Locale('en', 'US');

  EasyLocalization.of(context)!.setLocale(newLocale).then((_) {
    Navigator.pop(context);
    Navigator.of(context).push(MaterialPageRoute(builder: (context) => const MainScreen()));


  });

}


