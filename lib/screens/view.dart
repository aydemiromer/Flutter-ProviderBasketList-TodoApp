import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_example/model/text_add_model.dart';
import 'package:provider_example/screens/shopping_card_page.dart';

class ViewPage extends StatefulWidget {
  ViewPage({Key key}) : super(key: key);

  @override
  _ViewPageState createState() => _ViewPageState();
}

class _ViewPageState extends State<ViewPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController textController = TextEditingController();
  final TextEditingController priceController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    TextModel products = Provider.of<TextModel>(context);

    return Consumer<TextModel>(builder: (context, textmodel, child) {
      return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.orange,
          title: Center(child: Text('ShopCart and Todolist')),
          actions: [
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Row(
                children: <Widget>[
                  IconButton(
                    icon: Icon(
                      Icons.shopping_cart,
                      color: Colors.white,
                    ),
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => ShoppingCardPage()));
                    },
                  ),
                  Text(textmodel.countadd.toString())
                ],
              ),
            )
          ],
        ),
        body: Container(
          child: Column(
            children: [
              Expanded(
                child: ListView.builder(
                    itemCount: products.allProducts.length,
                    itemBuilder: (context, index) {
                      return Card(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(products.allProducts[index].productName),
                            Text(
                                '${products.allProducts[index].price.toString()}₺'),
                            Row(
                              children: [
                                IconButton(
                                  icon: Icon(Icons.shopping_cart),
                                  onPressed: () {
                                    textmodel.add(products.allProducts[index]);
                                  },
                                ),
                                IconButton(
                                  icon: Icon(Icons.delete),
                                  onPressed: () {
                                    products.deleteProduct(
                                        products.allProducts[index]);
                                  },
                                ),
                              ],
                            ),
                          ],
                        ),
                      );
                    }),
              ),
              Form(
                key: _formKey,
                child: Container(
                  child: Column(
                    children: [
                      TextFormField(
                        controller: textController,
                        validator: (value) {
                          if (value.isEmpty) {
                            return " boş olamaz.";
                          } else {
                            return null;
                          }
                        },
                        decoration: InputDecoration(
                            hintText: "Product or Todo name",
                            suffixIcon: IconButton(
                              icon: Icon(Icons.clear),
                              onPressed: () {
                                textController.clear();
                              },
                            )),
                      ),
                      TextFormField(
                        controller: priceController,
                        keyboardType: TextInputType.number,
                        validator: (value) {
                          if (value.isEmpty) {
                            return " not be empty.";
                          } else {
                            return null;
                          }
                        },
                        decoration: InputDecoration(
                            hintText: "Price",
                            suffixIcon: IconButton(
                              icon: Icon(Icons.clear),
                              onPressed: () {
                                priceController.clear();
                              },
                            )),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            ElevatedButton(
                              onPressed: () {
                                products.addProduct(
                                  Product(
                                      price: int.parse(priceController.text),
                                      productName: textController.text),
                                );
                              },
                              child: Text('Add'),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    });
  }
}
