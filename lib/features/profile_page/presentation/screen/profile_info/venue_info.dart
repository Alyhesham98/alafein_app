import 'package:alafein/features/profile_page/presentation/bloc/profile_page_bloc.dart';
import 'package:alafein/features/profile_page/presentation/screen/profile_info/venue_data_page.dart';
import 'package:alafein/features/profile_page/presentation/screen/profile_info/venue_profile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

import '../../../../create_event/model/dropdown_response/venue.dart';
import '../../bloc/venue_data_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

import '../../../../create_event/model/dropdown_response/venue.dart';
import '../../bloc/venue_data_bloc.dart';
import 'venue_profile.dart';

class VenueInfoPage extends StatefulWidget {
  final int venueID;

  const VenueInfoPage({Key? key, required this.venueID}) : super(key: key);

  @override
  _VenueInfoPageState createState() => _VenueInfoPageState();
}

class _VenueInfoPageState extends State<VenueInfoPage> {
  late final VenueDataBloc venueDataBloc;

  @override
  void initState() {
    super.initState();
    venueDataBloc = VenueDataBloc(widget.venueID);
    venueDataBloc.add(VenueDataInitialFetchEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: BlocConsumer<VenueDataBloc, VenueDataState>(
        bloc: venueDataBloc,
        listenWhen: (previous, current) => current is VenueDataActionState,
        buildWhen: (previous, current) => current is! VenueDataActionState,
        listener: (context, state) {},
        builder: (context, state) {
          if (state is VenueDataLoadingState) {
            EasyLoading.show(status: 'Loading...');
          } else if (state is VenueDataFetchingSuccessfulState) {
            EasyLoading.dismiss();
            return VenueDataProfile(
              successState: state,
              venueDataBloc: venueDataBloc,
            );
          }
          return Container();
        },
      ),
    );
  }
}
