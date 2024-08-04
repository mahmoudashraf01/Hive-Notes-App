part of 'note_cubit.dart';

@immutable
abstract class NoteState {}

class NoteInitial extends NoteState {}

class NotesLoading extends NoteState {}

class NotesFailure extends NoteState {}

class NotesSuccess extends NoteState {}
