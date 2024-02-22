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

class SearchBody extends StatefulWidget {
  const SearchBody({
    super.key,
    required this.size,
  });

  final Size size;

  @override
  State<SearchBody> createState() => _SearchBodyState();
}

class _SearchBodyState extends State<SearchBody> {
  RangeValues values = const RangeValues(1.0, 10.0);

  final EventCategoryBloc eventCategoryBloc = EventCategoryBloc();

  final ListEventBloc listEventBloc = ListEventBloc();

  final TextEditingController _timeAndDateFromContoller =
      TextEditingController();
  final TextEditingController _timeAndDateToContoller = TextEditingController();
  DateTimeRange? _dateTimeRange = null;

  @override
  void initState() {
    eventCategoryBloc.add(EventCategoryInitialFetchEvent());
    listEventBloc.add(ListEventInitialFetchEvent());
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
            const Gap(20),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 24,
                vertical: 20,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  InkWell(
                    onTap: () {},
                    borderRadius: BorderRadius.circular(10),
                    child: const Icon(Icons.arrow_back),
                  ),
                  const Gap(10),
                  const Text(
                    "EVENT SEARCH",
                    style: homeLabelStyle,
                  ),
                  Text(
                    "Discover what’s going on",
                    style: secondaryTextStyle,
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 24,
                vertical: 10,
              ),
              child: Row(
                children: [
                  Expanded(
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
                  const Gap(16),
                  InkWell(
                    onTap: () async {
                      // _showFilterPopUp(
                      //   context,
                      //   _timeAndDateContoller
                      //   );
                      _showFilterPopUp(context, _timeAndDateFromContoller,
                          _timeAndDateToContoller);
                    },
                    // onTap: (){},
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
                return const Text("");
              }),
        ),
      ],
    );
  }

  Future<void> _showDatePicker(BuildContext c) async {
    final DateTimeRange? picked = await showDateRangePicker(
        context: c,
        firstDate: DateTime.now().subtract(const Duration(days: 365 * 5)),
        lastDate: DateTime.now().add(const Duration(days: 365 * 5)),
        initialDateRange: _dateTimeRange,
        initialEntryMode: DatePickerEntryMode.calendarOnly,
        builder: (context, child) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ConstrainedBox(
                constraints: BoxConstraints(
                    maxWidth: MediaQuery.sizeOf(context).width * 0.8,
                    maxHeight: MediaQuery.sizeOf(context).height * 0.8),
                child: child,
              )
            ],
          );
        });
    if (picked != null) {
      _dateTimeRange = picked;
    }
  }

  Future<void> _showFilterPopUp(
      BuildContext co,
      TextEditingController dateAndTimeFromController,
      TextEditingController dateAndTimeToController) async {
    RangeLabels labels = RangeLabels(
      values.start.round().toString(),
      values.end.round().toString(),
    );
    return showModalBottomSheet(
        isScrollControlled: false,
        backgroundColor: Colors.white,
        scrollControlDisabledMaxHeightRatio: 0.50,
        context: co,
        builder: (context) {
          return StatefulBuilder(
              builder: (BuildContext context, StateSetter setState) {
            return Padding(
              padding: const EdgeInsets.only(left: 24, top: 20, right: 24),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Gap(20),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "ADVANCED SEARCH",
                        style: homeLabelStyle,
                      ),
                      Text(
                        "You can filter the result from here!",
                        style: secondaryTextStyle,
                      ),
                    ],
                  ),
                  const Gap(20),
                  const Text(
                    "Cost",
                    style: homeLabelStyle,
                  ),
                  const Gap(20),
                  RangeSlider(
                    values: values,
                    min: 1,
                    max: 10,
                    divisions: 10,
                    labels: labels,
                    activeColor: Color(0xFFFF73C6),
                    onChanged: (value) {
                      setState(() {
                        values = value;
                        labels = RangeLabels(
                          value.start.round().toString(),
                          value.end.round().toString(),
                        );
                        print("${this.values}");
                      });
                    },
                  ),
                  const Gap(20),
                  const Text(
                    "When",
                    style: homeLabelStyle,
                  ),
                  const Gap(10),
                  GestureDetector(
                    onTap: () {
                      _showDatePicker(
                        context,
                      );
                    },
                    child: Container(
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: kDividerColor, width: 1.5),
                      ),
                      child: Row(
                        children: [
                          const Gap(16),
                          if (_dateTimeRange == null)
                            Text(
                              "Event date ",
                              style: secondaryTextStyle,
                            )
                          else
                            Text(
                              "From ${_dateTimeRange?.start.day}/${_dateTimeRange?.start.month}/${_dateTimeRange?.start.year}  to  ${_dateTimeRange?.end.day}/${_dateTimeRange?.end.month}/${_dateTimeRange?.end.year} ",
                              style: secondaryTextStyle,
                            ) ,
                        ],
                      ),
                    ),
                  ),

                  // CustomInput(
                  //   title: "Event date and time",
                  //   controller: dateAndTimeFromController,
                  //   enabled: true,
                  // ),
                  //
                  // // const Gap(10),
                  // const Text(
                  //   "\tTo",
                  //   style: homeLabel4Style,
                  // ),
                  // CustomInput(
                  //   title: "Event date and time",
                  //   controller: dateAndTimeToController,
                  //   enabled: true,
                  // ),
                  const Gap(20),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 0),
                    child: MainCustomButton(
                      buttonName: "APPLY",
                      onPressed: () {},
                      backgroundColor: kPrimaryColor,
                    ),
                  ),
                ],
              ),
            );
          });
        });
  }
}
