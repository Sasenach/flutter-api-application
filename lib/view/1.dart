import 'package:conduit_application/model/note.dart';
import 'package:conduit_application/model/user.dart';
import 'package:conduit_application/query/queries.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class PageHome extends StatefulWidget {
  const PageHome({super.key});

  @override
  State<PageHome> createState() => _PageHomeState();
}

class _PageHomeState extends State<PageHome> {
  @override
  Widget build(BuildContext context) {
    TextEditingController txtName = TextEditingController();
    TextEditingController txtNote = TextEditingController();
    TextEditingController txtCategory = TextEditingController();
    final args = ModalRoute.of(context)!.settings.arguments as User;
    final double skWidth = MediaQuery.of(context).size.width;
    final double skHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          final dio = Dio();
          final note = Note(
              nameNote: txtName.text,
              content: txtNote.text,
              category: txtCategory.text);
          var token = args.accessToken ?? "";
          QQuery(dio).createNote(note, token);
          setState(() {
            txtName.text = '';
            txtNote.text = '';
            txtCategory.text = '';
          });
        },
        child: Icon(Icons.add_circle_outline),
      ),
      body: SafeArea(
          child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              margin: EdgeInsets.only(top: 10),
              padding: const EdgeInsets.all(4),
              decoration: BoxDecoration(
                border: Border.all(width: 1, color: Colors.deepOrange.shade300),
                borderRadius: BorderRadius.circular(10),
              ),
              width: skWidth * 0.9,
              height: skHeight * 0.07,
              child: TextField(
                controller: txtName,
                decoration: const InputDecoration(
                  border: InputBorder.none,
                  hintText: 'Название',
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 10),
              padding: const EdgeInsets.all(4),
              decoration: BoxDecoration(
                border: Border.all(width: 1, color: Colors.deepOrange.shade300),
                borderRadius: BorderRadius.circular(10),
              ),
              width: skWidth * 0.9,
              height: skHeight * 0.07,
              child: TextField(
                controller: txtNote,
                decoration: const InputDecoration(
                  border: InputBorder.none,
                  hintText: 'Содержание',
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 10),
              padding: const EdgeInsets.all(4),
              decoration: BoxDecoration(
                border: Border.all(width: 1, color: Colors.deepOrange.shade300),
                borderRadius: BorderRadius.circular(10),
              ),
              width: skWidth * 0.9,
              height: skHeight * 0.07,
              child: TextField(
                controller: txtCategory,
                decoration: const InputDecoration(
                  border: InputBorder.none,
                  hintText: 'Категория',
                ),
              ),
            ),
          ],
        ),
      )),
    );
  }
}
