import 'package:alafein/features/event/organizer/cubit/get_event_cubit.dart';
import 'package:alafein/features/event/organizer/cubit/get_event_state.dart';
import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../widgets/Events_show_comment.dart';

@RoutePage(name: "EventDeatilsPage")
class EventDeatils extends StatelessWidget {
  const EventDeatils({super.key, @PathParam('id') required this.index});

  final int index;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return BlocProvider(
      create: (context) {
        return GetEventCubit()..getEventDeatils(id: index);
      },
      child: BlocBuilder<GetEventCubit, GetEventState>(
        builder: (context, state) {
          return Scaffold(
            body: CustomScrollView(
              physics: const BouncingScrollPhysics(),
              slivers: [
                SliverToBoxAdapter(
                  child: EventsShowCommentBody(
                    size: size,
                    id: index,
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
