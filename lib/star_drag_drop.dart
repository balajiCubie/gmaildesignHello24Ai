import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: StarDragDrop(),
    );
  }
}

class StarDragDrop extends StatefulWidget {
  @override
  _StarDragDropState createState() => _StarDragDropState();
}

class _StarDragDropState extends State<StarDragDrop> {
  List<Widget> inUseStars = [];
  List<Widget> notInUseStars = [
    Icon(Icons.star, color: Colors.orange),
    Icon(Icons.star, color: Colors.purple),
    Icon(Icons.star, color: Colors.pink),
    Icon(Icons.star, color: Colors.red),
    Icon(Icons.star, color: Colors.green),
    Icon(Icons.star, color: Colors.blue),
    Icon(Icons.star, color: Colors.grey),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Drag and Drop Stars')),
      body: Column(
        children: <Widget>[
          buildTarget(context, "In use", inUseStars, true),
          buildTarget(context, "Not in use", notInUseStars, false),
        ],
      ),
    );
  }

  Widget buildTarget(BuildContext context, String title,
      List<Widget> acceptingList, bool isInUse) {
    return DragTarget<Widget>(
      onAccept: (data) {
        if (isInUse) {
          inUseStars.add(data);
          notInUseStars.remove(data);
        } else {
          notInUseStars.add(data);
          inUseStars.remove(data);
        }
        setState(() {});
      },
      builder: (context, candidateData, rejectedData) {
        return Container(
          height: 100.0,
          color: isInUse ? Colors.lightGreenAccent : Colors.lightBlueAccent,
          child: Column(
            children: [
              Text(title),
              Expanded(
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: acceptingList.map((star) {
                    return Draggable<Widget>(
                      data: star,
                      child: star,
                      feedback: Material(
                        child: Icon(Icons.star,
                            size: 50, color: (star as Icon).color),
                        color: Colors.transparent,
                        elevation: 4.0,
                      ),
                      childWhenDragging: Icon(Icons.star_border),
                    );
                  }).toList(),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
