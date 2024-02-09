import "package:flutter/material.dart";
import "package:flutter_slidable/flutter_slidable.dart";

class ToDoTile extends StatelessWidget {
  final String taskName;
  final bool taskCompleted;
  Function(bool?)? onChanged;
  Function(BuildContext) deleteTaskFunction;
  final bool toggleStared;
  VoidCallback starredTaskFucntion;

  ToDoTile({
    super.key,
    required this.taskName,
    required this.taskCompleted,
    required this.onChanged,
    required this.deleteTaskFunction,
    required this.toggleStared,
    required this.starredTaskFucntion,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 25.0, right: 25, top: 25),
      child: Slidable(
        endActionPane: ActionPane(motion: StretchMotion(), children: [
          SlidableAction(
            onPressed: deleteTaskFunction,
            icon: Icons.delete,
            backgroundColor: Colors.red.shade300,
            borderRadius: BorderRadius.circular(15),
          )
        ]),
        child: Container(
          padding: EdgeInsets.all(24),
          decoration: BoxDecoration(
            color: Colors.yellow,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  // CheckBox
                  Checkbox(
                    value: taskCompleted,
                    onChanged: onChanged,
                    activeColor: Colors.black,
                    checkColor: Colors.white,
                  ),
                  // Task Name
                  SizedBox(
                    width: 195,
                    child: Text(
                      taskName,
                      softWrap: true,
                      style: TextStyle(
                        decoration: taskCompleted
                            ? TextDecoration.lineThrough
                            : TextDecoration.none,
                      ),
                    ),
                  ),
                ],
              ),
              IconButton(
                onPressed: starredTaskFucntion,
                icon: toggleStared == true
                    ? Icon(
                        Icons.star_rounded,
                        size: 30,
                        color: Colors.black,
                      )
                    : Icon(Icons.star_border_rounded),
              )
            ],
          ),
        ),
      ),
    );
  }
}
