import 'package:alafein/features/event/organizer/cubit/get_event_cubit.dart';
import 'package:alafein/features/event/organizer/presentation/widgets/event_body.dart';
import 'package:alafein/features/event/organizer/presentation/widgets/search_body.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EventSearch extends StatelessWidget {
  const EventSearch({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return BlocProvider(
      create: (context) => GetEventCubit()..getEventPagination(),
      child: SearchBody(size: size),
    );
  }
}
