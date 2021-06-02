import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_example/model/text_add_model.dart';
import 'package:provider_example/screens/view.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => TextModel(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: ViewPage(),
      ),
    );
  }
}
