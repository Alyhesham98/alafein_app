import 'package:alafein/core/local_data/session_management.dart';
import 'package:alafein/core/api/constants/api_caller_config.dart';
import 'package:alafein/core/presentation/widgets/main_custom_button.dart';
import 'package:alafein/core/utility/assets_data.dart';
import 'package:alafein/core/utility/colors_data.dart';
import 'package:alafein/core/utility/strings.dart';
import 'package:alafein/core/utility/theme.dart';
import 'package:alafein/features/event/organizer/cubit/get_event_cubit.dart';

// import 'package:alafein/features/event/organizer/cubit/get_event_cubit.dart';
// import 'package:alafein/features/event/organizer/cubit/get_event_state.dart';
import 'package:alafein/features/event/organizer/presentation/bloc/event_category_bloc.dart';
import 'package:alafein/features/event/organizer/presentation/bloc_listEvent/list_event_bloc.dart';
import 'package:alafein/features/event/organizer/presentation/views/event_deatils.dart';
import 'package:alafein/features/event/organizer/presentation/views/event_search.dart';

import 'package:alafein/features/event/organizer/presentation/widgets/custom_appbar.dart';
import 'package:alafein/features/event/organizer/presentation/widgets/custom_button_comment.dart';
import 'package:alafein/features/event/organizer/presentation/widgets/custom_event_image.dart';
import 'package:alafein/features/event/organizer/presentation/widgets/custom_icon.dart';
import 'package:alafein/features/event/organizer/presentation/widgets/information_event.dart';

// import 'package:alafein/features/event/organizer/presentation/widgets/list_view_event.dart';
import 'package:alafein/features/event/organizer/presentation/widgets/search_items.dart';
import 'package:alafein/features/profile_page/presentation/widgets/custom_text_field_item.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

// import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_builder/responsive_builder.dart';
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
  RangeValues values = const RangeValues(1.0, 10.0);

  int selectedIndex=0;
  final EventCategoryBloc eventCategoryBloc = EventCategoryBloc();

  late ListEventBloc listEventBloc = ListEventBloc();

  final TextEditingController _timeAndDateFromContoller =
      TextEditingController();
  final TextEditingController _timeAndDateToContoller = TextEditingController();

  @override
  void initState() {
    eventCategoryBloc.add(EventCategoryInitialFetchEvent());
    listEventBloc
        .add(ListEventInitialFetchEvent(isCategory: false, categoryId: 0));
    super.initState();
  }

  @override
  void dispose() {
    _timeAndDateFromContoller.dispose();
    _timeAndDateToContoller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      physics: const NeverScrollableScrollPhysics(),
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
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 24,
                vertical: 20,
              ),
              child: Row(
                children: [
                  Expanded(
                    child: InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => EventSearch()));
                      },
                      child: Container(
                        padding: const EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(color: kDividerColor, width: 1.5),
                        ),
                        child: Row(
                          children: [
                            SvgPicture.asset(
                              AssetsData.search,
                              color: const Color(0xFF7C7C7C),
                            ),
                            const Gap(16),
                            Text(
                              "Search",
                              style: secondaryTextStyle,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  const Gap(16),
                  InkWell(
                    onTap: () async {
/*
                      _showFilterPopUp(
                        context,
                        _timeAndDateFromContoller,
                        _timeAndDateToContoller
                      );*/
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => EventSearch()));
                    },
                    child: Container(
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: kDividerColor, width: 1.5),
                      ),
                      child: SvgPicture.asset(
                        AssetsData.svgIcEventicon,
                        color: const Color(0xFF7C7C7C),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            //  SearchItems(
            //   onTap: (){
            //     var commentValue;
            //     return  _showCommentPopUp(context, commentValue, id);
            //   }
            //   ),
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
                        EasyLoading.showError('Oops.. Something went wrong');
                      case EventCategoryLoadingState:
                        EasyLoading.show();
                      case EventCategoryFetchingSuccessfulState:
                        EasyLoading.dismiss();
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
                              onTap: () {

                                selectedIndex=index;

                                  setState(() {
                                    listEventBloc.add(
                                        ListEventInitialFetchEvent(
                                            isCategory:selectedIndex==0?false: true,
                                            categoryId: successState
                                                .eventCatigories
                                                .elementAt(index)
                                                .id));
                                  });

                              },
                              borderRadius: BorderRadius.circular(17),
                              child: Container(
                                decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(color:
                                selectedIndex==index?Color(0xFFEDEDED):Colors.white, width:3),
                              ),
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
                          ),
                        );

                      default:
                        return Container();
                    }
                    EasyLoading.showError("Error");
                    return Container();
                  },
                ),
              ),
            ),
          ]),
        ),
        SliverFillRemaining(
          hasScrollBody: true,
          child: BlocConsumer<ListEventBloc, ListEventState>(
              bloc: listEventBloc,
              listenWhen: (previous, current) =>
                  current is ListEventActionState,
              buildWhen: (previous, current) =>
                  current is! ListEventActionState,
              listener: (context, state) {},
              builder: (context, state) {
                switch (state.runtimeType) {
                  case ListEventLoadingState:
                    EasyLoading.show();
                  case ListEventErrorState:
                    EasyLoading.showError("An error has been ouccer");
                  case ListEventFetchingSuccessfulState:
                    EasyLoading.dismiss();
                    final successState =
                        state as ListEventFetchingSuccessfulState;
                    return ListView.separated(
                      physics: const BouncingScrollPhysics(),
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
                                    index: successState
                                        .listEvent[index].id, //bloc.event!.id!,
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
                                  imageurl:
                                      "${APICallerConfiguration.baseImageUrl}${successState.listEvent[index].poster}",
                                ),
                                SizedBox(
                                  width:
                                      MediaQuery.sizeOf(context).width * 0.05,
                                ),
                                InformationEvent(
                                  name: "${successState.listEvent[index].name}",
                                  date: "${successState.listEvent[index].date}",
                                  venue:
                                      "${successState.listEvent[index].venue.name}",
                                ),
                              ]),
                            ),
                          ),
                        );
                      },
                    );
                }
                return Text("");
              }),
        ),
      ],
    );
  }
}
