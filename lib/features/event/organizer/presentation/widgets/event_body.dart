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
import 'package:alafein/features/event/organizer/presentation/views/event_search.dart';

import 'package:alafein/features/event/organizer/presentation/widgets/custom_appbar.dart';
import 'package:alafein/features/event/organizer/presentation/widgets/custom_event_image.dart';
import 'package:alafein/features/event/organizer/presentation/widgets/information_event.dart';

// import 'package:alafein/features/event/organizer/presentation/widgets/list_view_event.dart';
import 'package:alafein/features/main/main_screen.dart';
import 'package:auto_route/auto_route.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

// import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:gap/gap.dart';
import 'package:svg_flutter/svg.dart';

import 'package:liquid_pull_to_refresh/liquid_pull_to_refresh.dart';

import '../../../../../core/presentation/routes/app_router.gr.dart';
import '../model/event_data_ui_model.dart';

class Eventbody extends StatefulWidget {
  const Eventbody({super.key, required this.size, required this.catId});

  final Size size;
  final int catId;

  @override
  State<Eventbody> createState() => _EventbodyState();
}

class _EventbodyState extends State<Eventbody> {
  RangeValues values = const RangeValues(1.0, 10.0);

  int selectedIndex = 0;

  final EventCategoryBloc eventCategoryBloc = EventCategoryBloc();

  late ListEventBloc listEventBloc = ListEventBloc();

  List<EventDataUiModel> eventCategories = List.empty(growable: true);

  final TextEditingController _timeAndDateFromContoller =
      TextEditingController();
  final TextEditingController _timeAndDateToContoller = TextEditingController();

