import 'package:custom_form_field/custom_form_field.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  GlobalKey<FormState> key = GlobalKey<FormState>();
  String? _name;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Custom form field Demo"),
      ),
      body: Form(
        key: key,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomFormField().field(
              question: "Name",
              canBeNull: false,
              formKey: key,
              onSavedCallback: (String val) {
                _name = val;
              },
              horizontalTextPadding: 20,
              verticalTextPadding: 10,
              labelTextStyle: const TextStyle(color: Colors.black),
              icon: const Icon(
                Icons.email_outlined,
                color: Colors.grey,
                size: 25,
              ),
              fieldTextFontSize: 15,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 50),
              child: ElevatedButton(
                  onPressed: () {
                    key.currentState!.save();
                    debugPrint(_name);
                  },
                  child: const Text("SUBMIT")),
            )
          ],
        ),
      ),
    );
  }
}
