import 'package:alafein/features/profile_page/presentation/bloc/profile_page_bloc.dart';
import 'package:alafein/features/profile_page/presentation/screen/profile_info/venue_data_page.dart';
import 'package:alafein/features/profile_page/presentation/screen/profile_info/venue_profile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

import '../../../../create_event/model/dropdown_response/venue.dart';
import '../../bloc/organizer_data_bloc.dart';
import '../../bloc/venue_data_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

import '../../../../create_event/model/dropdown_response/venue.dart';
import '../../bloc/venue_data_bloc.dart';
import 'organizer_data_page.dart';
import 'venue_profile.dart';

class OrganizerInfoPage extends StatefulWidget {
  final int? organizerID;

  const OrganizerInfoPage({Key? key, this.organizerID}) : super(key: key);

  @override
  _OrganizerInfoPageState createState() => _OrganizerInfoPageState();
}

class _OrganizerInfoPageState extends State<OrganizerInfoPage> {
  late final OrganizerDataBloc organizerDataBloc;

  @override
  void initState() {
    super.initState();
    organizerDataBloc = OrganizerDataBloc(widget.organizerID);
    organizerDataBloc.add(OrganizerDataInitialFetchEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: BlocConsumer<OrganizerDataBloc, OrganizerDataState>(
        bloc: organizerDataBloc,
        listenWhen: (previous, current) => current is OrganizerDataActionState,
        buildWhen: (previous, current) => current is! OrganizerDataActionState,
        listener: (context, state) {},
        builder: (context, state) {
          if (state is OrganizerDataLoadingState) {
            EasyLoading.show(status: 'Loading...');
          } else if (state is OrganizerDataFetchingSuccessfulState) {
            EasyLoading.dismiss();
            return
              OrganizerDataProfile(
              successState: state,
              organizerPageBloc: organizerDataBloc,
            );
          }
          return Container();
        },
      ),
    );
  }
}
