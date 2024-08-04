import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:notes_app/constants.dart';

import 'package:notes_app/views/widgets/add_note_buttom_sheet.dart';
import 'package:notes_app/views/widgets/custom_filter.dart';
import 'package:notes_app/views/widgets/notes_view_body.dart';

class NotesView extends StatelessWidget {
  const NotesView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      floatingActionButton: FloatingActionButton(
        backgroundColor: black,
        onPressed: () {
          showModalBottomSheet(
              isScrollControlled: true,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              context: context,
              builder: (context) {
                return const AddNoteBottomSheet();
              });
        },
        child: const Icon(
          Icons.add,
          color: white,
        ),
      ),
      body: const Stack(
        children: [
          NotesViewColor(),
          NotesViewBody(),
        ],
      ),
    );
  }
}

class NotesViewColor extends StatelessWidget {
  const NotesViewColor({super.key});

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
              color: Color.fromARGB(255, 196, 197, 198),
            ),
          ),
        ),
        Align(
          alignment: const AlignmentDirectional(3, -0.6),
          child: Container(
            height: 500,
            width: 300,
            decoration: const BoxDecoration(
              color: Color.fromARGB(255, 91, 91, 91),
            ),
          ),
        ),
        Align(
          alignment: const AlignmentDirectional(-3, -0.6),
          child: Container(
            height: 500,
            width: 300,
            decoration: const BoxDecoration(
              color: Color.fromARGB(255, 58, 58, 58),
            ),
          ),
        ),
        Align(
          alignment: const AlignmentDirectional(0, -1.2),
          child: Container(
            height: 300,
            width: 300,
            decoration: const BoxDecoration(
              color: Color.fromARGB(255, 24, 24, 24),
            ),
          ),
        ),
        const CustomFilter(),
      ],
    );
  }
}

