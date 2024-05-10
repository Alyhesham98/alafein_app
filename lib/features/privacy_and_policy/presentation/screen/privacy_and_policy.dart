import 'package:alafein/core/utility/colors_data.dart';
import 'package:alafein/core/utility/strings.dart';
import 'package:flutter/material.dart';

class PrivacyAndPolicy extends StatelessWidget {
  const PrivacyAndPolicy({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            SizedBox(
              height: size.height * 0.02,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                    height: size.height * 0.05,
                  ),
                  const Text(
                    "AlaFein! Privacy and Policy:",
                    textAlign: TextAlign.start,
                    style: TextStyle(
                      color: kSemiBlack,
                      fontSize: 22,
                      fontFamily: StringConst.formulaFont,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  SizedBox(
                    height: size.height * 0.03,
                  ),
                  const Text(
                    "We take the privacy and security of our users' personal information very seriously. By using our application, you agree to be bound by the following privacy policy:",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 22,
                      fontFamily: StringConst.formulaFont,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(
                    height: size.height * 0.02,
                  ),
                  const Padding(
                    padding: EdgeInsets.only(left: 10),
                    child: Text(
                      "-  Information Collection: We collect personal information from users who create accounts on our app, including name, email address, and language preference.\n-  Information Use: We use this information to provide and improve our services, communicate with you, and personalize your experience on our app.-\n  Information Use: We use this information to provide and improve our services, communicate with you, and personalize your experience on our app.\n-  Information Use: We use this information to provide and improve our services, communicate with you, and personalize your experience on our app.\n-  Information Sharing: We do not sell or rent your personal information to third parties. We may share it with service providers who assist us in operating our app.-\n  Data Security: We take reasonable measures to protect the security of your personal information.\n-  User Content: We are not responsible for the accuracy or legality of user content, and we reserve the right to remove any content that violates our terms of service.\n-  Cookies and Tracking Technologies: We use cookies and other tracking technologies to improve your experience on our app.\n-  Changes to Privacy Policy: We reserve the right to change this privacy policy at any time.\n-  Contact Us: If you have any questions or concerns about this privacy policy, please contact us using the contact information provided on our app.",
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
                      "By using our app, you acknowledge that you have read, understood, and agreed to this privacy policy. We are committed to protecting your privacy and will take all reasonable measures to do so.",
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
              height: size.height * 0.02,
            ),

            SizedBox(
              height: size.height * 0.02,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              // mainAxisAlignment: MainAxisAlignment.start,
              children: [
                  const Text(
                    "*!السياسة والخصوصية ل *على فين",
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
                    "نحن نهتم بأخذ ما يخص خصوصية وأمن المعلومات الشخصية لمستخدمينا على محمل الجد. باستخدامك تطبيقنا، فإنك توافق على الالتزام بسياسات الخصوصية التالية:",
                    textAlign: TextAlign.start,
                    textDirection: TextDirection.rtl,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 22,
                      fontFamily: StringConst.formulaFont,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(
                    height: size.height * 0.01,
                  ),
                  const Padding(
                    padding: EdgeInsets.only(right: 10),
                    child: Text(
                      "-  جمع المعلومات: نحن نقوم بجمع المعلومات الشخصية من المستخدمين الذين ينشئون حسابات على تطبيقنا، بما في ذلك الاسم وعنوان البريد الإلكتروني وتفضيلات اللغة.\n-  استخدام المعلومات: استخدامنا لهذه المعلومات يساعدنا في تقديم خدماتنا وتحسينها والتواصل مع المستخدم  وتحسين تجربته على تطبيقنا.\n-   مشاركة المعلومات: نحن لا نبيع أو نؤجر معلوماتك الشخصية لأطراف ثالثة. ولكن قد نشاركها مع مزودي الخدمة الذين يساعدوننا في تشغيل تطبيقنا.\n-  أمن البيانات: نتخذ تدابير معقولة لحماية أمن معلوماتك الشخصية\n-  محتوى المستخدم: نحن لسنا مسؤولين عن دقة أو قانونية محتوى المستخدم ، ونحتفظ بالحق في إزالة أي محتوى يخالف أو ينتهك شروط الخدمة الخاصة بنا.\n-  ملفات تعريف الارتباط وتقنيات التتبع: نستخدم ملفات تعريف الارتباط وتقنيات التتبع الأخرى لتحسين تجربتك على تطبيقنا.-n\n-   التغييرات في سياسة الخصوصية: نحتفظ بالحق في تغيير سياسة الخصوصية هذه في أي وقت.\n-  تواصل معنا: إذا كانت لديك أي أسئلة أو مخاوف بشأن سياسة الخصوصية هذه، فيرجى الاتصال بنا باستخدام معلومات الاتصال المتوفرة على تطبيقنا.",
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
                      "باستخدام تطبيقنا ، فإنك تقر بأنك قد قرأت وفهمت ووافقت على سياسة الخصوصية هذه. نحن ملتزمون بحماية خصوصيتك وسنتخذ جميع التدابير المناسبة للقيام بذلك.",
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
    ); 
  }
}