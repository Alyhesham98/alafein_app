import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../../../../core/utility/theme.dart';

class VenueProfile extends StatelessWidget {
  const VenueProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      physics: const BouncingScrollPhysics(),
      slivers: [
        SliverToBoxAdapter(
          child: Container(
            color: Colors.white,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(24, 50, 24, 8),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Gap(16),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        IconButton(
                            onPressed: () {},
                            icon: const Icon(Icons.arrow_back)),
                        const Spacer(),
                        const Text(
                          'Venue Profile',
                          style: homeLabeProfileStyle,
                        ),
                        const Spacer(),
                      ],
                    ),
                  ]),
            ),
          ),
        ),
      ],
    );
  }
}
