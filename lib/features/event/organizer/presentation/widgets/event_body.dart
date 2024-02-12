import 'package:alafein/core/local_data/session_management.dart';
import 'package:alafein/core/utility/assets_data.dart';
import 'package:alafein/features/event/organizer/cubit/get_event_cubit.dart';
import 'package:alafein/features/event/organizer/cubit/get_event_state.dart';

import 'package:alafein/features/event/organizer/presentation/widgets/custom_appbar.dart';
import 'package:alafein/features/home/presentation/widgets/list_event_items.dart';
import 'package:alafein/features/event/organizer/presentation/widgets/list_view_event.dart';
import 'package:alafein/features/event/organizer/presentation/widgets/search_items.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

class Eventbody extends StatelessWidget {
  const Eventbody({
    super.key,
    required this.size,
  });

  final Size size;

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      physics: const BouncingScrollPhysics(),
      slivers: [
        SliverToBoxAdapter(
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            const Gap(16),
            CustomAppBarEvent(
              title1: "EVENTS",
              title2: "Discover what’s going on",
              hasIcon: SessionManagement.getUserRole() != "" &&
                  SessionManagement.getUserRole() != "Audience",
            ),
            const SearchItems(),
            Image.asset(
              AssetsData.bottomBanner,
            ),
            const Padding(
              padding: EdgeInsets.only(left: 24, top: 22),
              child: SizedBox(
                height: 120,
                child: ListEventItems(),
              ),
            ),
          ]),
        ),
        SliverFillRemaining(
          child: BlocBuilder<GetEventCubit, GetEventState>(
            builder: (context, state) {
              return ListViewEvent(
                size: size,
              );
            },
          ),
        ),
      ],
    );
  }
}
