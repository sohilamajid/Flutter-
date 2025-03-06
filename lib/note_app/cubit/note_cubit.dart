import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../hive_helper.dart';

part 'note_state.dart';

class NoteCubit extends Cubit<NoteState> {
  NoteCubit() : super(NoteInitial());

  void getNotes()async{
    emit(NoteLoading());
    await HiveHelper.getNotes();
    emit(NoteGetSuccess());
  }

  void updateNote(int index , String text){
    HiveHelper.updateNote(index,text);
    emit(NoteGetSuccess());
  }

  void removeNote(int index){
    HiveHelper.removeNote(index);
    emit(NoteGetSuccess());
  }

  void removeAllNotes(){
    HiveHelper.removeAllNotes();
    emit(NoteGetSuccess());
  }

  void addNote(String text){
    HiveHelper.addNote(text);
    emit(NoteGetSuccess());
  }

}
