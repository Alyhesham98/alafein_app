import 'package:alafein/features/create_event/model/dropdown_response/category.dart';
import 'package:alafein/features/create_event/organizer/cubit/create_event_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:responsive_builder/responsive_builder.dart';

import 'custom_description_text_form_filed.dart';
import 'custom_dropdown.dart';
import 'custom_text_form_field.dart';

class OrganizerCreateEventPageOne extends StatelessWidget {
  const OrganizerCreateEventPageOne({super.key});

  @override
  Widget build(BuildContext context) {
    final createEventCubit = BlocProvider.of<CreateEventCubit>(context);

    return SingleChildScrollView(
      child: Form(
        key: createEventCubit.keys[createEventCubit.index],
        child: Column(
          children: [
            CustomTextFormField(
              lable: "Event Name EN",
              onSaved: (value) =>
                  createEventCubit.saveEventNameEN = value ?? "",
              validator: (v) => createEventCubit.nameFiledValediator(v ?? ""),
            ),
            CustomTextFormField(
              lable: "Event Name AR",
              onSaved: (value) =>
                  createEventCubit.saveEventNameAR = value ?? "",
              validator: (v) => createEventCubit.nameFiledValediator(v ?? ""),
            ),
            BlocBuilder<CreateEventCubit, CreateEventState>(
              builder: (context, state) {
                return CustomDropdown<Category>(
                    hint: "Event genre",
                    value: createEventCubit.selectedCategory,
                    onChanged: (value) {
                      createEventCubit.saveCategory = value;
                    },
                    items: createEventCubit.dropdownResponse.category
                        ?.map((e) => DropdownMenuItem<Category>(
                            value: e, child: Text(e.name ?? "")))
                        .toList());
              },
            ),
            Gap(8.sw),
            CustomDescriptionTextFormField(
              lable: "Event description EN",
              onSaved: (value) =>
                  createEventCubit.saveEventDescriptionEn = value ?? "",
              validator: (v) =>
                  createEventCubit.descriptionFiledValediator(v ?? ""),
            ),
            Gap(8.sw),
            CustomDescriptionTextFormField(
              lable: "Event description AR",
              onSaved: (value) =>
                  createEventCubit.saveEventDescriptionAr = value ?? "",
              validator: (v) =>
                  createEventCubit.descriptionFiledValediator(v ?? ""),
            ),
          ],
        ),
      ),
    );
  }
}
