import 'package:alafein/core/presentation/routes/app_router.gr.dart';
import 'package:alafein/core/utility/theme.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

class CustomProfileAppBarEvent extends StatelessWidget {
  const CustomProfileAppBarEvent({
    super.key,
    required this.title1,
  });
  final String title1;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 24, top: 72),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'PROFILES',
            style: homeLabeProfileStyle,
          ),
          // Padding(
          //   padding: const EdgeInsets.only(top: 10,left: 24,right: 24,bottom: 10),
          //   child: TextButton(
          //     onPressed: () {},
          //     child:  Text(
          //       'Deactive Account ',
          //       textAlign: TextAlign.start,
          //       style: homeLabel4Style,
          //     ),
          //   ),
          // ),
        ],
      ),
    );
  }
}

/*
  IconButton(icon: const Icon(Icons.arrow_back_ios_new , color: Colors.white, size: 20,),
          onPressed: () => {
            Navigator.pop(context)
          }

 */
