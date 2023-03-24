import 'dart:convert';

import 'package:conduit_application/model/note.dart';
import 'package:dio/dio.dart';

class QQuery {
  QQuery(this.dio);
  Future<List<Note>> getAllNotes(String token, String search) async {
    List<Note> listNote = [];
    // try {
    var result = await dio.get(
      "http://127.0.0.1:2222/note",
      options: Options(headers: {'Authorization': 'Bearer $token'}),
      queryParameters: {
        "page": 0,
        "search": search,
      },
    );
    List<dynamic> jsonList = result.statusCode != 200 ? [] : result.data;
    listNote = jsonList.map((json) => Note.fromJson(json)).toList();
    // } on DioError catch (e) {
    //   print(e.message);
    // }
    return listNote;
  }

  final Dio dio;
  Future<void> createNote(Note note, String token) async {
    try {
      var result = await dio.post(
        "http://127.0.0.1:2222/note",
        data: note.toJson(),
        options: Options(headers: {'Authorization': 'Bearer $token'}),
      );
    } on DioError catch (e) {
      print(e.message);
    }
  }

  Future<void> deleteLogicNote(int id, String token) async {
    try {
      var result = await dio.put(
        "http://127.0.0.1:2222/note",
        queryParameters: {"id": id},
        options: Options(headers: {'Authorization': 'Bearer $token'}),
      );
    } on DioError catch (e) {
      print(e.message);
    }
  }

  Future<void> deleteNote(int id, String token) async {
    try {
      var result = await dio.delete(
        "http://127.0.0.1:2222/note/$id",
        options: Options(headers: {'Authorization': 'Bearer $token'}),
      );
    } on DioError catch (e) {
      print(e.message);
    }
  }
}
