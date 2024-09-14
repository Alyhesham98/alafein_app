// ignore_for_file: type_literal_in_constant_pattern

import 'package:alafein/core/api/constants/api_caller_config.dart';
import 'package:alafein/core/utility/assets_data.dart';
import 'package:alafein/core/utility/colors_data.dart';
import 'package:alafein/features/event/organizer/presentation/views/event_deatils.dart';
import 'package:alafein/features/event/organizer/presentation/widgets/custom_appbar.dart';
import 'package:alafein/features/favourite/presentation/favorite_list_bloc/favorite_list_bloc.dart';
import 'package:alafein/features/favourite/presentation/toggle_bloc/toggle_favorite_bloc.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:gap/gap.dart';
import 'package:alafein/features/event/organizer/presentation/widgets/custom_icon.dart';
import 'package:alafein/features/event/organizer/presentation/widgets/information_event.dart';
import 'package:alafein/features/event/organizer/presentation/widgets/custom_event_image.dart';
import 'package:liquid_pull_to_refresh/liquid_pull_to_refresh.dart';

class FavoritePage extends StatefulWidget {
  const FavoritePage({super.key});

  @override
  State<FavoritePage> createState() => _FavoritePageState();
}

class _FavoritePageState extends State<FavoritePage> {
  late final FavoriteListBloc favoriteListBloc;

  @override
  void initState() {
    super.initState();
    favoriteListBloc = FavoriteListBloc(1, 500, true);
    _loadFavorites();
  }

  Future<void> _loadFavorites() async {
    EasyLoading.show(status: 'Loading...');
    favoriteListBloc.add(FavoriteListInitialEvent());
  }


  Future<void> _refresh() async {
    EasyLoading.show(status: 'Loading...');
    favoriteListBloc.add(FavoriteListInitialEvent());
    await Future.delayed(const Duration(seconds: 1), () {
      EasyLoading.dismiss();
    });
  }

  @override
  Widget build(BuildContext context) {

    var size = MediaQuery.of(context).size;
    return SizedBox(
      height: double.infinity,
      child: LiquidPullToRefresh(
        color: Colors.transparent,
        showChildOpacityTransition: false,
        onRefresh: _refresh,
        child: SingleChildScrollView(
          physics: const AlwaysScrollableScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Gap(14),
               CustomAppBarEvent(
                title1: "Favorite".tr().toUpperCase() + " " + "Events".tr().toUpperCase(),
                title2: "Here's what you've liked so far".tr().toUpperCase(),
                hasIcon: false,
              ),
              const Gap(10),
              BlocConsumer<FavoriteListBloc, FavoriteListState>(
                  bloc: favoriteListBloc,
                  listenWhen: (previous, current) =>
                      current is FavoriteListActionState,
                  buildWhen: (previous, current) =>
                      current is! FavoriteListActionState,
                  listener: (context, state) async {
                    if (state is! FavoriteListActionState) {
                      if (state is FavoriteListLoadingState) {
                        EasyLoading.show(status: 'loading');
                      } else if (state is FavoriteListErrorState) {
                        EasyLoading.dismiss();
                        EasyLoading.showError("Error!");
                      }
                      _refresh();
                    }
                  },
                  builder: (context, state) {
                    switch (state.runtimeType) {
                      case FavoriteListLoadingState:
                        EasyLoading.show();
                      case FavoriteListErrorState:
                        EasyLoading.dismiss();
                        EasyLoading.showError("Error");
                      case FavoriteListSuccessfulState:
                        EasyLoading.dismiss();
                        final successState =
                            state as FavoriteListSuccessfulState;
                        return ListView.separated(
                          physics: const NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          padding: EdgeInsets.zero,
                          itemCount: successState.favoriteList.length,
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
                                child: Row(children: [
                                  GestureDetector(
                                    onTap: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => EventDeatils(
                                            index: successState
                                                .favoriteList[index].id,
                                          ),
                                        ),
                                      );
                                    },
                                    child: CustomEventImage(
                                      imageurl: successState
                                                  .favoriteList[index].poster != null
                                          ? "${APICallerConfiguration.baseImageUrl}${successState.favoriteList[index].poster}"
                                          : "",
                                    ),
                                  ),
                                  SizedBox(
                                    width: size.width * 0.05,
                                  ),
                                  Expanded(
                                    child: Row(
                                      children: [
                                        InformationEvent(
                                          name: successState
                                              .favoriteList[index].name,
                                          date: successState
                                              .favoriteList[index].date,
                                          venue: successState
                                              .favoriteList[index].venue.name,
                                        ),
                                        BlocProvider(
                                          create: (context) =>
                                              ToggleFavoriteBloc(successState
                                                  .favoriteList[index].id),
                                          child: BlocListener<
                                              ToggleFavoriteBloc,
                                              ToggleFavoriteState>(
                                            listener: (context, state) async {
                                              if (state
                                                  is ToggleFavoriteSuccessfulState) {
                                                //change color
                                                EasyLoading.show();
                                              }
                                            },
                                            child: BlocBuilder<
                                                ToggleFavoriteBloc,
                                                ToggleFavoriteState>(
                                              builder: (context, state) {
                                                if (state
                                                    is ToggleFavoriteLoadingState) {
                                                  return const Center(
                                                      child:
                                                          CircularProgressIndicator(
                                                    color: kPrimaryColor,
                                                  ));
                                                } else if (state
                                                    is ToggleFavoriteErrorState) {
                                                  return const Text("error");
                                                }

                                                final ToggleFavoriteBloc
                                                    toggleFavoriteBloc =
                                                    ToggleFavoriteBloc(
                                                        successState
                                                            .favoriteList[index]
                                                            .id);
                                                return CustomIcon(
                                                  onTap: () async {
                                                    toggleFavoriteBloc.add(
                                                        ToggleFavoriteInitialFetchEvent());
                                                    // favoriteListBloc.add(FavoriteListInitialEvent());
                                                    await Future.delayed(
                                                        const Duration(
                                                            milliseconds: 200));
                                                    await _refresh();
                                                  },
                                                  icon: Icon(
                                                    Icons.favorite_outline,
                                                    color: successState
                                                            .favoriteList[index]
                                                            .isFavourite
                                                        ? Colors.redAccent
                                                        : const Color(0xFF7C7C7C),
                                                  ),
                                                );
                                              },
                                            ),
                                          ),
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
                    return SizedBox(
                      height: size.height,
                    );
                  }),
              InkWell(
                onTap: () {},
                child: Image.asset(
                  AssetsData.bottomBanner,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
              // const  Gap(10),
              // SizedBox(height: size.height*0.8,)
            ],
          ),
        ),
      ),
    );
  }
}
