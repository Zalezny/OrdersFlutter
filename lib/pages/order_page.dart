import 'package:flutter/material.dart';
import 'package:testapp/pages/item_page.dart';
import 'package:testapp/utils/const_database.dart';
import '../models/order_model.dart';

class OrderPage extends StatefulWidget {
  final bool isSend;
  final List<Orders> ordersList;

  const OrderPage({super.key, required this.ordersList, required this.isSend});

  @override
  State<OrderPage> createState() => _OrderPageState();
}

class _OrderPageState extends State<OrderPage> {
  final List<String> exampleList =
      List<String>.generate(10000, (i) => 'Item $i');

  void _swipeArchiveOrder(String id, bool archiveBool) {
    final index = widget.ordersList.indexWhere((element) => element.sId == id);
    var obj = widget.ordersList[index];
    obj.archive = archiveBool;
    widget.ordersList.removeAt(index);
    setState(() {
      widget.ordersList.insert(index, obj);
    });
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      reverse: true,
      itemBuilder: ((context, index) {
        final currItem = widget.ordersList[index];
        if (currItem.archive == widget.isSend) {
          return ListTile(
            leading: CircleAvatar(
              backgroundImage: NetworkImage("$https${currItem.order[0].photo}"),
            ),
            title: Text(
              "${currItem.name} ${widget.ordersList[index].lastName}",
              style: const TextStyle(fontSize: 20),
            ),
            subtitle: Text(
              "Zamówienie nr ${currItem.orderNumber}",
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            trailing: currItem.newOrder!
                ? const Icon(Icons.priority_high)
                : const Icon(null),
            iconColor: Colors.red,
            onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => ItemPage(
                          selectedOrder: currItem,
                          swipeArchive: _swipeArchiveOrder,
                        ))),
          );
        }
        return const SizedBox(height: 0);
      }),
      itemCount: widget.ordersList.length,
    );
  }
}
