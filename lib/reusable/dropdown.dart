import 'package:flutter/material.dart';

class DropdownButtonExample extends StatefulWidget {
  final String des1;
  const DropdownButtonExample({super.key, required this.des1});

  @override
  State<DropdownButtonExample> createState() => _DropdownButtonExampleState();
}

class _DropdownButtonExampleState extends State<DropdownButtonExample> {
  late List<String> list;
  late String dropdownValue;

  @override
  void initState() {
    super.initState();

    // Initialize the list using widget.des1
    list = <String>['Two', widget.des1, 'Three', 'Four'];

    // Set the initial dropdown value
    dropdownValue = list.first;
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 800,
      child: DropdownButton<String>(
        value: dropdownValue,
        icon: const Icon(Icons.arrow_downward),
        elevation: 16,
        style: const TextStyle(color: Colors.deepPurple),
        underline: Container(
          height: 2,
          color: Colors.deepPurpleAccent,
        ),
        onChanged: (String? value) {
          // This is called when the user selects an item.
          setState(() {
            dropdownValue = value!;
          });
        },
        items: list.map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(value, overflow: TextOverflow.ellipsis),
          );
        }).toList(),
      ),
    );
  }
}
