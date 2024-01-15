// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class TodoListPage extends StatefulWidget {
  const TodoListPage({super.key});

  @override
  State<TodoListPage> createState() => _TodoListPageState();
}

class _TodoListPageState extends State<TodoListPage> {
  TextEditingController _textEditingController = TextEditingController();

  List<String> tarefas = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        title: Center(
          child: Text('To Do List'),
        ),
      ),
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.all(24),
          child: Column(
            children: [
              TextField(
                controller: _textEditingController,
              ),
              Container(
                height: 300,
                child: ListView.separated(
                    separatorBuilder: (context, index) => Divider(),
                    itemCount: tarefas.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        title: Text(tarefas[index]),
                        trailing: TextButton(
                          onPressed: () {
                            setState(
                              () {
                                tarefas.removeAt(index);
                              },
                            );
                          },
                          child: Icon(Icons.remove),
                        ),
                      );
                    }),
              )
            ],
          ),
        ),
      ),
      floatingActionButton:
          Row(mainAxisAlignment: MainAxisAlignment.end, children: [
        FloatingActionButton(
          onPressed: () {
            if (_textEditingController.text.length > 0) {
              setState(() {
                tarefas.add(_textEditingController.text);
              });
              _textEditingController.clear();
            }
          },
          child: Icon(Icons.add),
        ),
        SizedBox(
          width: 15,
        ),
        FloatingActionButton(
          onPressed: () {
            setState(() {
              tarefas = [];
            });
            _textEditingController.clear();
          },
          child: Icon(Icons.delete),
        ),
      ]),
    );
  }
}
