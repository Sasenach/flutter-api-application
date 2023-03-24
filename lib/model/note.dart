import 'package:freezed_annotation/freezed_annotation.dart';

part 'note.freezed.dart';
part 'note.g.dart';

@freezed
class Note with _$Note {
  const factory Note({
    int? id,
    required String nameNote,
    required String content,
    required String category,
    DateTime? dateCreation,
    DateTime? dateEdit,
  }) = _Note;

  factory Note.fromJson(Map<String, dynamic> json) => _$NoteFromJson(json);
}

// class _Note {
//   @primaryKey
//   int? id;

//   @Column(unique: true, indexed: true)
//   String? nameNote;

//   @Column(nullable: true)
//   String? content;

//   @Column(unique: true, indexed: true)
//   String? category;

//   @Column(unique: true, indexed: true)
//   DateTime? dateCreation;

//   @Column(unique: true, indexed: true)
//   DateTime? dateEdit;

//   @Relate(#noteList, isRequired: true, onDelete: DeleteRule.cascade)
//   late User? user;
// }

