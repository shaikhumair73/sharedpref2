import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() {
    // TODO: implement createState
    return MyHomePageState();
  }
}

class MyHomePageState extends State<MyHomePage> {
  var mControler = TextEditingController();
  String? nameOfPref;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getData();
    setState(() {});
  }

  void getData() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    nameOfPref = pref.getString("name");
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("shared preference"),
      ),
      body: Column(
        children: [
          Text(nameOfPref != null ? "welcome ,$nameOfPref" : ""),
          TextField(
            controller: mControler,
          ),
          ElevatedButton(
              onPressed: () async {
                var name = mControler.text.toString();
                SharedPreferences pref = await SharedPreferences.getInstance();
                pref.setString("name", name);
              },
              child: Text("button presso"))
        ],
      ),
    );
  }
}
