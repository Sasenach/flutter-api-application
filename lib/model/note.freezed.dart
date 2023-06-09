// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'note.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Note _$NoteFromJson(Map<String, dynamic> json) {
  return _Note.fromJson(json);
}

/// @nodoc
mixin _$Note {
  int? get id => throw _privateConstructorUsedError;
  String get nameNote => throw _privateConstructorUsedError;
  String get content => throw _privateConstructorUsedError;
  String get category => throw _privateConstructorUsedError;
  DateTime? get dateCreation => throw _privateConstructorUsedError;
  DateTime? get dateEdit => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $NoteCopyWith<Note> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NoteCopyWith<$Res> {
  factory $NoteCopyWith(Note value, $Res Function(Note) then) =
      _$NoteCopyWithImpl<$Res, Note>;
  @useResult
  $Res call(
      {int? id,
      String nameNote,
      String content,
      String category,
      DateTime? dateCreation,
      DateTime? dateEdit});
}

/// @nodoc
class _$NoteCopyWithImpl<$Res, $Val extends Note>
    implements $NoteCopyWith<$Res> {
  _$NoteCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? nameNote = null,
    Object? content = null,
    Object? category = null,
    Object? dateCreation = freezed,
    Object? dateEdit = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      nameNote: null == nameNote
          ? _value.nameNote
          : nameNote // ignore: cast_nullable_to_non_nullable
              as String,
      content: null == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String,
      category: null == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as String,
      dateCreation: freezed == dateCreation
          ? _value.dateCreation
          : dateCreation // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      dateEdit: freezed == dateEdit
          ? _value.dateEdit
          : dateEdit // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_NoteCopyWith<$Res> implements $NoteCopyWith<$Res> {
  factory _$$_NoteCopyWith(_$_Note value, $Res Function(_$_Note) then) =
      __$$_NoteCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int? id,
      String nameNote,
      String content,
      String category,
      DateTime? dateCreation,
      DateTime? dateEdit});
}

/// @nodoc
class __$$_NoteCopyWithImpl<$Res> extends _$NoteCopyWithImpl<$Res, _$_Note>
    implements _$$_NoteCopyWith<$Res> {
  __$$_NoteCopyWithImpl(_$_Note _value, $Res Function(_$_Note) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? nameNote = null,
    Object? content = null,
    Object? category = null,
    Object? dateCreation = freezed,
    Object? dateEdit = freezed,
  }) {
    return _then(_$_Note(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      nameNote: null == nameNote
          ? _value.nameNote
          : nameNote // ignore: cast_nullable_to_non_nullable
              as String,
      content: null == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String,
      category: null == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as String,
      dateCreation: freezed == dateCreation
          ? _value.dateCreation
          : dateCreation // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      dateEdit: freezed == dateEdit
          ? _value.dateEdit
          : dateEdit // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Note implements _Note {
  const _$_Note(
      {this.id,
      required this.nameNote,
      required this.content,
      required this.category,
      this.dateCreation,
      this.dateEdit});

  factory _$_Note.fromJson(Map<String, dynamic> json) => _$$_NoteFromJson(json);

  @override
  final int? id;
  @override
  final String nameNote;
  @override
  final String content;
  @override
  final String category;
  @override
  final DateTime? dateCreation;
  @override
  final DateTime? dateEdit;

  @override
  String toString() {
    return 'Note(id: $id, nameNote: $nameNote, content: $content, category: $category, dateCreation: $dateCreation, dateEdit: $dateEdit)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Note &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.nameNote, nameNote) ||
                other.nameNote == nameNote) &&
            (identical(other.content, content) || other.content == content) &&
            (identical(other.category, category) ||
                other.category == category) &&
            (identical(other.dateCreation, dateCreation) ||
                other.dateCreation == dateCreation) &&
            (identical(other.dateEdit, dateEdit) ||
                other.dateEdit == dateEdit));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, id, nameNote, content, category, dateCreation, dateEdit);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_NoteCopyWith<_$_Note> get copyWith =>
      __$$_NoteCopyWithImpl<_$_Note>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_NoteToJson(
      this,
    );
  }
}

abstract class _Note implements Note {
  const factory _Note(
      {final int? id,
      required final String nameNote,
      required final String content,
      required final String category,
      final DateTime? dateCreation,
      final DateTime? dateEdit}) = _$_Note;

  factory _Note.fromJson(Map<String, dynamic> json) = _$_Note.fromJson;

  @override
  int? get id;
  @override
  String get nameNote;
  @override
  String get content;
  @override
  String get category;
  @override
  DateTime? get dateCreation;
  @override
  DateTime? get dateEdit;
  @override
  @JsonKey(ignore: true)
  _$$_NoteCopyWith<_$_Note> get copyWith => throw _privateConstructorUsedError;
}
