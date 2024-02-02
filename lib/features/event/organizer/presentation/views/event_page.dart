import 'package:alafein/features/event/organizer/cubit/get_event_cubit.dart';
import 'package:alafein/features/event/organizer/presentation/widgets/event_body.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Eventpage extends StatelessWidget {
  const Eventpage({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return BlocProvider(
      create: (context) => GetEventCubit()..getEventPagination(),
      child: Eventbody(size: size),
    );
  }
}
