import 'package:alafein/core/api/constants/api_caller_config.dart';
import 'package:alafein/core/utility/assets_data.dart';
import 'package:alafein/core/utility/theme.dart';
import 'package:alafein/features/event/organizer/cubit/get_event_cubit.dart';
import 'package:alafein/features/event/organizer/cubit/get_event_state.dart';
import 'package:alafein/features/event/organizer/presentation/bloc/event_category_bloc.dart';

import 'package:alafein/features/event/organizer/presentation/widgets/custom_appbar.dart';
import 'package:alafein/features/event/organizer/presentation/widgets/list_event_category_items.dart';
// import 'package:alafein/features/home/presentation/widgets/list_event_items.dart';
import 'package:alafein/features/event/organizer/presentation/widgets/list_view_event.dart';
import 'package:alafein/features/event/organizer/presentation/widgets/search_items.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:svg_flutter/svg.dart';

class Eventbody extends StatefulWidget {
  const Eventbody({
    super.key,
    required this.size,
  });

  final Size size;

  @override
  State<Eventbody> createState() => _EventbodyState();
}

class _EventbodyState extends State<Eventbody> {
  
  final EventCategoryBloc eventCategoryBloc = EventCategoryBloc();

  @override
  void initState() {
    eventCategoryBloc.add(EventCategoryInitialFetchEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      physics: const BouncingScrollPhysics(),
      slivers: [
        SliverToBoxAdapter(
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            const Gap(16),
            const CustomAppBarEvent(
              title1: "EVENTS",
              title2: "Discover what’s going on",
            ),
            const SearchItems(),
            Image.asset(
              AssetsData.bottomBanner,
            ),
             Padding(
              padding: const EdgeInsets.only(left: 24, top: 22),
              child: SizedBox(
                height: 120,
                // child: Center()//ListEventCategoryItems(),////////////////
                child:BlocConsumer<EventCategoryBloc,EventCategoryState>(
                  bloc: eventCategoryBloc,
                  listenWhen: (previous, current) => current is EventCategoryActionState,
                  buildWhen: (previous, current) => current is !EventCategoryActionState,
                  listener: (context,state){
                
                  },
                  builder: (context,state){
                    switch(state.runtimeType){
                      case EventCategoryFetchingSuccessfulState : 
                      final successState = state as EventCategoryFetchingSuccessfulState;
                      return  ListView.separated(
                              itemCount: successState.eventCatigories.length,
                              scrollDirection: Axis.horizontal,
                              separatorBuilder: (context, index) => const SizedBox(
                                width: 20,
                              ),
                              itemBuilder: (context, index) => SizedBox(
                                child: Column(
                                  children: [
                                    // SvgPicture.network(
                                    //     "${APICallerConfiguration.baseImageUrl}${successState.eventCatigories[index].image}",
                                    //     placeholderBuilder: (context) =>
                                    //         Image.asset(AssetsData.music),
                                    //   ),
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(17),
                                      child: AspectRatio(
                                        aspectRatio: 1 / 1,
                                        child: CachedNetworkImage(
                                          imageUrl: "${APICallerConfiguration.baseImageUrl}${successState.eventCatigories[index].image}",
                                          fit: BoxFit.contain,
                                          errorWidget: (context, url, error) => Image.asset(
                                            AssetsData.eventImg,
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ),
                                    ),
                                    const Gap(4),
                                    Text(
                                      successState.eventCatigories[index].name,
                                      textAlign: TextAlign.center,
                                      style: homeLabel3Style,
                                    ),
                                  ],
                                ),
                              ),
                            );
                      // return Container(
                      //   child: ListView.builder(
                      //     itemCount: successState.eventCatigories.length,
                      //     itemBuilder: (context,index){
                            
                      //           // ListEventCategoryItems(
                      //       //     categoryLength:successState.eventCatigories.length,
                      //       //     name: successState.eventCatigories[index].name,
                      //       //     imageUrl: successState.eventCatigories[index].image,
                      //       // );
                      //       // Container(
                      //       //   child: Column(
                      //       //     children: [
                      //       //       Text(successState.eventCatigories[index].name),
                      //       //       Text(""),
                      //       //       Text(successState.eventCatigories[index].image)
                      //       //     ],
                      //       //   ),
                      //       // );
                      //     },  
                      //   ),
                      // );
                    }
                    // default:
                    return SizedBox(child: Text("======================================="),);
                  }, 
                  ),
              ),
            ),
          ]),
        ),
        SliverFillRemaining(
          child: BlocBuilder<GetEventCubit, GetEventState>(
            builder: (context, state) {
              return ListViewEvent(
                size: widget.size,
              );
            },
          ),
        ),
      ],
    );
  }
}
