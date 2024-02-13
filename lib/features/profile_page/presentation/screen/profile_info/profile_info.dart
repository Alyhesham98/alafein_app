import 'dart:ffi';

import 'package:alafein/core/local_data/session_management.dart';
import 'package:alafein/features/profile_page/presentation/screen/profile_info/venue_profile.dart';
import 'package:flutter/material.dart';
import 'audience_profile.dart';

class ProfileInfoPage extends StatelessWidget {
  const ProfileInfoPage({super.key});

  @override
  Widget build(BuildContext context) {
    switch (SessionManagement.getUserRole()) {
      case "Audience":
        {
          return AudienceProfile();
        }
      case "Host Venue":
        {
          return VenueProfile();
        }
      default:
        {
          return const Text("Organizer");
        }
    }
  }
}
