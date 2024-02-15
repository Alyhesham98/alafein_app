import 'package:alafein/core/local_data/session_management.dart';
import 'package:alafein/core/api/constants/api_caller_config.dart';
import 'package:alafein/core/utility/assets_data.dart';
import 'package:alafein/core/utility/colors_data.dart';
import 'package:alafein/core/utility/theme.dart';
// import 'package:alafein/features/event/organizer/cubit/get_event_cubit.dart';
// import 'package:alafein/features/event/organizer/cubit/get_event_state.dart';
import 'package:alafein/features/event/organizer/presentation/bloc/event_category_bloc.dart';
import 'package:alafein/features/event/organizer/presentation/bloc_listEvent/list_event_bloc.dart';
import 'package:alafein/features/event/organizer/presentation/views/event_deatils.dart';

import 'package:alafein/features/event/organizer/presentation/widgets/custom_appbar.dart';
import 'package:alafein/features/event/organizer/presentation/widgets/custom_event_image.dart';
import 'package:alafein/features/event/organizer/presentation/widgets/information_event.dart';

// import 'package:alafein/features/event/organizer/presentation/widgets/list_view_event.dart';
import 'package:alafein/features/event/organizer/presentation/widgets/search_items.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:gap/gap.dart';

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

  final ListEventBloc listEventBloc = ListEventBloc();

  @override
  void initState() {
    eventCategoryBloc.add(EventCategoryInitialFetchEvent());
    listEventBloc.add(ListEventInitialFetchEvent());
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
            Padding(
              padding: const EdgeInsets.only(left: 24, top: 22),
              child: SizedBox(
                height: 120,
                // child: Center()//ListEventCategoryItems(),////////////////
                child: BlocConsumer<EventCategoryBloc, EventCategoryState>(
                  bloc: eventCategoryBloc,
                  listenWhen: (previous, current) =>
                      current is EventCategoryActionState,
                  buildWhen: (previous, current) =>
                      current is! EventCategoryActionState,
                  listener: (context, state) {},
                  builder: (context, state) {
                    switch (state.runtimeType) {
                      case EventCategoryErrorState:
                        return Text("Error Or data not found");
                      case EventCategoryLoadingState:
                        return const Center(child: CircularProgressIndicator(color: kPrimaryColor,),);
                      case EventCategoryFetchingSuccessfulState:
                        final successState =
                            state as EventCategoryFetchingSuccessfulState;
                        return ListView.separated(
                          itemCount: successState.eventCatigories.length,
                          scrollDirection: Axis.horizontal,
                          separatorBuilder: (context, index) => const SizedBox(
                            width: 20,
                          ),
                          itemBuilder: (context, index) => SizedBox(
                            child: InkWell(
                              onTap: () {},
                              borderRadius: BorderRadius.circular(17),
                              child: Column(
                                children: [
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(17),
                                    child: CachedNetworkImage(
                                      width: 70,
                                      imageUrl:
                                          "${APICallerConfiguration.baseImageUrl}${successState.eventCatigories[index].image}",
                                      fit: BoxFit.fitWidth,
                                      errorWidget: (context, url, error) =>
                                          Image.asset(
                                        AssetsData.eventImg,
                                        fit: BoxFit.contain,
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
                          ),
                        );
                      
                      default:
                        return Container();
                    }
                  },
                ),
              ),
            ),
          ]),
        ),
        // SliverFillRemaining(
        //   child: BlocBuilder<GetEventCubit, GetEventState>(
        //     builder: (context, state) {
        //       return ListViewEvent(
        //         size: widget.size,
        //       );
        //     },
        //   ),
        // ),

        SliverFillRemaining(
          child: BlocConsumer<ListEventBloc, ListEventState>(
            bloc: listEventBloc,
            listenWhen: (previous, current) =>
                current is ListEventActionState,
            buildWhen: (previous, current) =>
                current is! ListEventActionState,
            listener: (context, state) {},
            builder: (context, state) {
              switch (state.runtimeType) {
              case ListEventFetchingSuccessfulState:
                final successState =
                    state as ListEventFetchingSuccessfulState;
                return ListView.separated(
                      physics: const NeverScrollableScrollPhysics(),
                      padding: EdgeInsets.zero,
                      itemCount: successState.listEvent.length,
                      separatorBuilder: (context, index) => Container(
                        width: double.infinity,
                        height: 1,
                        color: const Color(0xffECECEC),
                      ),
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => EventDeatils(
                                    index: successState.listEvent[index].id,//bloc.event!.id!,
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
                                  imageurl: "${APICallerConfiguration.baseImageUrl}${successState.listEvent[index].poster}" ,
                                ),
                                SizedBox(
                                  width: MediaQuery.sizeOf(context).width * 0.05,
                                ),
                                InformationEvent(
                                  name: "${successState.listEvent[index].name}",
                                  date: "${successState.listEvent[index].date}",
                                  venue: "${successState.listEvent[index].venue.name}",
                                ),
                              ]),
                            ),
                          ),
                        );
                      },
                    );
                   
                // ListView.builder(
                //   itemCount: successState.listEvent.length,
                //   itemBuilder: (BuildContext context, int index) { 

                // );
              }
              return Text("No data");
            }
          ),
        ),

      ],
    );
  }
}
