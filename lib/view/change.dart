import 'package:flutter/material.dart';

import '../model/user.dart';

class PageChangeNote extends StatefulWidget {
  const PageChangeNote({super.key});

  @override
  State<PageChangeNote> createState() => _PageChangeNoteState();
}

class _PageChangeNoteState extends State<PageChangeNote> {
  @override
  Widget build(BuildContext context) {
    TextEditingController txtName = TextEditingController();
    TextEditingController txtNote = TextEditingController();
    TextEditingController txtCategory = TextEditingController();
    final args = ModalRoute.of(context)!.settings.arguments as User;
    final double skWidth = MediaQuery.of(context).size.width;
    final double skHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SafeArea(
          child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              margin: const EdgeInsets.only(top: 10),
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
              margin: const EdgeInsets.only(top: 10),
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
              margin: const EdgeInsets.only(top: 10),
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
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [],
            )
          ],
        ),
      )),
    );
  }
}
