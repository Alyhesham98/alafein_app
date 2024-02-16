// ignore_for_file: type_literal_in_constant_pattern

import 'package:alafein/core/api/constants/api_caller_config.dart';
import 'package:alafein/core/utility/assets_data.dart';
import 'package:alafein/core/utility/colors_data.dart';
import 'package:alafein/features/event/organizer/presentation/bloc_listEvent/list_event_bloc.dart';
import 'package:alafein/features/event/organizer/presentation/model/list_event_model.dart';
import 'package:alafein/features/event/organizer/presentation/views/event_deatils.dart';
import 'package:alafein/features/event/organizer/presentation/widgets/custom_appbar.dart';
import 'package:alafein/features/favourite/presentation/toggle_bloc/toggle_favorite_bloc.dart';
// import 'package:alafein/features/favourite/presentation/widgets/list_view_favorite.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:gap/gap.dart';
// import 'package:alafein/core/utility/assets_data.dart';
import 'package:alafein/features/event/organizer/presentation/widgets/custom_icon.dart';
import 'package:alafein/features/event/organizer/presentation/widgets/information_event.dart';
import 'package:alafein/features/event/organizer/presentation/widgets/custom_event_image.dart';

class FavoritePage extends StatefulWidget {
  const FavoritePage({super.key});

  @override
  State<FavoritePage> createState() => _FavoritePageState();
}

class _FavoritePageState extends State<FavoritePage> {
  final ListEventBloc listEventBloc = ListEventBloc();

  bool check = false;
  @override
  void initState() {
    listEventBloc.add(ListEventInitialFetchEvent());
    super.initState();

    // if(check){
    //   // setState(() {
        
    //   // });
    //   check =false;
    // }
  }
  
  Future<void> _refresh(){
    listEventBloc.add(ListEventInitialFetchEvent());
    return Future.delayed(const Duration(seconds: 1),
      (){
          setState(() {
            check = true;
          });
      }
    );
  }


  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return RefreshIndicator(
      onRefresh: ()async{
         _refresh();
      },
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
                height: size.height * 0.05,
              ),
              const CustomAppBarEvent(
                title1: "FAVOURITE EVENTS",
                title2: "Here's what you've liked so far", hasIcon: false,
              ),
              const Gap(10),
              BlocConsumer<ListEventBloc, ListEventState>(
                bloc: listEventBloc,
                listenWhen: (previous, current) =>
                    current is ListEventActionState,
                buildWhen: (previous, current) =>
                    current is! ListEventActionState,
                listener: (context, state) async{
                  if(state is ListEventLoadingState){
                    EasyLoading.show(status: 'loading');
                  }else if(state is ListEventErrorState){
                    EasyLoading.showError("Error!");
                  }
                },
                builder: (context, state) {
                switch (state.runtimeType) {
                  case ListEventFetchingSuccessfulState:
                    final successState = state as ListEventFetchingSuccessfulState;
                    final List<ListEventModel> favList = successState.listEvent.where((e) =>  e.isFavourite).toList();
                  return ListView.separated(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    padding: EdgeInsets.zero,
                    itemCount: favList.length,
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
                                    builder: (context) => EventDeatils(index: favList[index].id,),
                                  ),
                                );
                              },
                              child:  CustomEventImage(
                                imageurl: favList[index].poster != null ?"${APICallerConfiguration.baseImageUrl}${favList[index].poster}": "",
                              ),
                            ),
                            SizedBox(
                              width: size.width * 0.05,
                            ),
                             Expanded(
                              child: Row(
                                children: [
                                  InformationEvent(
                                    name: favList[index].name,
                                    date: favList[index].date,
                                    venue: favList[index].venue.name,
                                  ),
                                  BlocProvider(
                                    create: (context)=>ToggleFavoriteBloc(
                                      favList[index].id
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
                                            
                                            final ToggleFavoriteBloc toggleFavoriteBloc = ToggleFavoriteBloc( favList[index].id);
                                              return  CustomIcon(
                                                onTap: (){
                                                  toggleFavoriteBloc.add(ToggleFavoriteInitialFetchEvent());
                                                  _refresh();
                                                },
                                              icon: Icon(
                                              Icons.favorite_outline,
                                              color: favList[index].isFavourite ? Color(0xFF7C7C7C) : Colors.redAccent,
                                              ),
                                            );                                      
                                          },
                                        ),
                                      ),
                                  ),
                                  // BlocConsumer<ToggleFavoriteBloc,ToggleFavoriteState>(
                                  //   bloc: toggleFavoriteBloc,
                                  //    listenWhen: (previous, current) =>
                                  //       current is ToggleFavoriteActionState,
                                  //   buildWhen: (previous, current) =>
                                  //       current is! ToggleFavoriteActionState,
                                  //   listener: (context, state) {},
                                  //   builder: (context, state){
                                  //     switch (state.runtimeType) {
                                  //       case ToggleFavoriteLoadingState :
                                  //         return const Center(
                                  //             child: CircularProgressIndicator(
                                  //           color: kPrimaryColor,
                                  //         ));
                                        
                                  //       case ToggleFavoriteSuccessfulState:
                                  //       final successState = state as ToggleFavoriteSuccessfulState;
                                        
                                  //       return CustomIcon(
                                  //         onTap: (){
                                  //            toggleFavoriteBloc.add(ToggleFavoriteInitialFetchEvent());
                                  //         },
                                  //         icon: Icon(
                                  //         Icons.favorite_outline,
                                  //         color: Color(0xFF7C7C7C),
                                  //           ),
                                  //         );
                                  //         default: return const CustomIcon(
                                  //           icon: Icon(
                                  //             Icons.favorite_outline,
                                  //             color: Color(0xFF7C7C7C),
                                  //           ),
                                  //         );
                                  //       }
                                  //     }
                                  //  )  
                                
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
              InkWell(
                onTap: _refresh,
                child: Image.asset(
                  AssetsData.bottomBanner,
                ),
              ),
              const  Gap(10),
          ],
        )
      ),
    );
  }
}