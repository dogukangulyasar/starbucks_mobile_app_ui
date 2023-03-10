import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:provider/provider.dart';
import 'package:starbucks_mobile_app_ui/constants/colors.dart';
import 'package:starbucks_mobile_app_ui/providers/horizontal_screen_provider.dart';
import 'package:starbucks_mobile_app_ui/screens/order/widgets/horizontal_category_list.dart';
import 'package:starbucks_mobile_app_ui/screens/order/widgets/list_item_widget.dart';
import 'package:starbucks_mobile_app_ui/screens/order/widgets/packet_details_widget.dart';

class OrderScreen extends StatefulWidget {
  const OrderScreen({super.key});

  @override
  State<OrderScreen> createState() => _OrderScreenState();
}

class _OrderScreenState extends State<OrderScreen> {
  // This lists will come from database,
  // it works: [[Most sellers list], [Foods list], [Coffees list]]
  List<List<ListItem>> lists = [
    // Most sellers list
    [
      ListItem(showPieceWidget: false, title: "Hazelnut Coffee", price: 20),
      ListItem(showPieceWidget: false, title: "Americano", price: 30),
      ListItem(showPieceWidget: false, title: "Caramel Latte", price: 50),
      ListItem(showPieceWidget: false, title: "Kraker", price: 40),
      ListItem(
          showPieceWidget: false, title: "White Chocolate Mocha", price: 60),
      ListItem(showPieceWidget: false, title: "Mocha", price: 55),
    ],
    // Foods list
    [
      ListItem(showPieceWidget: false, title: "Kraker", price: 20),
      ListItem(showPieceWidget: false, title: "Sandviç", price: 30),
      ListItem(showPieceWidget: false, title: "Tost", price: 50),
    ],
    // Coffees list
    [
      ListItem(showPieceWidget: false, title: "Hazelnut Coffee", price: 20),
      ListItem(showPieceWidget: false, title: "Americano", price: 30),
      ListItem(showPieceWidget: false, title: "Caramel Latte", price: 50),
      ListItem(showPieceWidget: false, title: "Latte", price: 40),
      ListItem(
          showPieceWidget: false, title: "White Chocolate Mocha", price: 60),
      ListItem(showPieceWidget: false, title: "Mocha", price: 55),
    ],
    // Bottles list
    [
      ListItem(showPieceWidget: false, title: "Yeşil termos", price: 20),
      ListItem(showPieceWidget: false, title: "Pembe termos", price: 30),
    ]
  ];

  @override
  Widget build(BuildContext context) {
    int currentHorizontalIndex =
        Provider.of<HorizontalScreenProvider>(context).index;
    return Center(
      child: Column(
        children: [
          const PacketDetails(),
          Expanded(
            flex: 2,
            child: Container(
              color: Colors.white,
              child: SizedBox(
                height: MediaQuery.of(context).size.height,
                child: SingleChildScrollView(
                  child: IntrinsicHeight(
                    child: Column(
                      children: [
                        // Menu text
                        Padding(
                          padding: const EdgeInsets.only(
                            left: 20,
                            bottom: 10,
                            top: 10,
                          ),
                          child: Row(
                            children: [
                              Text(
                                "Menu",
                                style: TextStyle(
                                    color: HexColor(darkGreen),
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ),
                        const HorizontalCategoryList(),
                        SizedBox(
                          // TODO: Make sure it is responsive
                          height: 400,
                          child: ListView.builder(
                            itemCount:
                                lists.elementAt(currentHorizontalIndex).length,
                            itemBuilder: (context, index) {
                              return lists
                                  .elementAt(currentHorizontalIndex)[index];
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
