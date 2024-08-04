import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/constants.dart';
import 'package:notes_app/cubits/NotesCubit/note_cubit.dart';
import 'package:notes_app/models/note_model.dart';
import 'package:notes_app/views/widgets/custom_text_field.dart';
import 'package:notes_app/views/widgets/cutom_app_bar.dart';
import 'package:notes_app/views/widgets/edit_note_color_list_view.dart';

class EditNoteViewBody extends StatefulWidget {
  const EditNoteViewBody({super.key, required this.note});

  final NoteModel note;

  @override
  State<EditNoteViewBody> createState() => _EditNoteViewBodyState();
}

class _EditNoteViewBodyState extends State<EditNoteViewBody> {
  String? title, content;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Stack(
        children: [
          const EditNoteViewColors(),
          Column(
            children: [
              const SizedBox(
                height: 50,
              ),
              CustomAppBar(
                onPressed: () {
                  widget.note.title = title ?? widget.note.title;
                  widget.note.subTitle = content ?? widget.note.subTitle;
                  widget.note.save();
                  BlocProvider.of<NoteCubit>(context).fetchAllNotes();
                  Navigator.pop(context);
                },
                title: 'Edit Note',
                icon: Icons.check,
              ),
              const SizedBox(
                height: 50,
              ),
              CustomTextField(
                onChanged: (value) {
                  title = value;
                },
                hint: widget.note.title,
              ),
              const SizedBox(
                height: 16,
              ),
              CustomTextField(
                onChanged: (value) {
                  content = value;
                },
                hint: widget.note.subTitle,
                maxLines: 5,
              ),
              const SizedBox(
                height: 16,
              ),
              EditNoteColorsList(
                note: widget.note,
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class EditNoteViewColors extends StatelessWidget {
  const EditNoteViewColors({super.key});

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
              color: Color.fromARGB(255, 194, 194, 194),
            ),
          ),
        ),
        Align(
          alignment: const AlignmentDirectional(-3, -0.6),
          child: Container(
            height: 500,
            width: 300,
            decoration: const BoxDecoration(
              color: Color.fromARGB(255, 176, 176, 176),
            ),
          ),
        ),
        Align(
          alignment: const AlignmentDirectional(0, -1.2),
          child: Container(
            height: 300,
            width: 300,
            decoration: const BoxDecoration(
              color: Color.fromARGB(255, 112, 112, 112),
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
