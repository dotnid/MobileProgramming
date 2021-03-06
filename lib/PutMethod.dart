import 'package:flutter/material.dart';
import 'package:tugasapi/PostMethod.dart';
import 'package:tugasapi/main.dart';

import 'DeleteMethod.dart';
import 'ModelPut.dart';

class My3ndApp extends StatelessWidget {
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
  PutResult putResult = null;
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
              Text((putResult != null)
                  ? 
                  putResult.name +
                  " | " +
                  putResult.job
                  : "Tidak ada Data "),
              RaisedButton(
                onPressed: () {
                  PutResult.connectToAPI("Dodot Nanda", "Tech").then((value) {
                    putResult = value;
                    setState(() {});
                  });
                },
                child: Text("PUT"),
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
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          RaisedButton(
                            onPressed: () {
                              Navigator.pushReplacement(context,
                                  MaterialPageRoute(builder: (context) {
                                    return My4ndApp();
                                  }));
                            },
                            child: Text("DELETE Method"),
                          ),
                        ],
                      ),
                    ],
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
