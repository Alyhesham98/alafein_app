import 'package:alafein/core/utility/theme.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Description extends StatelessWidget {
  const Description({
    Key? key,
    required this.size,
    required this.text,
  }) : super(key: key);

  final Size size;
  final String text;

  @override
  Widget build(BuildContext context) {
    List<String> arabicTextSegments = [];
    List<String> englishTextSegments = [];

    for (var segment in text.split(' ')) {
      if (_isArabic(segment)) {
        arabicTextSegments.add(segment);
      } else {
        englishTextSegments.add(segment);
      }
    }

    return Padding(
      padding: const EdgeInsets.only(left: 24, bottom: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Description",
            style: homeLabelStyle,
          ),
          SizedBox(
            width: size.width * 0.8,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Arabic text segments
                if (arabicTextSegments.isNotEmpty)
                  Text(
                    arabicTextSegments.join(' '),
                    style: secondaryTextStyle.copyWith(fontFamily: GoogleFonts.abhayaLibre().fontFamily),
                    textDirection: TextDirection.rtl,
                  ),
                SizedBox(height: 20),
                if (englishTextSegments.isNotEmpty)
                  Text(
                    englishTextSegments.join(' '),
                    style: secondaryTextStyle,
                    textDirection: TextDirection.ltr,
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  bool _isArabic(String segment) {
    final arabicRegex = RegExp(
        r'[\u0600-\u06FF\u0750-\u077F\u08A0-\u08FF\uFB50-\uFDFF\uFE70-\uFEFF]');
    return arabicRegex.hasMatch(segment);
  }
}
