import 'package:flutter/material.dart';

class MyCard extends StatelessWidget {
  final String note;
  final VoidCallback onDelete;

  const MyCard({Key? key, required this.note, required this.onDelete})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Card(
        color: Colors.grey,
        elevation: 4,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: Text(
                note,
                style: TextStyle(fontSize: 20, color: Colors.white),
              ),
            ),
            Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.black,
              ),
              child: IconButton(
                hoverColor: Colors.red,
                onPressed: onDelete,
                icon: Icon(
                  Icons.delete,
                  color: Colors.white,
                  size: 30,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
