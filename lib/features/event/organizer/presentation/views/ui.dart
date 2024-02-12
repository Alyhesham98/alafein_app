import 'package:alafein/features/event/organizer/presentation/bloc/event_category_bloc.dart';
import 'package:alafein/features/event/organizer/presentation/widgets/list_event_category_items.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:path/path.dart';

class UiTest extends StatefulWidget {
  const UiTest({super.key});

  @override
  State<UiTest> createState() => _UiTestState();
}

class _UiTestState extends State<UiTest> {

  final EventCategoryBloc eventCategoryBloc = EventCategoryBloc();


  @override
  void initState() {
    eventCategoryBloc.add(EventCategoryInitialFetchEvent());
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: BlocConsumer<EventCategoryBloc,EventCategoryState>(
          bloc: eventCategoryBloc,
          listenWhen: (previous, current) => current is EventCategoryActionState,
          buildWhen: (previous, current) => current is !EventCategoryActionState,
          listener: (context,state){
        
          },
          builder: (context,state){
            switch(state.runtimeType){
              case EventCategoryFetchingSuccessfulState : 
              final successState = state as EventCategoryFetchingSuccessfulState;
              return Container(
                child: ListView.builder(
                  itemCount: successState.eventCatigories.length,
                  itemBuilder: (context,index){
                    return Container(
                      child: Column(
                        children: [
                          ListEventCategoryItems(
                            categoryLength: successState.eventCatigories.length,
                            name: successState.eventCatigories[index].name,
                            imageUrl: successState.eventCatigories[index].image,),
                          Text(successState.eventCatigories[index].name)

                        ],
                      ),
                    );
                  },  
                ),
              );
            }
            // default:
            return SizedBox(child: Text("======================================="),);
          }, 
          ),
      ),
    );
  }
}