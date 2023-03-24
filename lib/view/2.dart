import 'package:conduit_application/model/note.dart';
import 'package:conduit_application/query/queries.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../model/user.dart';

class PageAllNotes extends StatefulWidget {
  const PageAllNotes({super.key});

  @override
  State<PageAllNotes> createState() => _PageAllNotesState();
}

class _PageAllNotesState extends State<PageAllNotes> {
  TextEditingController txtFilter = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as User;
    List<Color> listColor = [
      Colors.red,
      Colors.orange,
      Colors.yellow,
      Colors.green,
      Colors.blue,
      Colors.purple
    ];
    List<Color> listColorShades = [
      Colors.red.shade100,
      Colors.orange.shade100,
      Colors.yellow.shade100,
      Colors.green.shade100,
      Colors.blue.shade100,
      Colors.purple.shade100,
    ];
    int _widgetCount = 0;
    String token = args.accessToken ?? "";
    final double skWidth = MediaQuery.of(context).size.width;
    final double skHeight = MediaQuery.of(context).size.height;
    var dio = Dio();
    return Scaffold(
      body: SafeArea(
          child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                margin: EdgeInsets.only(top: 10),
                padding: const EdgeInsets.all(4),
                decoration: BoxDecoration(
                  border:
                      Border.all(width: 1, color: Colors.deepOrange.shade300),
                  borderRadius: BorderRadius.circular(10),
                ),
                width: skWidth * 0.7,
                height: skHeight * 0.07,
                child: TextField(
                  controller: txtFilter,
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                    hintText: 'Поиск по названию',
                  ),
                ),
              ),
              ElevatedButton(
                  onPressed: () {
                    var q = txtFilter.text;
                    setState(() {
                      txtFilter.text = q;
                    });
                    print(txtFilter.text);
                  },
                  child: Icon(Icons.saved_search))
            ],
          ),
          SizedBox(
            height: skHeight * 0.7,
            child: FutureBuilder<List<Note>>(
              future: QQuery(dio).getAllNotes(token, txtFilter.text),
              builder:
                  (BuildContext context, AsyncSnapshot<List<Note>> snapshot) {
                if (!snapshot.hasData) {
                  return const Center(
                    child: Text(
                      'Loading...',
                      style: TextStyle(
                        color: Colors.black,
                      ),
                    ),
                  );
                }
                if (snapshot.data!.isEmpty) {
                  return const Center(
                    child: Text(
                      'Loading...',
                      style: TextStyle(
                        color: Colors.black,
                      ),
                    ),
                  );
                }
                return ListView.builder(
                  itemCount: snapshot.data!.length,
                  itemBuilder: (BuildContext context, int index) {
                    _widgetCount++;
                    Note note = snapshot.data![index];
                    return ListTile(
                      onLongPress: () {},
                      title: Container(
                        decoration: BoxDecoration(
                          color: listColorShades[_widgetCount % 6],
                          border: Border.all(
                              width: 2, color: listColor[_widgetCount % 6]),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Center(
                              child: Container(
                                margin: const EdgeInsets.only(top: 10),
                                child: Text(
                                  'Название:${note.nameNote}',
                                  style: const TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              margin: const EdgeInsets.only(
                                  top: 10, left: 10, right: 10),
                              child: Text('Содержание:${note.content}'),
                            ),
                            Container(
                              margin: const EdgeInsets.only(
                                  top: 10, left: 10, right: 10),
                              child: Text('Категория:${note.category}'),
                            ),
                            Container(
                              alignment: Alignment.bottomRight,
                              margin: const EdgeInsets.only(
                                  top: 10, left: 10, right: 10, bottom: 10),
                              child: Text(
                                'Дата создания:${DateFormat('dd.MM.yyyy hh:mm').format(note.dateCreation!)}',
                                style: const TextStyle(fontSize: 12),
                              ),
                            ),
                            Container(
                                child: ElevatedButton(
                                    onPressed: () {
                                      QQuery(dio)
                                          .deleteLogicNote(note.id!, token);
                                    },
                                    child: Icon(Icons.delete_outline_rounded))),
                            Container(
                                child: ElevatedButton(
                                    onPressed: () {
                                      QQuery(dio)
                                          .deleteNote(note.id!, token);
                                    },
                                    child: Icon(Icons.delete))),
                            note.dateEdit == note.dateCreation
                                ? Container()
                                : Container(
                                    alignment: Alignment.bottomRight,
                                    margin: const EdgeInsets.only(
                                        top: 10,
                                        left: 10,
                                        right: 10,
                                        bottom: 10),
                                    child: Text(
                                      'Дата изменения:${DateFormat('dd.MM.yyyy hh:mm').format(note.dateEdit!)}',
                                      style: const TextStyle(fontSize: 12),
                                    ),
                                  ),
                          ],
                        ),
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ],
      )),
    );
  }
}
