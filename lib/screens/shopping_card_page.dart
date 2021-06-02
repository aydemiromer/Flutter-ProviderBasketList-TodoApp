import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_example/model/text_add_model.dart';

class ShoppingCardPage extends StatefulWidget {
  @override
  _ShoppingCardPageState createState() => _ShoppingCardPageState();
}

class _ShoppingCardPageState extends State<ShoppingCardPage> {
  @override
  Widget build(BuildContext context) {
    return Consumer<TextModel>(
      builder: (context, textmodel, child) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.orange,
            title: Text("Shopping List"),
          ),
          body: Container(
            child: Column(
              children: [
                Expanded(
                  child: textmodel.shoppingCard.length == 0
                      ? Text("Your shopping cart is empty")
                      : ListView.builder(
                          itemCount: textmodel.shoppingCard.length,
                          itemBuilder: (context, index) {
                            return Card(
                              child: ListTile(
                                title: Text(
                                    textmodel.shoppingCard[index].productName),
                                subtitle: Text(textmodel
                                    .shoppingCard[index].price
                                    .toString()),
                                trailing: IconButton(
                                  icon: Icon(Icons.delete),
                                  onPressed: () {
                                    textmodel
                                        .delete(textmodel.shoppingCard[index]);
                                  },
                                ),
                              ),
                            );
                          }),
                ),
                Card(
                  child: ListTile(
                    title: Text('TOTAL PRICE => ${textmodel.total} ₺'),
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
