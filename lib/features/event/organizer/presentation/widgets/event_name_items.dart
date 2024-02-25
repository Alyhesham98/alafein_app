import 'package:alafein/core/utility/colors_data.dart';
import 'package:alafein/core/utility/theme.dart';
import 'package:alafein/features/event/organizer/presentation/widgets/custom_event_image.dart';
import 'package:alafein/features/event/organizer/presentation/widgets/custom_icon.dart';
import 'package:alafein/features/favourite/presentation/toggle_bloc/toggle_favorite_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:gap/gap.dart';

import '../../../../create_event/organizer/cubit/toggle_fav_cubit.dart';
import '../../cubit/get_event_cubit.dart';
import '../../cubit/get_event_state.dart';

class EventName extends StatefulWidget {
  const EventName({
    super.key,
    required this.size,
    required this.imageurl,
    required this.name,
    required this.index,
    required this.onTap,
    required this.id,
    required this.isFavorite,
  });

  final Size size;
  final int index;
  final String imageurl;
  final String name;
  final Function onTap;
  final int id;
  final bool  isFavorite;


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
  // bool toggle = widget.isFavorite;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
      child: Row(children: [
        CustomEventImage(
          imageurl: widget.imageurl,
        ),
        SizedBox(
          width: widget.size.width * 0.05,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width * .25,
              child: Text(
                widget.name,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: homeLabelStyle,
              ),
            ),
            const Gap(2),
            Text(
              "Event organizer",
              style: secondaryTextStyle,
            ),
          ],
        ),
        const Gap(25),
        Expanded(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Gap(25),/*
              CustomIcon(
                icon: const Icon(
                  Icons.calendar_month,
                  color: Color(0xFF7C7C7C),
                ),
                onTap: () {},
              ),*/
              // CustomIcon(
              //   icon: const Icon(
              //     Icons.favorite_border_outlined,
              //     color: Color(0xFF7C7C7C),
              //   ),
              //   onTap: () {
              //     print("object");
              //   },
              // ),
            BlocProvider(
              create: (context)=>ToggleFavoriteBloc(
                widget.id
              ),
              child: BlocListener<ToggleFavoriteBloc,ToggleFavoriteState>(
                  listener: (context,state)async{
                    if(state is ToggleFavoriteSuccessfulState){
                      //change color
                      EasyLoading.show();
                    }
                  },
                  child:BlocBuilder<ToggleFavoriteBloc,ToggleFavoriteState>(
                    builder: (context,state){
                      if (state is ToggleFavoriteLoadingState) {
                          return const Center(
                            child: CircularProgressIndicator(
                          color: kPrimaryColor,
                        ));} else if( state is ToggleFavoriteErrorState){
                          return const Text("error");
                        }
                        // bool x = widget.isFavorite;

                        // final ToggleFavoriteBloc toggleFavoriteBloc = ToggleFavoriteBloc(widget.id);
                        return 
                         widget.isFavorite ? toggleEvent(widget.id) : toggleEvent(widget.id);                                    
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ]),
    );
  }



  Widget toggleEvent (int id){
    final ToggleFavoriteBloc toggleFavoriteBloc = ToggleFavoriteBloc(id);
    return CustomIcon(
          onTap: (){
           setState(() {
            toggle = !toggle;
            toggleFavoriteBloc.add(ToggleFavoriteInitialFetchEvent());
           });
          },
        icon: toggle ? 
         const Icon(
        Icons.favorite_outline,
        color:Colors.redAccent,
        ) 
        : 
        const Icon(
        Icons.favorite_outline,
        color: Color(0xFF7C7C7C),
        ),
      );
  }
}