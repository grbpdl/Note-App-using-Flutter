import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class MyCard extends StatelessWidget {
  const MyCard({super.key});

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
                  "This is a note xbsf sfb sb sfv ",
                  style: TextStyle(fontSize: 80, color: Colors.white),
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.black,
                ),
                child: IconButton(
                    hoverColor: Colors.red,
                    onPressed: delete,
                    icon: Icon(
                      Icons.delete,
                      color: Colors.white,
                      size: 100,
                    )),
              )
            ]),
      ),
    );
  }

  void delete() {}
}
