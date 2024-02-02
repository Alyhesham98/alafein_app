import 'package:alafein/features/event/data/model/events/events.dart';
import 'package:alafein/features/event/organizer/cubit/get_event_cubit.dart';
import 'package:alafein/features/event/organizer/presentation/views/event_deatils.dart';
import 'package:alafein/features/event/organizer/presentation/widgets/custom_event_image.dart';
import 'package:alafein/features/event/organizer/presentation/widgets/information_event.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ListEventItems2 extends StatelessWidget {
  const ListEventItems2({
    super.key,
    required this.size,
    required this.index,
    required this.event,
  });

  final Size size;
  final int index;
  final Events event;
  @override
  Widget build(BuildContext context) {
    final bloc = context.read<GetEventCubit>();
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => EventDeatils(
                index: bloc.event!.id!,
              ),
            ));
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 10,
          horizontal: 24,
        ),
        child: SizedBox(
          height: 100,
          child: Row(children: [
            CustomEventImage(
              imageurl: event.poster!,
            ),
            SizedBox(
              width: size.width * 0.05,
            ),
            InformationEvent(
              name: bloc.event!.name!,
              date: bloc.event!.date!,
              venue: bloc.event!.venue!.name!,
            ),
          ]),
        ),
      ),
    );
  }
}
