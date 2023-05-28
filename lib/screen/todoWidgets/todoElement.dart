import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:lista_de_tarefas/models/todo.dart';
import 'package:intl/intl.dart';

class Todo extends StatefulWidget { 
  final TodoClass todo;
  final double width;
  final double height;
  const Todo({super.key, required this.todo, required this.height, required this.width});
   
  @override
  State<Todo> createState() => _TodoState();
}

class _TodoState extends State<Todo> {
  @override
  Widget build(BuildContext context) {
    return Container(
        width: widget.width,
        height: widget.height,
      child: Slidable(endActionPane: ActionPane(motion: BehindMotion(), children: [
        SlidableAction(onPressed: (context) {
          
        },backgroundColor: Colors.red, icon: Icons.delete,)
      
      ] ),child:  
      Container(
          width: widget.width,
        height: 600,
        margin: EdgeInsets.only(top: 20),
        decoration:const BoxDecoration(
          color:  Color.fromARGB(255, 232, 232, 232),
        ),
        child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
             Padding(
              padding: const EdgeInsets.only(right: 8, left: 8, top: 8),
              child: Text(DateFormat("dd/MM/yyyy - HH:mm").format(widget.todo.dateTime)),
            ),
            Padding(
              padding: const EdgeInsets.all(8),
              child: Text(widget.todo.title, style: TextStyle(fontSize: 20, color: Colors.blue),
              ),
      
            )
          ],
        ),
      ),),
    );
  }
}