import 'package:flutter/material.dart';
import './item.dart';
import './item_widget.dart';
import './Sheet_widget.dart';

class ItemsScreen extends StatefulWidget {
  const ItemsScreen({Key? key}) : super(key: key);

  @override
  _ItemsScreenState createState() => _ItemsScreenState();
}

class _ItemsScreenState extends State<ItemsScreen> {
  List<Item> _items = [
    Item(id: '1', title: 'item1', price: 20, date: DateTime.now()),
    Item(id: '2', title: 'item2', price: 322233, date: DateTime.now()),
    Item(id: '3', title: 'item3', price: 222, date: DateTime.now()),
  ];

  void _showSheet() {
    showModalBottomSheet(
        context: context, builder: (_) => SheetWidget(addItem));
  }

  void removeItem(String id) {
    setState(() {
      _items.removeWhere((item) => item.id == id);
    });
  }

  void addItem(String title, double price, DateTime date) {
    setState(() {
      _items.add(Item(
          id: DateTime.now().toString(),
          title: title,
          price: price,
          date: date));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green[400],
        title: Center(child: Text('Baraa Store')),
      ),
      body: _items.length == 0
          ? Center(
              child: Image.asset('assets/download.png'),
            )
          : Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: ListView.builder(
                itemCount: _items.length,
                itemBuilder: (_, index) => ItemWidget(
                    _items[index].id,
                    _items[index].title,
                    _items[index].price,
                    _items[index].date,
                    removeItem),
              ), // تدعم سكرولنج لتحت
            ),
      floatingActionButton:
          FloatingActionButton(onPressed: _showSheet, child: Icon(Icons.add)),
    );
  }
}
