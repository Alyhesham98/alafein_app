
import 'package:alafein/core/api/constants/api_caller_config.dart';
import 'package:alafein/core/utility/assets_data.dart';
import 'package:alafein/core/utility/theme.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:svg_flutter/svg.dart';


class ListEventCategoryItems extends StatelessWidget {
  const ListEventCategoryItems({super.key, this.id, required this.name, required this.imageUrl, this.isPublished, this.sortNo, required this.categoryLength});
    final int categoryLength;
    final int? id;
    final String name;
    final String imageUrl;
    final bool? isPublished;
    final int? sortNo;

    @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: categoryLength,
      scrollDirection: Axis.horizontal,
      separatorBuilder: (context, index) => const SizedBox(
        width: 20,
      ),
      itemBuilder: (context, index) => SizedBox(
        child: Column(
          children: [
            SvgPicture.network(
                "${APICallerConfiguration.baseImageUrl}${imageUrl}",
                placeholderBuilder: (context) =>
                    Image.asset(AssetsData.music),
              ),
             const Gap(4),
             Text(
              "${name}",
              textAlign: TextAlign.center,
              style: homeLabel3Style,
            ),
          ],
        ),
      ),
    );
  }
}


// /*
// headers: {
//         "Authorization": "Bearer ${SessionManagement.getUserToken()}"
//   }
//  */

// class ListEventCategoryItems extends StatelessWidget {

  

//   const ListEventCategoryItems({
//     super.key,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return ListView.separated(
//       itemCount: 10,
//       scrollDirection: Axis.horizontal,
//       separatorBuilder: (context, index) => const SizedBox(
//         width: 20,
//       ),
//       itemBuilder: (context, index) => SizedBox(
//         child: Column(
//           children: [
//             Image.asset(
//               AssetsData.music,
//               // fit: BoxFit.cover,
//             ),
//             const Gap(4),
//             const Text(
//               'Music',
//               textAlign: TextAlign.center,
//               style: homeLabel3Style,
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
