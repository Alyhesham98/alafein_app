import 'dart:ffi';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../../../../core/utility/assets_data.dart';
import '../../../../../core/utility/theme.dart';
import '../../../../event/organizer/presentation/widgets/custom_event_image.dart';
import '../../../../event/organizer/presentation/widgets/icon_button.dart';

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
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 24, vertical: 16),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SizedBox(
                            height: 100,
                            width: 100,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(17),
                              child: CachedNetworkImage(
                                imageUrl:
                                    "https://th.bing.com/th/id/R.3bf6defde5c52b2dd385ed4b3d18818c?rik=XZ4f8hPBaB2gLg&pid=ImgRaw&r=0",
                                fit: BoxFit.cover,
                                errorWidget: (context, url, error) =>
                                    Image.asset(
                                  AssetsData.eventImg,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ),
                          Column(
                            children: [
                              Text("Bibliotheca Alexandrina"),
                              Row(
                                children: [SquareIconButton(
                                  icon: AssetsData.facebook,
                                  color:Colors.blueAccent,
                                  onPressed: () {
                                    // Add your onPressed function here
                                    print('IconButton pressed!');
                                  },
                                ),],
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ]),
            ),
          ),
        ),
      ],
    );
  }
}