  @override
  void initState() {
    selectedIndex = widget.catId;
    print("I'M HERE $selectedIndex");
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

  Future<void> _refresh() async {
    EasyLoading.show(status: 'Loading...');
    listEventBloc.add(ListEventInitialFetchEvent(
      isCategory: selectedIndex == 0 ? false : true,
      categoryId: eventCategories.elementAt(selectedIndex).id,
    ));

    await Future.delayed(const Duration(seconds: 1));
    EasyLoading.dismiss();
    return Future.delayed(const Duration(milliseconds: 10));
  }

  @override
  Widget build(BuildContext context) {
    if (MainScreen.isClicked && eventCategories.isNotEmpty) {
      selectedIndex = MainScreen.catId;
      listEventBloc.add(ListEventInitialFetchEvent(
          isCategory: selectedIndex == 0 ? false : true,
          categoryId: eventCategories.elementAt(selectedIndex).id));
      MainScreen.isClicked = false;
    }
    return LiquidPullToRefresh(
      showChildOpacityTransition: false,
      color: Colors.transparent,
      onRefresh: _refresh,
      child: CustomScrollView(
        // physics: const NeverScrollableScrollPhysics(),
        slivers: [
          SliverToBoxAdapter(
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              const Gap(16),
              CustomAppBarEvent(
                title1: "Events".tr().toUpperCase(),
                title2: "Discover what's going on".tr(),
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
                          if (SessionManagement.getUserRole() != "") {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const EventSearch()));
                          } else {}
                        },
                        child: Container(
                          padding: const EdgeInsets.all(12),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border:
                                Border.all(color: kDividerColor, width: 1.5),
                          ),
                          child: Row(
                            children: [
                              SvgPicture.asset(
                                AssetsData.search,
                                color: const Color(0xFF7C7C7C),
                              ),
                              const Gap(16),
                              Text(
                                "Search".tr(),
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
                        if (SessionManagement.getUserRole() != "") {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const EventSearch()));
                        } else {}
                        /*
                        _showFilterPopUp(
                          context,
                          _timeAndDateFromContoller,
                          _timeAndDateToContoller
                        );*/
                        // Navigator.push(
                        //     context,
                        //     MaterialPageRoute(
                        //         builder: (context) => EventSearch()));
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
              Image.asset(
                AssetsData.bottomBanner,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 24, top: 15),
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
                          eventCategories = successState.eventCatigories;
                          return ListView.separated(
                            itemCount: successState.eventCatigories.length,
                            scrollDirection: Axis.horizontal,
                            separatorBuilder: (context, index) =>
                                const SizedBox(
                              width: 15,
                            ),
                            itemBuilder: (context, index) => SizedBox(
                              child: InkWell(
                                onTap: () {
                                  selectedIndex = index;
                                  setState(() {
                                    listEventBloc
                                        .add(ListEventInitialFetchEvent(
                                      isCategory:
                                          selectedIndex == 0 ? false : true,
                                      categoryId: successState.eventCatigories
                                          .elementAt(index)
                                          .id,
                                    ));
                                  });
                                },
                                borderRadius: BorderRadius.circular(17),
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    border: Border.all(
                                        color: selectedIndex == index
                                            ? const Color(0xFFEDEDED)
                                            : Colors.white,
                                        width: 3),
                                  ),
                                  child: Column(
                                    children: [
                                      ClipRRect(
                                        borderRadius: BorderRadius.circular(17),
                                        child: successState
                                                    .eventCatigories[index]
                                                    .id ==
                                                0
                                            ? Image.asset(
                                                'assets/images/all-icon.jpg',
                                                width: 70,
                                                fit: BoxFit.fitWidth,
                                              )
                                            : CachedNetworkImage(
                                                width: 70,
                                                imageUrl:
                                                    "${APICallerConfiguration.baseImageUrl}${successState.eventCatigories[index].image}",
                                                fit: BoxFit.fitWidth,
                                                errorWidget:
                                                    (context, url, error) =>
                                                        Image.asset(
                                                  AssetsData.eventImg,
                                                  fit: BoxFit.contain,
                                                ),
                                              ),
                                      ),
                                      const Gap(8),
                                      Text(
                                        successState.eventCatigories[index].name
                                            .tr(),
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
                      // EasyLoading.showError("Error");
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
                listener: (context, state) {
                  if (state is ListEventErrorState) {
                    // Handle error state
                    print('Error State: ${state.listEvent}');
                    EasyLoading.showError("An error has occurred");
                  }
                },
                builder: (context, state) {
                  // Debugging current state
                  print('Current State: $state');

                  switch (state.runtimeType) {
                    case ListEventLoadingState:
                      EasyLoading.show();
                      return Center(child: CircularProgressIndicator());

                    case ListEventErrorState:
                      EasyLoading.showError("An error has occurred");
                      return Center(child: Text('Failed to fetch events.'));

                    case ListEventFetchingSuccessfulState:
                      EasyLoading.dismiss();
                      final successState =
                          state as ListEventFetchingSuccessfulState;

                      // Print listEvent for debugging
                      print('Fetched Events: ${successState.listEvent}');

                      if (successState.listEvent.isNotEmpty) {
                        final firstEvent = successState.listEvent.first;

                        // Debug firstEvent to check its properties
                        print('First Event: $firstEvent');

                        if (firstEvent.id == null &&
                            firstEvent.poster == null &&
                            firstEvent.nameEn == null &&
                            firstEvent.venue == null &&
                            firstEvent.date == null &&
                            firstEvent.isFavourite == null) {
                          print('Error: Invalid token or event data');
                          SessionManagement.signOut();
                          AutoRouter.of(context)
                              .replaceAll([const LoginRoute()]);
                        }
                      }
                      String? currentLocale = EasyLocalization.of(context)!.currentLocale?.languageCode;

                      return successState.listEvent.isEmpty
                          ? const Center(
                              child: Text(
                              "No Data found",
                              style: homeLabelStyle,
                            ))
                          : ListView.separated(
                              physics: const AlwaysScrollableScrollPhysics(),
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
                                                    .listEvent[index].id ??
                                                0, //bloc.event!.id!,
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
                                      child: Row(
                                        children: [
                                          CustomEventImage(
                                            imageurl:
                                                "${APICallerConfiguration.baseImageUrl}${successState.listEvent[index].poster}",
                                          ),
                                          SizedBox(
                                            width: MediaQuery.sizeOf(context)
                                                    .width *
                                                0.05,
                                          ),
                                          Expanded(
                                            child: InformationEvent(
                                              // name: successState
                                              //         .listEvent[index].name ??
                                              //     "",
                                              name: currentLocale == 'en'
                                                  ? (successState
                                                  .listEvent[index].nameEn != null &&
                                                  successState
                                                      .listEvent[index].nameEn?.toLowerCase() != "none"
                                                  ? successState
                                                  .listEvent[index].nameEn
                                                  : (successState
                                                  .listEvent[index].nameAr ?? ""))
                                                  : (successState
                                                  .listEvent[index].nameAr != null &&
                                                  successState
                                                      .listEvent[index].nameAr?.toLowerCase() != "none"
                                                  ? successState
                                                  .listEvent[index].nameAr
                                                  : (successState
                                                  .listEvent[index].nameEn ?? "")),
                                              date: successState
                                                      .listEvent[index].date ??
                                                  "",
                                              venue: successState
                                                      .listEvent[index]
                                                      .venue
                                                      ?.name ??
                                                  "",
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                );
                              },
                            );
                  }
                  return const Text("");
                }),
          ),
        ],
      ),
    );
  }
}
