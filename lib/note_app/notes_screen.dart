import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:math' as math;

import 'package:flutter_revision_1/note_app/hive_helper.dart';

class NotesScreen extends StatefulWidget {
  const NotesScreen({super.key});

  @override
  State<NotesScreen> createState() => _NotesScreenState();
}

class _NotesScreenState extends State<NotesScreen> {
  final _noteController = TextEditingController();

  @override
  void initState() {
    HiveHelper.getNotes();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: _buildAppBar(),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.purple[200],
        onPressed: () async {
          _noteController.clear();
          AlertDialog alert = AlertDialog(
            title: Text("Add your note"),
            content: TextFormField(
              controller: _noteController,
            ),
            actions: [
              TextButton(
                child: Text("OK"),
                onPressed: () {
                  if (_noteController.text.isNotEmpty) {
                    // HiveHelper.notesList.add(_noteController.text);
                    HiveHelper.addNote(_noteController.text);
                    Navigator.pop(context);
                    setState(() {});
                  }
                },
              ),
              TextButton(
                child: Text(
                  "CANCEL",
                  style: TextStyle(color: Colors.black),
                ),
                onPressed: () {
                  Navigator.pop(context);
                  setState(() {});
                },
              ),
            ],
          );

          // show the dialog
          await showDialog(
            context: context,
            builder: (BuildContext context) {
              return alert;
            },
          );
        },
        child: Icon(Icons.add),
      ),
      body: ListView.builder(
          itemCount: HiveHelper.notesList.length,
          itemBuilder: (context, index) => Stack(
                children: [
                  InkWell(
                    onTap: () async {
                      _noteController.text = HiveHelper.notesList[index];
                      AlertDialog alert = AlertDialog(
                        title: Text("Add your note"),
                        content: TextFormField(
                          controller: _noteController,
                        ),
                        actions: [
                          TextButton(
                            child: Text("OK"),
                            onPressed: () {
                              if (_noteController.text.isNotEmpty) {
                                HiveHelper.updateNote(index, _noteController.text);
                                Navigator.pop(context);
                                setState(() {});
                              }
                            },
                          ),
                          TextButton(
                            child: Text(
                              "CANCEL",
                              style: TextStyle(color: Colors.black),
                            ),
                            onPressed: () {
                              Navigator.pop(context);
                              setState(() {});
                            },
                          ),
                        ],
                      );

                      // show the dialog
                      await showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return alert;
                        },
                      );
                    },
                    child: Container(
                      width: double.infinity,
                      height: 100,
                      margin: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: index % 2 == 1
                            ? CupertinoColors.systemPurple.withOpacity(.8)
                            : Colors.deepPurple.withOpacity(.8),
                        // color: Color((math.Random().nextDouble() * 0xFFFFFF).toInt()).withOpacity(1.0),
                      ),
                      child: Center(
                        child: Text(
                          HiveHelper.notesList[index],
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                          ),
                        ),
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      // HiveHelper.notesList.removeAt(index);
                      HiveHelper.removeNote(index);
                      setState(() {});
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Icon(Icons.delete_outline),
                    ),
                  ),
                ],
              )),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      backgroundColor: Colors.purple[200],
      title: Text(
        "Notes",
        style: TextStyle(
          fontSize: 30,
          fontWeight: FontWeight.bold,
        ),
      ),
      actions: [
        _buildActionsButtons(icon: Icons.search),
        _buildActionsButtons(
            icon: Icons.delete_outline,
            onTap: () {
              // HiveHelper.notesList.clear();
              HiveHelper.removeAllNotes();
              setState(() {});
            }),
      ],
    );
  }

  Widget _buildActionsButtons(
      {required IconData icon, void Function()? onTap}) {
    return InkWell(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 0, vertical: 3),
        padding: EdgeInsets.all(16),
        child: Icon(icon),
      ),
    );
  }
}
