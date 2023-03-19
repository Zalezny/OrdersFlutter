import 'package:flutter/material.dart';
import 'package:testapp/pages/selected_order_page/selected_order_page.dart';
import 'package:testapp/web_api/dto/orders.dart';

class OrdersItem extends StatelessWidget {
  final Orders orderItem;
  final Function swipeArchiveOrder;
  const OrdersItem({
    super.key,
    required this.orderItem,
    required this.swipeArchiveOrder,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GestureDetector(
        behavior: HitTestBehavior.translucent,
        onTap: () => Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => SelectedOrderPage(
                      selectedOrder: orderItem,
                      swipeArchive: swipeArchiveOrder,
                    ))),
        child: IntrinsicHeight(
          child: Stack(
            alignment: Alignment.centerRight,
            children: [
              const SizedBox(
                  height: double.infinity,
                  child: Padding(
                      padding: EdgeInsets.only(bottom: 25),
                      child: Icon(
                        Icons.priority_high,
                        color: Colors.blueAccent,
                      ))),
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(
                    height: 15,
                  ),
                  Text(
                    "Zamówienie nr ${orderItem.orderNumber}",
                    style: const TextStyle(fontFamily: 'Roboto', fontSize: 24),
                  ),
                  Text(
                    "${orderItem.name} ${orderItem.lastName}",
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  const Divider(
                    color: Colors.black,
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
