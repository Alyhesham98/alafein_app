import 'package:alafein/core/presentation/widgets/main_custom_button.dart';
import 'package:alafein/core/utility/colors_data.dart';
import 'package:alafein/core/utility/strings.dart';
import 'package:alafein/core/utility/theme.dart';
import 'package:alafein/features/event/organizer/cubit/get_event_cubit.dart';
import 'package:alafein/features/event/organizer/cubit/get_event_state.dart';
import 'package:alafein/features/event/organizer/presentation/widgets/custom_appbar_event_deatils.dart';
import 'package:alafein/features/event/organizer/presentation/widgets/custom_button_comment.dart';
import 'package:alafein/features/event/organizer/presentation/widgets/deatils.dart';
import 'package:alafein/features/event/organizer/presentation/widgets/description.dart';
import 'package:alafein/features/event/organizer/presentation/widgets/event_deatils_items.dart';
import 'package:alafein/features/event/organizer/presentation/widgets/event_name_items.dart';
import 'package:alafein/features/event/organizer/presentation/widgets/list_comment_items.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../../core/api/constants/api_caller_config.dart';

class EventsShowCommentBody extends StatelessWidget {
  const EventsShowCommentBody({
    super.key,
    required this.size,
    required this.id,
  });

  final Size size;
  final int id;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetEventCubit, GetEventState>(
      builder: (context, state) {
        final getDeatils = context.read<GetEventCubit>().eventDetails;
        print('ID: ${getDeatils?.id}');
        print('Poster: ${getDeatils?.poster}');
        print('Category: ${getDeatils?.category}');
        print('Is Favorite: ${getDeatils?.isFavorite}');
        print('Name: ${getDeatils?.name}');
        print('Organizer: ${getDeatils?.organizer}');
        print('Description: ${getDeatils?.description}');
        print('Date: ${getDeatils?.date}');
        print('Attendance Option: ${getDeatils?.attendanceOption}');
        print('URL: ${getDeatils?.url}');
        print('Payment Fee: ${getDeatils?.paymentFee}');
        print('Address: ${getDeatils?.address}');
        print('Map Link: ${getDeatils?.mapLink}');
        print('Event Organizer: ${getDeatils?.eventOrganizer}');
        print('Venue: ${getDeatils?.venue}');
        print('Venue: ${getDeatils?.venue?.id}');
        print('Organizer: ${getDeatils?.organizer?.id}');

        final comments = context.read<GetEventCubit>().comments;

/*                child: BlocConsumer<ToggleFavCubit, ToggleFavState>(
                  listener: (context, state) {},
                  builder: (context, state) {
                    return EventName(
                      imageurl: getDeatils!.category?.image ?? "",
                      name: getDeatils.category?.name ?? "",
                      size: size,
                      onTap: () => context
                          .read<ToggleFavCubit>()
                          .favToggle(getDeatils?.id as int),
                    );
                  },*/
        if (getDeatils != null) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomAppBarEventDeatils(
                headerImgUrl: getDeatils.poster != null
                    ? "${APICallerConfiguration.baseImageUrl}${getDeatils.poster}"
                    : "",
                eventId: getDeatils.id ?? 0,
              ),
              SizedBox(
                height: 120,
                child: EventName(
                  imageurl: getDeatils.category?.image != null
                      ? "${APICallerConfiguration.baseImageUrl}${getDeatils.category?.image}"
                      : "",
                  name: getDeatils.category?.name ?? "",
                  size: size,
                  index: getDeatils.id ?? 0,
                  onTap: () {},
                  id: id,
                  isFavorite: getDeatils.isFavorite ?? true,
                  eventName: getDeatils.name ?? "",
                  date: getDeatils.date ?? "",
                  location: getDeatils.mapLink ?? '',
                ),
              ),
              Description(
                size: size,
                text: getDeatils.description ?? '',
              ),
              Deatils(
                date: getDeatils.date ?? "",
                postion: getDeatils.address ?? "",
                price: getDeatils.paymentFee ?? 0.0,
                location: getDeatils.mapLink ?? '',
                isFree: getDeatils.attendanceOption?.name == "Free",
                name: getDeatils.category?.name ?? "",
                eventName: getDeatils.name ?? "",
              ),
              if (getDeatils.eventOrganizer != null)
                const Padding(
                  padding: EdgeInsets.only(left: 24, top: 24),
                  child: Text(
                    "Event organizer",
                    style: homeLabelStyle,
                  ),
                ),
              if (getDeatils.eventOrganizer != null)
                EventDeatilsItem(
                  address: getDeatils.venue?.address ?? "",
                  facebook: getDeatils.venue?.facebook ?? "",
                  instagram: getDeatils.venue?.instagram ?? "",
                  mapLink: getDeatils.venue?.mapLink ?? "",
                  other: getDeatils.venue?.other ?? "",
                  photo: getDeatils.venue?.photo ?? "",
                  websiteURL: getDeatils.venue?.websiteUrl ?? "",
                  name: getDeatils.venue?.name ?? "",
                  whatsapp: '',
                  size: size,
                  organizerID: getDeatils.organizer!.id,
                ),
              const Padding(
                padding: EdgeInsets.only(
                  left: 24,
                ),
                child: Text(
                  "VENUE",
                  style: homeLabelStyle,
                ),
              ),
              EventDeatilsItem(
                address: getDeatils.venue?.address ?? "",
                facebook: getDeatils.venue?.facebook ?? "",
                instagram: getDeatils.venue?.instagram ?? "",
                mapLink: getDeatils.venue?.mapLink ?? "",
                other: getDeatils.venue?.other ?? "",
                photo: getDeatils.venue?.photo ?? "",
                websiteURL: getDeatils.venue!.websiteUrl ?? "",
                name: getDeatils.venue?.name ?? "",
                whatsapp: '',
                size: size,
                venueID: getDeatils.venue?.id ?? 0,
              ),
              const Padding(
                padding: EdgeInsets.only(
                  left: 24,
                ),
                child: Text(
                  "Comments",
                  style: homeLabelStyle,
                ),
              ),
              SizedBox(height: 200, child: ListCommetItems(comments)),
              if (getDeatils.attendanceOption?.name == "Registration")
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: MainCustomButton(
                    buttonName: "ReGISTER TO ATTEND",
                    onPressed: () {
                      launch(getDeatils.url ?? '');
                    },
                    backgroundColor: kPrimaryColor,
                  ),
                ),
              const Gap(10),
              if (getDeatils.attendanceOption?.name != "Registration")
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 24,
                  ),
                  child: CustomButtonComment(
                    color: kSemiBlack,
                    textColor: Colors.white,
                    data: "FREE EVENT",
                    borderColor: Colors.white,
                    onTap: () {
                      //Url for paying if event not free
                    },
                  ),
                ),
              const Gap(10),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 24,
                ),
                child: CustomButtonComment(
                  data: "ADD COMMENT",
                  onTap: () {
                    var commentValue;
                    _showCommentPopUp(context, commentValue, getDeatils.id);
                  },
                ),
              ),
              const Gap(10),
              Center(
                child: Container(
                  width: size.width * 0.3,
                  height: 2,
                  color: Colors.black,
                ),
              ),
              const Gap(3),
            ],
          );
        } else {
          return const SizedBox();
        }
      },
    );
  }

  Future<void> _showCommentPopUp(BuildContext context, commentValue, id) async {
    return showModalBottomSheet(
        context: context,
        backgroundColor: Colors.white,
        builder: (context) {
          return Column(
            children: [
              const Gap(20),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 10.sw),
                child: TextFormField(
                  style: GoogleFonts.abhayaLibre(
                    color: kSemiBlack,
                    fontWeight: FontWeight.w700,
                    fontSize: 4.sw,
                  ),
                  onTapOutside: (event) => FocusScope.of(context).unfocus(),
                  onSaved: (value) {
                    //   signupCubit.lastName = value!;
                  },
                  onChanged: (val) {
                    commentValue = val;
                  },
                  validator: (value) {
                    return null;
                  },
                  maxLines: 3,
                  cursorColor: Colors.black,
                  textAlign: TextAlign.left,
                  textAlignVertical: TextAlignVertical.bottom,
                  decoration: InputDecoration(
                      constraints: BoxConstraints(
                          maxHeight: 14.sw,
                          minHeight: 14.sw,
                          maxWidth: double.infinity,
                          minWidth: double.infinity),
                      contentPadding: EdgeInsets.all(
                        4.sw,
                      ),
                      border: textFormFieldBorderStyle,
                      enabledBorder: textFormFieldBorderStyle,
                      errorBorder: textFormFieldBorderStyle,
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide:
                            const BorderSide(width: 1.5, color: kPrimaryColor),
                      ),
                      disabledBorder: textFormFieldBorderStyle,
                      floatingLabelBehavior: FloatingLabelBehavior.never,
                      label: const Text(
                        'Add Comment',
                      ),
                      labelStyle: const TextStyle(
                          color: kHintColor,
                          fontFamily: StringConst.formulaFont,
                          fontWeight: FontWeight.w300),
                      filled: true,
                      fillColor: Colors.white),
                  textInputAction: TextInputAction.next,
                  textCapitalization: TextCapitalization.none,
                  autocorrect: false,
                ),
              ),
              const Gap(10),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 24,
                ),
                child: CustomButtonComment(
                  data: "ADD COMMENT",
                  onTap: () async {
                    await GetEventCubit()
                        .addComments(id: id, comment: commentValue);
                    Navigator.pop(context);
                    //  _showCommentPopUp(context);
                  },
                ),
              ),
            ],
          );
        });
  }
}
