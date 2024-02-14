import 'package:alafein/core/presentation/widgets/main_custom_button.dart';
import 'package:alafein/core/utility/colors_data.dart';
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


class EventsShowCommentBody extends StatelessWidget {
  const EventsShowCommentBody({
    super.key,
    required this.size,
  });

  final Size size;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetEventCubit, GetEventState>(
      builder: (context, state) {
        final getDeatils = context.read<GetEventCubit>().eventDetails;
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
              const CustomAppBarEventDeatils(),
              SizedBox(
                height: 120,
                child: EventName(
                    imageurl: getDeatils!.category?.image ?? "",
                    name: getDeatils.category?.name ?? "",
                    size: size,
                    index: getDeatils!.id ?? 0,
                    onTap: () {

                    },
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
                  size: size,
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
                websiteURL: getDeatils.venue!.websiteUrl!,
                name: getDeatils.venue?.name ?? "",
                size: size,
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
              const ListCommetItems(),
              if (getDeatils.attendanceOption?.name == "Registration")
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: MainCustomButton(
                    buttonName: "ReGISTER TO ATTEND",
                    onPressed: () {},
                    backgroundColor: kPrimaryColor,
                  ),
                ),
              const Gap(10),
              if (getDeatils.attendanceOption?.name != "Registration")
                 Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 24,
                  ),
                  child: CustomButtonComment(
                    color: kSemiBlack,
                    textColor: Colors.white,
                    data: "FREE EVENT",
                    borderColor: Colors.white,
                    onTap: (){
                      //Url for paying if event not free
                    },
                  ),
                ),
              const Gap(10),
               Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 24,
                ),
                child: CustomButtonComment(
                  data: "ADD COMMENT",
                  onTap: (){
                    _showCommentPopUp(context);
                    print("hiiiiiii");
                    _showCommentPopUp(context);
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
  Future<void> _showCommentPopUp(BuildContext context) async{
    return showModalBottomSheet(
      context: context,
      builder: (context){
        return Column(
          children: [
            // TextFormField(),
            // ElevatedButton(onPressed: (){}, child: Text("ADD COMMENT"))
          ],
        );
      }
    );
  }
}
