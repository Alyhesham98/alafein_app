import 'package:alafein/core/utility/colors_data.dart';
import 'package:alafein/core/utility/strings.dart';
import 'package:flutter/material.dart';

class TermCondition extends StatelessWidget {
  const TermCondition({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Scaffold(
    appBar: AppBar(
      leading: IconButton(
        icon: const Icon(Icons.arrow_back),
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
                    const Text(
                      "AlaFein! Terms and conditions:",
                      textAlign: TextAlign.start,
                      style: TextStyle(
                        color: kSemiBlack,
                        fontSize: 22,
                        fontFamily: StringConst.formulaFont,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    SizedBox(
                      height: size.height * 0.02,
                    ),
                    const Text(
                      "Welcome AlaFein! By using our application, you agree to be bound by the following terms and conditions:",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 22,
                        fontFamily: StringConst.formulaFont,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    // SizedBox(
                    //   height: size.height * 0.01,
                    // ),
                    const Padding(
                      padding: EdgeInsets.only(left: 10),
                      child: Text(
                        "-  User Responsibility: You are responsible for your use of our application and any content or information you upload, or publish on our application.\n-  Intellectual Property: Our application is owned by us and protected by intellectual property laws.-  User Content: by using our application, you grant us a license to use your content for the purpose of improving our services.\n-  Information accuracy: We strive to provide accurate and up-to-date information on artistic and cultural events in Egypt. We collect our data directly from venues, organizers and artists to ensure its accuracy. However, we do not guarantee one hundred percent the accuracy, completeness or timeliness of any information on our application for unannounced sudden changes.\n-  Changes to Terms and Conditions: We reserve the right to change these terms and conditions at any time.\n-  Contact Us: If you have any questions or concerns about these terms and conditions, please contact us using the contact information provided on our application.",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 22,
                          fontFamily: StringConst.formulaFont,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),

                    SizedBox(
                      height: size.height * 0.03,
                    ),
                    const Padding(
                      padding: EdgeInsets.only(left: 10),
                      child: Text(
                        "By using our free bilingual mobile application, you acknowledge that you have read, understood, and agreed to these terms and conditions.",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 22,
                          fontFamily: StringConst.formulaFont,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                ],
              ),

              SizedBox(
                height: size.height * 0.03,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                // mainAxisAlignment: MainAxisAlignment.start,
                children: [
                    const Text(
                      "*!الشروط والأحكام ل *على فين*",
                      maxLines: 1,
                      textAlign: TextAlign.start,
                      textDirection: TextDirection.ltr,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 22,
                        fontFamily: StringConst.formulaFont,
                        fontWeight: FontWeight.w600,
                      ),
                    ),SizedBox(
                      height: size.height * 0.02,
                    ),
                    const Text(
                      "نرحب بكم في دليلكم الرقمي المجاني باللغتين العربية والإنجليزية، باستخدامك تطبيقنا فإنك توافق على الشروط والأحكام التالية:",
                      textAlign: TextAlign.start,
                      textDirection: TextDirection.rtl,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 22,
                        fontFamily: StringConst.formulaFont,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    SizedBox(
                      height: size.height * 0.01,
                    ),
                    const Padding(
                      padding: EdgeInsets.only(right: 10),
                      child: Text(
                        "-  مسؤولية المستخدم: أنت مسؤول عن استخدامك لتطبيقنا وأي محتوى أو معلومات تقوم بتحميلها أو نشرها عليه.\n-  الملكية الفكرية: التطبيق مملوك لنا ومحمي بموجب قوانين الملكية الفكرية.\n-  محتوى المستخدم: باستخدامك تطبيقنا، فإنك تمنحنا ترخيصًا لاستخدام المحتوى الخاص بك لغرض توفير وتحسين خدماتنا عبر التطبيق.\n-  دقة المعلومات: نسعى جاهدين لتوفير معلومات دقيقة ومحدثة يوم بيوم حول الأحداث الفنية والثقافية في مصر. نقوم بجمع بياناتنا مباشرة من الأماكن والمنظمين والفنانين لضمان دقتها. ومع ذلك ، فإننا لا نضمن مئة بالمئة دقة أو اكتمال أو توقيت أي معلومات على تطبيقنا لما قد يحدث من تغييرات مفاجئة غير معلنة من المصدر.\n-  التغييرات في الشروط والأحكام: نحتفظ بالحق في تغيير هذه الشروط والأحكام في أي وقت.\n-  تواصل معنا: إذا كانت لديك أي أسئلة أو مخاوف بشأن هذه الشروط والأحكام ، فيرجى الاتصال بنا باستخدام معلومات الاتصال الواردة في تطبيقنا.",
                        textAlign: TextAlign.start,
                        textDirection: TextDirection.rtl,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 22,
                          fontFamily: StringConst.formulaFont,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                    const Center(child:  Padding(
                      padding: EdgeInsets.all(20),
                      child: Text(
                        "باستخدامك تطبيقنا المجاني ثنائي اللغة ، فإنك تقر بأنك قد قرأت وفهمت ووافقت على هذه الشروط والأحكام.",
                          textAlign: TextAlign.start,
                          textDirection: TextDirection.rtl,
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 22,
                            fontFamily: StringConst.formulaFont,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                    ),
                  )
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