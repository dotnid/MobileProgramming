import 'package:flutter/material.dart';
import 'package:tugasapi/PutMethod.dart';
import 'package:tugasapi/main.dart';

import 'ModelDelete.dart';
import 'PostMethod.dart';


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
      home: DeleteMethod(title: 'POST Method API APPS'),
    );
  }
}

class DeleteMethod extends StatefulWidget {
  DeleteMethod({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _PostMethod createState() => _PostMethod();
}

class _PostMethod extends State<DeleteMethod> {

  DeleteSome deleteSome = null;
  Map<String, String> headers = {
    'Content-type': 'application/json',
    'Accept': 'application/json',
    'Authorization': '<Your token>'
  };
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
              Text((deleteSome != null)
                  ? deleteSome.id
                  : "Method Delete https://reqres.in/ response 204"),

              RaisedButton(
                onPressed: () {
                  DeleteSome.deletes("Dodot Nanda", headers).then((value) {
                    deleteSome = value;
                    setState(() {});
                  });

                },
                child: Text("DELETE"),
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
                                    return My3ndApp();
                                  }));
                            },
                            child: Text("PUT Method"),
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
