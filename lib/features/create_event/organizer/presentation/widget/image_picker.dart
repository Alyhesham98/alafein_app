import 'dart:io';

import 'package:alafein/core/utility/colors_data.dart';
import 'package:alafein/core/utility/strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:responsive_builder/responsive_builder.dart';

import '../../cubit/images_selection_cubit.dart';

class ImagesPicker extends StatelessWidget {
  const ImagesPicker({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ImagesSelectionCubit(),
      child: BlocBuilder<ImagesSelectionCubit, ImagesSelectionState>(
        builder: (context, state) {
          final imagesSelectionCubit =
              BlocProvider.of<ImagesSelectionCubit>(context);
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Container(
              //   height: 48,
              //   padding: const EdgeInsets.only(
              //     left: 15,
              //     right: 15,
              //   ),
              //   decoration: BoxDecoration(
              //       color: Colors.white,
              //       border: Border.all(
              //         color: kPrimaryColor,
              //         width: 0.5,
              //       ),
              //       borderRadius: BorderRadius.circular(15)),
              //   child: Row(
              //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //     children: [
              //       const Text("Add photos"),
              //       InkWell(
              //         onTap: () {
              //           imagesSelectionCubit.onImagePickerClicked();
              //         },
              //         child: const Icon(
              //           Icons.add_a_photo,
              //           color: kPrimaryColor,
              //         ),
              //       ),
              //     ],
              //   ),
              // ),
              // Gap(10.sw),
              Gap(5.sw),
              const Text(
                'Photos',
                style: TextStyle(
                  color: Color(0xFF3D3D3D),
                  fontSize: 17,
                  fontFamily: StringConst.formulaFont,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Row(
                children: [
                  InkWell(
                    onTap: () {
                      imagesSelectionCubit.onImagePickerClicked();
                    },
                    child: Container(
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                          color: kPrimaryColor,
                          borderRadius: BorderRadius.circular(12)),
                      child: const Icon(
                        Icons.add,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  Gap(5.sw),
                  Expanded(
                    child: SizedBox(
                      height: 75,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: imagesSelectionCubit.imagesList.length,
                        itemBuilder: (context, index) => Container(
                          margin: const EdgeInsets.all(2),
                          padding: const EdgeInsets.all(2),
                          child: InkWell(
                            onTap: () {
                              imagesSelectionCubit.removeImage(index);
                            },
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(12),
                              child: Container(
                                height: 75,
                                width: 75,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  border: Border.all(
                                    color: const Color(0xff00aef7),
                                    width: 1,
                                  ),
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                child: Image.file(
                                    File(imagesSelectionCubit
                                        .imagesList[index].path),
                                    height: 65,
                                    width: 65,
                                    fit: BoxFit.cover),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              // Padding(
              //   padding: const EdgeInsets.symmetric(horizontal: 10),
              //   child: Row(
              //     children: [
              //       Expanded(
              //         flex: 2,
              //         child: LayoutBuilder(
              //           builder:
              //               (BuildContext context, BoxConstraints constraints) {
              //             return Container(
              //               height: constraints.maxWidth,
              //               decoration: BoxDecoration(
              //                 color: Colors.white,
              //                 border: Border.all(
              //                   color: const Color(0xff00aef7),
              //                   width: 1,
              //                 ),
              //                 borderRadius: BorderRadius.circular(12),
              //               ),
              //             );
              //           },
              //         ),
              //       ),
              //       const Spacer(),
              //       Expanded(
              //         flex: 2,
              //         child: LayoutBuilder(
              //           builder:
              //               (BuildContext context, BoxConstraints constraints) {
              //             return Container(
              //               height: constraints.maxWidth,
              //               decoration: BoxDecoration(
              //                 color: Colors.white,
              //                 border: Border.all(
              //                   color: const Color(0xff00aef7),
              //                   width: 1,
              //                 ),
              //                 borderRadius: BorderRadius.circular(12),
              //               ),
              //             );
              //           },
              //         ),
              //       ),
              //       const Spacer(),
              //       Expanded(
              //         flex: 2,
              //         child: LayoutBuilder(
              //           builder:
              //               (BuildContext context, BoxConstraints constraints) {
              //             return Container(
              //               height: constraints.maxWidth,
              //               decoration: BoxDecoration(
              //                 color: Colors.white,
              //                 border: Border.all(
              //                   color: const Color(0xff00aef7),
              //                   width: 1,
              //                 ),
              //                 borderRadius: BorderRadius.circular(12),
              //               ),
              //             );
              //           },
              //         ),
              //       ),
              //     ],
              //   ),
              // ),
            ],
          );
        },
      ),
    );
  }
}
