import 'package:flutter/material.dart';

class SheetWidget extends StatefulWidget {
  final Function(String title, double price, DateTime date) addItem;
  SheetWidget(this.addItem, {Key? key}) : super(key: key);

  @override
  _SheetWidgetState createState() => _SheetWidgetState();
}

class _SheetWidgetState extends State<SheetWidget> {
  DateTime? _selectedDate;
  var _titleController = TextEditingController();
  var _titlePrice = TextEditingController();

  void showDate(context) {
    showDatePicker(
            context: context,
            initialDate: DateTime.now(),
            firstDate: DateTime(1900),
            lastDate: DateTime.now())
        .then((date) {
      setState(() {
        _selectedDate = date;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          TextField(
            controller: _titleController,
            decoration: InputDecoration(
              labelText: 'Title',
              border: UnderlineInputBorder(),
              hoverColor: Colors.red,
            ),
            keyboardType: TextInputType.text,
          ),
          TextField(
            controller: _titlePrice,
            decoration: InputDecoration(labelText: 'price'),
            keyboardType: TextInputType.number,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text(_selectedDate == null ? 'selected Date' : '$_selectedDate'),
              TextButton(
                onPressed: () => showDate(context),
                child: Text('Choose Date'),
              )
            ],
          ),
          ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
                widget.addItem(_titleController.text,
                    double.parse(_titlePrice.text), _selectedDate!);
                print(_titleController.text);
                print(_titlePrice.text);
              },
              child: Text('add button'))
        ],
      ),
    );
  }
}
