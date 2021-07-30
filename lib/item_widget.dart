import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ItemWidget extends StatefulWidget {
  final String id, title;
  final double price;
  final DateTime date;
  final Function removeItem;
  const ItemWidget(this.id, this.title, this.price, this.date, this.removeItem,
      {Key? key})
      : super(key: key);

  @override
  _ItemWidgetState createState() => _ItemWidgetState();
}

class _ItemWidgetState extends State<ItemWidget> {
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 10,
      child: (ListTile(
        leading: CircleAvatar(
          backgroundColor: Colors.black,
          child: FittedBox(
            child: Text('${widget.price}'),
          ),
        ),
        title: Center(
          child: Text('${widget.title}'),
        ),
        subtitle: Center(
          child: Text('${DateFormat.yMMMEd().format(widget.date)}'),
        ),
        trailing: IconButton(
            onPressed: () {
              setState(
                () {
                  widget.removeItem(widget.id);
                },
              );
            },
            icon: Icon(Icons.delete, color: Colors.black)),
      )),
    );
  }
}
