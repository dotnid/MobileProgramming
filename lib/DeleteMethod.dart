import 'package:flutter/material.dart';
import 'package:tugasapi/main.dart';

import 'ModelPostResult.dart';

class My4ndApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: PostMethod(title: 'POST Method API APPS'),
    );
  }
}

class PostMethod extends StatefulWidget {
  PostMethod({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _PostMethod createState() => _PostMethod();
}

class _PostMethod extends State<PostMethod> {
  PostResult postResult = null;
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Container(
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
                  PostResult.connectToAPI("Dodot Nanda", "Tech").then((value) {
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
      ),
    );
  }
}
