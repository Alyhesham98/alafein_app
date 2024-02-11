
import 'package:alafein/core/local_data/session_management.dart';
import 'package:alafein/core/presentation/routes/app_router.gr.dart';
import 'package:alafein/features/profile_page/presentation/widgets/custom_profile_appbar.dart';
import 'package:auto_route/auto_route.dart';

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class Profilepage extends StatelessWidget {
  const Profilepage({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return  const CustomScrollView(
      physics: BouncingScrollPhysics(),
      slivers: [
        SliverToBoxAdapter(
          child:
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                Gap(16),
                CustomProfileAppBarEvent(
              title1: "PROFILE",
            ),

              //  Center(
              //         child: InkWell(
              //             onTap: () {
              //               SessionManagement.signOut();
              //               AutoRouter.of(context).replaceAll([const LoginRoute()]);
              //             },
              //             child: const Text("Log ouuuut")),
              //       );
              
              //  BlocProvider(
              //   create: (context) => GetEventCubit()..getEventPagination(),
              //   child: Eventbody(size: size),
              // )
         ]),
        ),
      ],

      ///buttons
    );
  
    
    
    //  Center(
    //         child: InkWell(
    //             onTap: () {
    //               SessionManagement.signOut();
    //               AutoRouter.of(context).replaceAll([const LoginRoute()]);
    //             },
    //             child: const Text("Log ouuuut")),
    //       );
    
    //  BlocProvider(
    //   create: (context) => GetEventCubit()..getEventPagination(),
    //   child: Eventbody(size: size),
    // );
  }
}
