import 'package:flutter/material.dart';
import 'package:lista_de_tarefas/screen/todoWidgets/todoElement.dart';

import '../../models/todo.dart';

class TodoListScreen extends StatefulWidget {
  const TodoListScreen({super.key});

  @override
  State<TodoListScreen> createState() => _TodoListScreenState();
}

class _TodoListScreenState extends State<TodoListScreen> {
  List<TodoClass> todos = [];
  final TextEditingController TodoController = TextEditingController();
  @override
  Widget build(BuildContext context) {
      var width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SafeArea(child: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
             Row(
              children: [
                Flexible(
                  flex: 3,
                  child: SizedBox(
                    width: width * 79/100,
                    height: 60,
                    child: TextField(
                      controller: TodoController,
                      decoration: InputDecoration(border: OutlineInputBorder()),
                    ),
                  ),
                ),
                SizedBox(width: 20,),
                Flexible(
                  
                  child: SizedBox(
                    width: width * 19/100,
                    height: 60,
                    child: ElevatedButton(onPressed: (){
                      setState(() {
                         String text = TodoController.text;
                      TodoClass newtodo = TodoClass(title: text, dateTime: DateTime.now());
                      todos.add(newtodo);
                       TodoController.clear();
                      print(text);

                      });
                     
                    }, child: Text("+"),style: ButtonStyle()),
                  ),
                )
              ],
             ),
             SizedBox(height: width * 10/100,),
             Expanded(
               child: ListView(
                shrinkWrap: true,
                children: [
                  for(TodoClass todo in todos)
                  Todo(todo: todo,width: width  * 90/100, height:  width * 40/100,)
                ],
               ),
             ),
              Text("Você possui ${todos.length} tarefas"
              )
              
            ],
          ),
        ),
      )),
    );
  }
}