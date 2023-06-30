import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:url_launcher/url_launcher.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'WhatsApp',
      theme: ThemeData(
        colorScheme:
            ColorScheme.fromSeed(seedColor: Color.fromARGB(255, 16, 153, 25)),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Open WhatsApp Chat'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String? contact;
  var values = "";
  checking() {
    if (values.isNotEmpty) {
      if (values.length >= 8) {
        whatsapp();
      } else {
        Fluttertoast.showToast(
            msg: "Error!: Number length must be 8.",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.red,
            textColor: Colors.white,
            fontSize: 16.0);
      }
    } else {
      Fluttertoast.showToast(
          msg: "Error!: no number found.",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0);
    }
  }

  whatsapp() async {
    var url = "https://wa.me/+968$contact";
    await launchUrl(Uri.parse(url));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Past the phone number down (ex. 98765432)',
              style: TextStyle(fontSize: 18),
            ),
            Padding(
              padding: EdgeInsets.only(top: 8,bottom: 10, left: 30, right: 30),
              child: Container(
                padding: EdgeInsets.fromLTRB(20, 2, 10, 2),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    border: Border.all(color: Color.fromARGB(255, 16, 153, 25))),
                child: TextField(
                  keyboardType: TextInputType.phone,
                  onChanged: (value) => values = value,
                  maxLines: 1,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    labelText: "Phone Number",
                  ),
                ),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                checking();
              },
              child: Text('Open Chat'),
            )
          ],
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
