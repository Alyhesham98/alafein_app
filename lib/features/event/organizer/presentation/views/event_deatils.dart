import 'package:alafein/features/event/organizer/cubit/get_event_cubit.dart';
import 'package:alafein/features/event/organizer/cubit/get_event_state.dart';
import 'package:alafein/features/event/organizer/presentation/widgets/events_show_comment.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EventDeatils extends StatelessWidget {
  const EventDeatils({super.key, required this.index});
  final int index;
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return BlocProvider(
      create: (context) => GetEventCubit()..getEventDeatils(id: index),
      child: BlocBuilder<GetEventCubit, GetEventState>(
        builder: (context, state) {
          return Scaffold(
            body: CustomScrollView(
              physics: const BouncingScrollPhysics(),
              slivers: [
                SliverToBoxAdapter(
                  child: EventsShowCommentBody(
                    size: size,
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
