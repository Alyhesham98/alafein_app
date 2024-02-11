import 'package:alafein/core/presentation/routes/app_router.gr.dart';
import 'package:alafein/core/utility/theme.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

class CustomAppBarEvent extends StatelessWidget {
  const CustomAppBarEvent({
    super.key,
    required this.title1,
    required this.title2,
  });

  final String title1;
  final String title2;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 24, top: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title1,
                style: homeLabelStyle,
              ),
              // const Spacer(),
              IconButton(
                  onPressed: () {
                    AutoRouter.of(context).push(const CreateEventRoute());
                  },
                  icon: const Icon(Icons.add_box_outlined))
            ],
          ),
          Text(
            title2,
            style: secondaryTextStyle,
          ),
        ],
      ),
    );
  }
}
