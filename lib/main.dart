import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Map<String, bool> teams = {
    "Manchester United": false,
    "FC Barcelona": false,
    "Real Madrid": false,
    "Chelsea": false,
    "PSG": false,
    "Spurs": false,
  };

  @override
  Widget build(BuildContext context) {
    // MediaQueryData queryData =  MediaQuery.of(context);
    //double _deviceWidth = queryData.size.width;
    //double _deviceHeight = MediaQuery.of(context).size.height;
    return new MaterialApp(
      home: new Scaffold(
        appBar: new AppBar(
          title: new Text('ListView DEMO'),
        ),
        body: new Container(
          padding: EdgeInsets.only(top: 32, left: 10, right: 10),
          width: double.infinity,
          child: new Column(
            children: <Widget>[
              new SizedBox(
                height: 310,
                child: new ListView.builder(
                  shrinkWrap: true,
                  itemCount: teams.length,
                  itemBuilder: (BuildContext cotext, int index) {
                    bool val = teams.values.elementAt(index);
                    String key = teams.keys.elementAt(index);
                    return new Container(
                      padding: EdgeInsets.only(bottom: 5),
                      decoration: new BoxDecoration(
                        border: new Border(
                          bottom: BorderSide(
                            color: Colors.lightBlueAccent,
                            width: 2,
                          ),
                        ),
                      ),
                      child: new CheckboxListTile(
                        value: val,
                        title: new Text(key),
                        onChanged: (bool value1) {
                          setState(() {
                            teams.update(key, (value) => value1);
                          });
                        },
                      ),
                    );
                  },
                ),
              ),
              new Temp(teams),
            ],
          ),
        ),
      ),
    );
  }
}

class Temp extends StatelessWidget {
  Map<String, bool> _teams;

  Temp(Map teams) {
    this._teams = teams;
  }

  @override
  Widget build(BuildContext context) {
    return new Container(
      width: double.infinity,
      child: new RaisedButton(
        shape: new RoundedRectangleBorder(
          borderRadius: new BorderRadius.circular(12),
        ),
        child: new Text(
          "CLICK ME",
          style: new TextStyle(
            color: Colors.white,
          ),
        ),
        color: Colors.blueAccent,
        onPressed: () {
          List<String> selected = new List<String>();
          _teams.forEach((key, val) {
            if (val == true) {
              selected.add(key);
            }
          });
          print(selected.toString());
          showDialog(
            context: context,
            builder: (BuildContext context) {
              print("CHECK!");
              return AlertDialog(
                title: new Text("Selected Teams"),
                content: new Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    new Container(
                      height: 75,
                      width: 200,
                      child: new ListView.builder(
                        shrinkWrap: true,
                        itemCount: selected.length,
                        itemBuilder: (BuildContext cotext, int index) {
                          return new Text(
                              (index+1).toString() + " " + selected[index]);
                        },
                      ),
                    ),
                  ],
                ),
                actions: <Widget>[
                  new FlatButton(
                    child: new Text("OKAY"),
                    onPressed: () => Navigator.pop(context),
                  ),
                ],
              );
            },
          );
        },
      ),
    );
  }
}
