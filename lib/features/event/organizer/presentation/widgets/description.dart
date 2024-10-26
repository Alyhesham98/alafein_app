import 'package:alafein/core/utility/theme.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Description extends StatelessWidget {
  const Description({
    super.key,
    required this.size,
    required this.text,
  });

  final Size size;
  final String? text;

  @override
  Widget build(BuildContext context) {
    // List<Widget> segments = [];

    // // Split text into words
    // List<String> words = text.split(' ');
    // List<String> englishWords = [];
    // List<String> remainingWords = [];
    //
    // // Separate English words first (including numbers)
    // for (var word in words) {
    //   if (!_isArabic(word)) {
    //     englishWords.add(word);
    //   } else {
    //     remainingWords.add(word);
    //   }
    // }
    //
    // // Build segment for English text
    // if (englishWords.isNotEmpty) {
    //   segments.add(
    //     Text(
    //       englishWords.join(' '),
    //       style: secondaryTextStyle,
    //       // textDirection: TextDirection!.ltr,
    //       textAlign: TextAlign.left,
    //     ),
    //   );
    // }
    //
    // // If there are remaining words (potentially Arabic), build segment for Arabic text
    // if (remainingWords.isNotEmpty) {
    //   segments.add(
    //     Text(
    //       remainingWords.join(' '),
    //       style: secondaryTextStyle.copyWith(fontFamily: GoogleFonts.abhayaLibre().fontFamily),
    //       // textDirection: TextDirection.rtl,
    //       textAlign: TextAlign.right,
    //     ),
    //   );
    // }

    return Padding(
      padding: const EdgeInsets.only(left: 24, bottom: 16, right: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Description".tr(),
            style: homeLabelStyle,
          ),
          SizedBox(
            width: size.width * 0.8,
            child: Text(
              text ?? '',
              style: secondaryTextStyle,
              textAlign: TextAlign.left,
            ),
          ),
        ],
      ),
    );
  }

// bool _isArabic(String word) {
//   final arabicRegex = RegExp(r'[\u0600-\u06FF\u0750-\u077F\u08A0-\u08FF\uFB50-\uFDFF\uFE70-\uFEFF]');
//   return arabicRegex.hasMatch(word);
// }

}
