import 'package:alafein/features/create_event/model/dropdown_response/branch.dart';
import 'package:alafein/features/create_event/model/dropdown_response/repeat.dart';
import 'package:alafein/features/create_event/model/dropdown_response/venue.dart';
import 'package:alafein/features/create_event/organizer/cubit/create_event_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:responsive_builder/responsive_builder.dart';

import 'action_filed.dart';
import 'custom_dropdown.dart';
import 'custom_text_form_field.dart';

class OrganizerCreateEventPageTwo extends StatelessWidget {
  const OrganizerCreateEventPageTwo({super.key});

  @override
  Widget build(BuildContext context) {
    final createEventCubit = BlocProvider.of<CreateEventCubit>(context);

    return SingleChildScrollView(
      child: Form(
        key: createEventCubit.keys[createEventCubit.index],
        child: Column(
          children: [
            CustomTextFormField(
              lable: "Main artist(s) name EN",
              onSaved: (value) =>
                  createEventCubit.saveMainArtestNameEn = value ?? "",
              validator: (v) => createEventCubit.nameFiledValediator(v ?? ""),
            ),
            CustomTextFormField(
              lable: "Main artist(s) name AR",
              onSaved: (value) =>
                  createEventCubit.saveMainArtestNameAr = value ?? "",
              validator: (v) => createEventCubit.nameFiledValediator(v ?? ""),
            ),
            BlocBuilder<CreateEventCubit, CreateEventState>(
              builder: (context, state) {
                return CustomDropdown<Venue>(
                  hint: "Venue",
                  value: createEventCubit.selectedVenue,
                  onChanged: (value) {
                    createEventCubit.saveVenue = value;
                    createEventCubit.saveBranch = value?.branch?[0];
                  },
                  items: createEventCubit.dropdownResponse.venue
                      ?.map(
                        (e) => DropdownMenuItem<Venue>(
                          value: e,
                          child: Text(e.name ?? ""),
                        ),
                      )
                      .toList(),
                );
              },
            ),
            Gap(8.sw),
            BlocBuilder<CreateEventCubit, CreateEventState>(
              builder: (context, state) {
                if (createEventCubit.selectedVenue != null) {
                  return CustomDropdown<Branch>(
                    hint: "Branch",
                    value: createEventCubit.selectedBranch,
                    onChanged: (value) {
                      createEventCubit.saveBranch = value;
                    },
                    items: createEventCubit.dropdownResponse.venue
                        ?.firstWhere(
                            (e) => createEventCubit.selectedVenue?.id == e.id)
                        .branch
                        ?.map(
                          (e) => DropdownMenuItem<Branch>(
                            value: e,
                            child: Text(e.name ?? ""),
                          ),
                        )
                        .toList(),
                  );
                } else {
                  return const SizedBox();
                }
              },
            ),
            Gap(8.sw),
            BlocBuilder<CreateEventCubit, CreateEventState>(
              builder: (context, state) {
                return ActionField(
                  title: createEventCubit.selectedDate != null
                      ? createEventCubit.selectedDate!
                          .toString()
                          .split(' ')
                          .first
                      : "Event date and time",
                  icon: Icons.calendar_month,
                  onTap: () async {
                    createEventCubit.saveDate = await showDatePicker(
                        context: context,
                        initialDate: createEventCubit.selectedDate,
                        firstDate: DateTime.now(),
                        lastDate: DateTime(DateTime.now().year + 1));
                  },
                );
              },
            ),
            Gap(8.sw),
            BlocBuilder<CreateEventCubit, CreateEventState>(
              builder: (context, state) {
                return CustomDropdown(
                  hint: "Repeat",
                  value: createEventCubit.selectedRepeat,
                  onChanged: (value) {
                    createEventCubit.saveRepeat = value;
                  },
                  items: createEventCubit.dropdownResponse.repeat
                      ?.map(
                        (e) => DropdownMenuItem<Repeat>(
                          value: e,
                          child: Text(e.number?.toString() ?? ""),
                        ),
                      )
                      .toList(),
                );
              },
            ),
            Gap(16.sw),
            Row(
              children: [
                BlocBuilder<CreateEventCubit, CreateEventState>(
                  builder: (context, state) {
                    return Checkbox(
                        value: createEventCubit.isForKids,
                        onChanged: (value) {
                          createEventCubit.checkForKids(value ?? false);
                        });
                  },
                ),
                Text(
                  'Available for kids',
                  style: TextStyle(
                    color: const Color(0xFF1D1D1F),
                    fontSize: 3.sw,
                    fontFamily: 'Formula Condensed',
                    fontWeight: FontWeight.w700,
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
