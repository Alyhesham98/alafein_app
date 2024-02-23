import 'package:alafein/core/api/constants/api_caller_config.dart';
import 'package:alafein/core/presentation/widgets/main_custom_button.dart';
import 'package:alafein/core/utility/assets_data.dart';
import 'package:alafein/core/utility/colors_data.dart';
import 'package:alafein/core/utility/theme.dart';

import 'package:alafein/features/event/organizer/presentation/bloc_filter/filter_bloc.dart';
import 'package:alafein/features/event/organizer/presentation/views/event_deatils.dart';

import 'package:alafein/features/event/organizer/presentation/widgets/custom_event_image.dart';
import 'package:alafein/features/event/organizer/presentation/widgets/custom_input_field.dart';
import 'package:alafein/features/event/organizer/presentation/widgets/information_event.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

import 'package:gap/gap.dart';
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
  final TextEditingController _searchController= TextEditingController() ;
  DateTimeRange? _dateTimeRange = null;

  RangeValues values = const RangeValues(1.0, 10.0);
  final FilterBloc filterBloc = FilterBloc();

  final TextEditingController _timeAndDateFromContoller =
      TextEditingController();
  final TextEditingController _timeAndDateToContoller = TextEditingController();

  @override
  void initState() {
    // eventCategoryBloc.add(EventCategoryInitialFetchEvent());
    filterBloc.add(FilterInitialEvent(
      pageNumber: 1,
      pageSize: 500,
      name: null.toString(),
      dateFrom:"2000-02-23T13:16:57.785Z",
      dateTo: "2050-02-23T13:16:57.785Z",
      minFeeCost:0.0,
      maxFeeCost:0.0,
    ));
    super.initState();
  }
  
Future<void> _refresh()async{
    // initState();
      EasyLoading.show(status: 'Loading...');
      // filter.add(FilterInitialEvent());
    // setState(() {});
      EasyLoading.dismiss();
    return Future.delayed(const Duration(microseconds: 1),
    );
  }
  @override
  void dispose() {
    _searchController.dispose();
    _timeAndDateFromContoller.dispose();
    _timeAndDateToContoller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // FilterBloc  filter = FilterBloc(
    //   1, 
    //   500, 
    //   _searchController.text, 
    //   "${_dateTimeRange?.start.year}-${_dateTimeRange?.start.month}-${_dateTimeRange?.start.day}",
    //   "${_dateTimeRange?.end.year}-${_dateTimeRange?.end.month}-${_dateTimeRange?.end.day}",
    //   0.0, // values.start,
    //   0.0 // values.end
    // );
    var size = MediaQuery.of(context).size;
    return CustomScrollView(
      physics: const NeverScrollableScrollPhysics(),
      slivers: [
        SliverToBoxAdapter(
          child:
          Column(
            crossAxisAlignment: CrossAxisAlignment.start, 
            children: [
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
                    onTap: () =>Navigator.pop(context),
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
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: kDividerColor, width: 1.5),
                      ),
                      child: CustomInputTextFieldWidget(
                        hintText: 'Search',
                        secure: false,
                        controller: _searchController,
                      ),
                    ),
                  ),
                  const Gap(16),
                  InkWell(
                    onTap: () async {
                      _showFilterPopUp(
                        context, 
                      );
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
          // hasScrollBody: true,
          child: BlocConsumer<FilterBloc, FilterState>(
            bloc: filterBloc,
            listenWhen: (previous, current) =>
                current is FilterActionState,
            buildWhen: (previous, current) =>
                current is !FilterActionState,
            listener: (context, state) async{
              _refresh();
            },
            builder: (context, state) {
            switch (state.runtimeType) {
              case FilterLoadingState:
                EasyLoading.show();
              case FilterErrorState:
                EasyLoading.dismiss();
                EasyLoading.showError("An Error Has been ouccerd");
              case FilterSuccessfulState:
                EasyLoading.dismiss();
                final successState = state as FilterSuccessfulState;
              return ListView.separated(
                physics: const BouncingScrollPhysics(),
                shrinkWrap: true,
                padding: EdgeInsets.zero,
                itemCount: successState.filterList.length,
                separatorBuilder: (context, index) => Container(
                  width: double.infinity,
                  height: 1,
                  color: const Color(0xffECECEC),
                ),
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: 10,
                      horizontal: 20,
                    ),
                    child: SizedBox(
                      height: 100,
                      child: Row(
                        children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => EventDeatils(index: successState.filterList[index].id,),
                              ),
                            );
                          },
                          child:  CustomEventImage(
                            imageurl: successState.filterList[index].poster != null ?"${APICallerConfiguration.baseImageUrl}${successState.filterList[index].poster}": "",
                          ),
                        ),
                        SizedBox(
                          width: size.width * 0.05,
                        ),
                          Expanded(
                          child: Row(
                            children: [
                              InformationEvent(
                                name: successState.filterList[index].name,
                                date: successState.filterList[index].date,
                                venue: successState.filterList[index].venue.name,
                              ),
                            ],
                          ),
                        ),
                      ]),
                    ),
                  );
                  },
                );
              }
              return const SizedBox();
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
      setState(() {
      });
      _dateTimeRange = picked;
    }
  }

  Future<void> _showFilterPopUp(
      BuildContext co,
      ) async {
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
                      onPressed: () async{
                        Navigator.of(context).pop();
                        print("\n${_searchController.text}\n${_dateTimeRange}\n${values} ");
                        filterBloc.add(FilterInitialEvent(
                            pageNumber: 1,
                            pageSize: 500,
                            name: _searchController.text,
                            dateFrom:"${_dateTimeRange?.start.year}-${_dateTimeRange?.start.month}-${_dateTimeRange?.start.day}",
                            dateTo: "${_dateTimeRange?.end.year}-${_dateTimeRange?.end.month}-${_dateTimeRange?.end.day}",
                            minFeeCost:0.0,
                            maxFeeCost:0.0,
                          ));
                        // BlocProvider.of<FilterBloc>(context).add(
                        // FilterInitialEvent(
                        //   pageNumber: 1, 
                        //   pageSize: 500, 
                        //   categoryName: _searchController.text, 
                        //   dateFrom: "${_dateTimeRange?.start.year}-${_dateTimeRange?.start.month}-${_dateTimeRange?.start.day}", 
                        //   dateTo: "${_dateTimeRange?.end.year}-${_dateTimeRange?.end.month}-${_dateTimeRange?.end.day}", 
                        //   minFeeCost: 0.0, 
                        //   maxFeeCost: 0.0)
                        // );
                        
                        //   filter.add(FilterInitialEvent());
                        await Future.delayed(const Duration(milliseconds: 300));
                        // await _refresh();
                        //////////////////////////////////////////////////////////////////
                      },
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
