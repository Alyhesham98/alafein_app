import 'package:alafein/core/utility/colors_data.dart';
import 'package:alafein/core/utility/strings.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class AboutUS extends StatelessWidget {
  const AboutUS({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),

      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                      // height: size.height * 0.05,
                    ),
                    Text(
                      "About Us".tr() + ":",
                      style: TextStyle(
                        color: kSemiBlack,
                        fontSize: 28,
                        fontFamily: StringConst.formulaFont,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      height: size.height * 0.05,
                    ),
                    const Text(
                      "Welcome to AlaFein – your go-to guide for arts and culture in Cairo.",
                      // textDirection: TextDirection.ltr,

                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 22,
                        fontFamily: StringConst.formulaFont,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    SizedBox(
                      height: size.height * 0.02,
                    ),
                    const Text(
                      "We're all about bringing people closer to the promising arts and culture scene that our country has to offer! Whether you're into exhibitions, performances, music or exploring hidden gems, AlaFein has got you covered in this free of charge, bilingual mobile application. We're passionate about giving a platform to all artists and cultural organizers, especially those flying under the radar. We believe everyone deserves a chance to promote their events and creativity, and we're here to make that happen. Join us in discovering, supporting, and celebrating arts and culture happenings in Cairo and let's make our community even more vibrant together!",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 22,
                        fontFamily: StringConst.formulaFont,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    SizedBox(
                      height: size.height * 0.05,
                    ),
                ],
              ),

              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                // mainAxisAlignment: MainAxisAlignment.start,
                children: [
                    const Text(
                      "                       بنرحب بيك في *على فين!* دليلك للفن والثقافة في القاهرة",
                      maxLines: 1,
                      textAlign: TextAlign.start,
                      // textDirection: TextDirection.ltr,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 22,
                        fontFamily: StringConst.formulaFont,
                        fontWeight: FontWeight.w400,
                      ),
                    ),SizedBox(
                      height: size.height * 0.02,
                    ),
                    const Text(
                      "بنحاول نقرب الناس للمشهد الفني والثقافي في بلدنا مصر، سواء كنت مهتم بالمعارض الفنية أو الفنون الأدائية أو المزيكا أو استكشاف الكنوز الخفية في مجال الفن والثقافة'*على فين' بيجمعلك كل الفعاليات في تطبيق موبايل مجاني باللغتين العربية والإنجليزية.احنا بنقدم منصتنا لكل الفنانين والمنظمين المشاهير واللي لسة بيبدأوا طريقهم لأننا بنؤمن بإن كل شخص يستحق فرصة لتقديم فنه وإبداعه وتوصيل صوته، واحنا هنا عشان نحقق ده.انضموا لينا في رحلة استكشاف ودعم وتقدير للفن والثقافة في القاهرة، عشان نخلي مجتمعنا ينور بالفن.",
                      textAlign: TextAlign.start,
                      // textDirection: TextDirection.rtl,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 22,
                        fontFamily: StringConst.formulaFont,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                ],
              ),
              const Divider(color: Colors.black,),
            ],
          ),
        )
      ),
    ); 
  }
}