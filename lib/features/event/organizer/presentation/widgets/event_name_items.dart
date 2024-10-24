import 'package:alafein/core/utility/colors_data.dart';
import 'package:alafein/core/utility/theme.dart';
import 'package:alafein/features/event/organizer/presentation/widgets/custom_event_image.dart';
import 'package:alafein/features/event/organizer/presentation/widgets/custom_icon.dart';
import 'package:alafein/features/favourite/presentation/toggle_bloc/toggle_favorite_bloc.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:gap/gap.dart';
import 'package:alafein/features/event/organizer/repos/add_to_calender.dart';
import 'package:add_2_calendar/add_2_calendar.dart';
import 'package:sembast/sembast.dart';

class EventName extends StatefulWidget {
  const EventName(
      {super.key,
        required this.size,
        required this.imageurl,
        required this.name,
        required this.index,
        required this.onTap,
        required this.id,
        required this.isFavorite,
        required this.eventName,
        required this.location,
        required this.date});

  final Size size;
  final int index;
  final String imageurl;
  final String name;
  final Function onTap;
  final int id;
  final bool isFavorite;
  final String? eventName;
  final String location;
  final String date;

  @override
  State<EventName> createState() => _EventNameState();
}

class _EventNameState extends State<EventName> {
  bool toggle = false;

  @override
  void initState() {
    super.initState();
    toggle = widget.isFavorite;
  }

  @override
  void didUpdateWidget(EventName oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.isFavorite != oldWidget.isFavorite) {
      setState(() {
        toggle = widget.isFavorite;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            width: widget.size.width * 0.28,
            child: CustomEventImage(
              imageurl: widget.imageurl,
            ),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  widget.eventName!,
                  style: homeLabelStyle,
                  softWrap: true,
                ),
                Text(
                  widget.name.tr(),
                  style: secondaryTextStyle.copyWith(fontSize: 14),
                ),
              ],
            ),
          ),
          const SizedBox(width: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomIcon(
                icon: const Icon(
                  Icons.calendar_month,
                  color: Color(0xFF7C7C7C),
                ),
                onTap: () {
                  Add2Calendar.addEvent2Cal(
                    buildEvent(widget.date, widget.location,
                        widget.eventName!, widget.name),
                  );
                },
              ),
              const Gap(5),
              BlocProvider(
                create: (context) => ToggleFavoriteBloc(widget.id),
                child: BlocListener<ToggleFavoriteBloc, ToggleFavoriteState>(
                  listener: (context, state) async {
                    if (state is ToggleFavoriteSuccessfulState) {
                      EasyLoading.show();
                    }
                  },
                  child: BlocBuilder<ToggleFavoriteBloc, ToggleFavoriteState>(
                    builder: (context, state) {
                      if (state is ToggleFavoriteLoadingState) {
                        return const Center(
                          child: CircularProgressIndicator(
                            color: kPrimaryColor,
                          ),
                        );
                      } else if (state is ToggleFavoriteErrorState) {
                        return const Text("error");
                      }
                      return widget.isFavorite
                          ? toggleEvent(widget.id)
                          : toggleEvent(widget.id);
                    },
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget toggleEvent(int id) {
    final ToggleFavoriteBloc toggleFavoriteBloc = ToggleFavoriteBloc(id);
    return CustomIcon(
      onTap: () {
        setState(() {
          toggle = !toggle;
          toggleFavoriteBloc.add(ToggleFavoriteInitialFetchEvent());
        });
      },
      icon: toggle
          ? const Icon(
        Icons.favorite_outline,
        color: Colors.redAccent,
      )
          : const Icon(
        Icons.favorite_outline,
        color: Color(0xFF7C7C7C),
      ),
    );
  }
}
