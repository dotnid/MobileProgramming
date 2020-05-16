import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tugasapi/PostMethod.dart';

import 'KeyModel.dart';
import 'ModelPostResult.dart';

void main() => runApp(My2ndApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'GET Method API APPS'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  PostResult postResult = null;
  User user = null;
  String nilai = "";
  TextEditingController controller = TextEditingController(text: "");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  child: Image.network(
                    ((user != null)
                        ? user.avatar
                        : "https://www.gravatar.com/avatar/00000000000000000000000000000000?d=mp&f=y"),
                  ),
                )
              ],
            ),
            Text((user != null) ? "ID : " + user.id : "Tidak ada Data "),
            Text((user != null) ? "Nama : " + user.name : "Tidak ada Data "),
            Text((user != null) ? "Email : " + user.email : "Tidak ada Data "),
            TextField(
              textAlign: TextAlign.center,
              decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: 'Masukan ID User!',
                  hintStyle: TextStyle(color: Colors.grey)),
              controller: controller,
            ),
            RaisedButton(
              onPressed: () {
                User.connectToAPI(controller.text).then((value) {
                  user = value;
                  setState(() {});
                });
              },
              child: Text("GET"),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                RaisedButton(
                  onPressed: () {
                    Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (context) {
                      return My2ndApp();
                    }));
                  },
                  child: Text("POST Method"),
                ),
              ],
            ),
/*            Row(
              children: <Widget>[
                Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text((postResult != null)
                          ? postResult.id +
                          " | " +
                          postResult.name +
                          " | " +
                          postResult.created
                          : "Tidak ada Data "),
                      RaisedButton(
                        onPressed: () {
                          PostResult.connectToAPI("Dodot", "Tech").then((value) {
                            postResult = value;
                            setState(() {});
                          });
                        },
                        child: Text("POST"),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          RaisedButton(
                            onPressed: () {
                              Navigator.pushReplacement(context,
                                  MaterialPageRoute(builder: (context) {
                                    return MyApp();
                                  }));
                            },
                            child: Text("GET Method"),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            )
*/          ],
        ),
      ),
    );
  }
}
