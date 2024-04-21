import 'package:alafein/features/create_event/model/dropdown_response/attendance.dart';
import 'package:alafein/features/create_event/organizer/cubit/create_event_cubit.dart';
import 'package:alafein/features/create_event/organizer/presentation/widget/action_filed.dart';
import 'package:alafein/features/create_event/organizer/presentation/widget/custom_dropdown.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:responsive_builder/responsive_builder.dart';

import 'custom_text_form_field.dart';

class OrganizerCreateEventPageThree extends StatelessWidget {
  const OrganizerCreateEventPageThree({super.key});

  @override
  Widget build(BuildContext context) {
    final createEventCubit = BlocProvider.of<CreateEventCubit>(context);

    return SingleChildScrollView(
      child: Form(
        key: createEventCubit.keys[createEventCubit.index],
        child: Column(
          children: [
            BlocBuilder<CreateEventCubit, CreateEventState>(
              builder: (context, state) {
                return CustomDropdown<Attendance>(
                    hint: "Attendance options",
                    value: createEventCubit.selecteAttendance,
                    onChanged: (value) {
                      createEventCubit.saveAttendance = value;
                    },
                    items: createEventCubit.dropdownResponse.attendance
                        ?.map(
                          (e) => DropdownMenuItem<Attendance>(
                            value: e,
                            child: Text(e.name ?? ""),
                          ),
                        )
                        .toList());
              },
            ),
            Gap(8.sw),
            CustomTextFormField(
              lable: "Url",
              onSaved: (value) => createEventCubit.saveUrl = value ?? "",
              validator: (v) => createEventCubit.textValediator(v ?? ""),
            ),
            Gap(8.sw),
            CustomTextFormField(
              lable: "Payment Fees",
              keyboardType: TextInputType.number,
              suffix: const Text(
                "EGP",
                style: TextStyle(color: Colors.black),
              ),
              onSaved: (value) => createEventCubit.saveFees = value ?? "",
              validator: (v) => createEventCubit.textValediator(v ?? ""),
            ),
            Gap(8.sw),
            BlocBuilder<CreateEventCubit, CreateEventState>(
              builder: (context, state) {
                return ActionField(
                  title: createEventCubit.posterPhoto?.name ??
                      "Upload the event poster",
                  icon: Icons.upload,
                  onTap: () async {
                    await createEventCubit.pickImage();
                  },
                );
              },
            ),
            Gap(8.sw),
            CustomTextFormField(
              lable: "Contact person for event",
              keyboardType: TextInputType.phone,
              onSaved: (value) =>
                  createEventCubit.saveContactPerson = value ?? "",
              validator: (v) => createEventCubit.textValediator(v ?? ""),
            ),
            CustomTextFormField(
              lable: "Additional comments",
              onSaved: (value) =>
                  createEventCubit.saveAddtionalComment = value ?? "",
              validator: (v) => createEventCubit.nameFiledValediator(v ?? ""),
            ),
          ],
        ),
      ),
    );
  }
}
