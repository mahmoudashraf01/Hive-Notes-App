import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/constants.dart';
import 'package:notes_app/cubits/AddNotesCubit/add_note_cubit.dart';
import 'package:intl/intl.dart';
import 'package:notes_app/models/note_model.dart';
import 'package:notes_app/views/widgets/colors_list_view.dart';
import 'package:notes_app/views/widgets/custom_buttom.dart';
import 'package:notes_app/views/widgets/custom_text_field.dart';

class AddNoteForm extends StatefulWidget {
  const AddNoteForm({super.key});

  @override
  State<AddNoteForm> createState() => _AddNoteFormState();
}

class _AddNoteFormState extends State<AddNoteForm> {
  final GlobalKey<FormState> formKey = GlobalKey();

  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;

  String? title, subTitle;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
      child: Form(
        key: formKey,
        autovalidateMode: autovalidateMode,
        child: Stack(
          children: [
            const AddNotesFromColorVew(),
            Column(
              children: [
                const SizedBox(
                  height: 32,
                ),
                CustomTextField(
                  onSaved: (value) {
                    title = value;
                  },
                  hint: 'title',
                ),
                const SizedBox(
                  height: 16,
                ),
                CustomTextField(
                  onSaved: (value) {
                    subTitle = value;
                  },
                  hint: 'content',
                  maxLines: 5,
                ),
                const SizedBox(
                  height: 32,
                ),
                const ColorsListView(),
                const SizedBox(
                  height: 32,
                ),
                BlocBuilder<AddNoteCubit, AddNoteState>(
                  builder: (context, state) {
                    return CustomButton(
                      isLoading: state is AddNoteLoading ? true : false,
                      onTap: () {
                        if (formKey.currentState!.validate()) {
                          formKey.currentState!.save();
                          var currentDate = DateTime.now();

                          var formattedCurrentDate =
                              DateFormat('dd-mm-yyyy').format(currentDate);
                          var noteModel = NoteModel(
                            title: title!,
                            subTitle: subTitle!,
                            date: formattedCurrentDate,
                            color: black.value,
                          );
                          BlocProvider.of<AddNoteCubit>(context)
                              .addNote(noteModel);
                        } else {
                          autovalidateMode = AutovalidateMode.always;
                          setState(() {});
                        }
                      },
                    );
                  },
                ),
                const SizedBox(
                  height: 16,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class AddNotesFromColorVew extends StatelessWidget {
  const AddNotesFromColorVew({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Align(
          alignment: const AlignmentDirectional(0, 1),
          child: Container(
            height: 600,
            width: 300,
            decoration: const BoxDecoration(
              color: Color.fromARGB(255, 255, 255, 255),
            ),
          ),
        ),
        Align(
          alignment: const AlignmentDirectional(3, -0.6),
          child: Container(
            height: 500,
            width: 300,
            decoration: const BoxDecoration(
              color: Color.fromARGB(255, 217, 217, 217),
            ),
          ),
        ),
        Align(
          alignment: const AlignmentDirectional(-3, -0.6),
          child: Container(
            height: 500,
            width: 300,
            decoration: const BoxDecoration(
              color: Color.fromARGB(255, 153, 153, 153),
            ),
          ),
        ),
        Align(
          alignment: const AlignmentDirectional(0, -1.2),
          child: Container(
            height: 300,
            width: 300,
            decoration: const BoxDecoration(
              color: Color.fromARGB(255, 173, 173, 173),
            ),
          ),
        ),
        BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 100, sigmaY: 100),
          child: Container(
            decoration: const BoxDecoration(
              color: transparent,
            ),
          ),
        ),
      ],
    );
  }
}
