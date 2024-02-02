// import 'package:alafein/core/utility/colors_data.dart';
// import 'package:alafein/features/auth/signup/application/signup_cubit/signup_cubit.dart';
// import 'package:alafein/features/auth/signup/model/lookup_model.dart';
// import 'package:alafein/features/auth/signup/signup_event_host/signup_venue/presentation/widgets/datetime_item.dart';
// import 'package:alafein/features/auth/signup/widgets/signup_custom_text.dart';
// import 'package:auto_route/auto_route.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:gap/gap.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:responsive_builder/responsive_builder.dart';

// import '../../../../../../../core/presentation/widgets/main_custom_button.dart';
// import '../../domain/days.dart';

// class FacilitiesChips extends StatelessWidget {
//   const FacilitiesChips({
//     super.key,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return BlocBuilder<SignupCubit, SignupState>(
//       builder: (context, state) {
//         final signupCubit = BlocProvider.of<SignupCubit>(context);
//         List<Facility>? facilities = signupCubit.lookupModel?.facility;
//         return SizedBox(
//           height: 52.sw,
//           width: 100.sh,
//           child: GridView.builder(
//             gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//               crossAxisCount: 3,
//               childAspectRatio: 2,
//               crossAxisSpacing: 3.sw,
//               mainAxisSpacing: 3.sw,
//             ),
//             itemCount: 7,
//             itemBuilder: (context, index) => InputChip(
//               onSelected: (a) {},
//               elevation: 0,
//               pressElevation: 0,
//               selectedShadowColor: Colors.transparent,
//               surfaceTintColor: Colors.transparent,
//               padding: EdgeInsets.symmetric(vertical: 3.sw),
//               backgroundColor: facilities?[index].isOpen == null
//                   ? Colors.white
//                   : days[index].isOpen ?? false
//                       ? kPrimaryColor
//                       : Colors.white,
//               selectedColor: Colors.white,
//               showCheckmark: false,
//               shape: RoundedRectangleBorder(
//                   borderRadius: BorderRadius.circular(2.5.sw),
//                   side: BorderSide(
//                       color: days[index].isOpen == null
//                           ? kDividerColor
//                           : days[index].isOpen ?? false
//                               ? Colors.transparent
//                               : kDividerColor,
//                       width: 1.5)),
//               label: Row(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   Text(
//                     days[index].name,
//                     style: GoogleFonts.anton(
//                         decoration: days[index].isOpen == null
//                             ? null
//                             : days[index].isOpen ?? false
//                                 ? null
//                                 : TextDecoration.lineThrough,
//                         color: days[index].isOpen == null
//                             ? kGreyFontColor
//                             : days[index].isOpen ?? false
//                                 ? Colors.white
//                                 : kGreyFontColor,
//                         fontSize: 3.5.sw,
//                         fontWeight: FontWeight.w400),
//                   ),
//                 ],
//               ),
//               selected: false,
//             ),
//             scrollDirection: Axis.vertical,
//           ),
//         );
//       },
//     );
//   }
// }
