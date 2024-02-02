import 'package:alafein/features/event/organizer/cubit/get_event_cubit.dart';
import 'package:alafein/features/event/organizer/presentation/widgets/list_event_items2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ListViewEvent extends StatelessWidget {
  const ListViewEvent({
    super.key,
    required this.size,
  });

  final Size size;

  @override
  Widget build(BuildContext context) {
    final getEvent = context.read<GetEventCubit>();
    return ListView.separated(
      physics: const NeverScrollableScrollPhysics(),
      padding: EdgeInsets.zero,
      itemCount: getEvent.events.length,
      separatorBuilder: (context, index) => Container(
        width: double.infinity,
        height: 1,
        color: const Color(0xffECECEC),
      ),
      itemBuilder: (context, index) {
        return ListEventItems2(
          event: getEvent.events[index],
          size: size,
          index: index,
        );
      },
    );
  }
}
