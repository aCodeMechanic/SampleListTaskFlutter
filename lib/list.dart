import 'package:flutter/material.dart';

var valueMap = <String,int>{};
class ListWidget extends StatelessWidget {
  const ListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    var list = <Widget>[];
    for (var i = 0; i <= 100; i++) {
      valueMap['$i'] = 0;
      list.add(ListItemWidget(indexKey: '$i'));
    }
    return ListView.builder(
        itemCount: list.length, itemBuilder: (context, index) => list[index]);
  }
}

class ListItemWidget extends StatefulWidget {
  final String indexKey;

  const ListItemWidget({super.key,required this.indexKey});

  @override
  State<ListItemWidget> createState() => _ListItemWidgetState();
}

class _ListItemWidgetState extends State<ListItemWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(4),
      child: ListTile(
        key: ValueKey<String>(widget.indexKey),
        title: Text(valueMap[widget.indexKey].toString()),
        trailing: MaterialButton(
          onPressed: () {
              valueMap[widget.indexKey] = valueMap[widget.indexKey]! + 1;
          setState(() {});
          },
          child: const Text("+"),
        ),
      ),
    );
  }
}
