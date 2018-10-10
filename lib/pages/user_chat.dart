import 'package:flutter/material.dart';

class UserChat extends StatefulWidget {
  var data;

  UserChat({Key key, this.data}) : super(key: key);

  @override
  _UserChatState createState() => _UserChatState();
}

class _UserChatState extends State<UserChat> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(
          title: new Row(
            children: <Widget>[
              new CircleAvatar(
                foregroundColor: Theme.of(context).primaryColor,
                backgroundColor: Colors.grey,
                backgroundImage: new NetworkImage(widget.data.avatarUrl),
              ),
              new Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: new Container(),
              ),
              new Text(
                widget.data.name,
                style: new TextStyle(fontSize: 12.0),
              )
            ],
          ),
          actions: <Widget>[
            new Icon(Icons.videocam),
            new Padding(padding: const EdgeInsets.symmetric(horizontal: 10.0)),
            new Icon(Icons.call),
            new Padding(padding: const EdgeInsets.symmetric(horizontal: 10.0)),
            new Icon(Icons.more_vert)
          ],
        ),
        body: new Center(
          child: new Text('hello'),
        ),
        bottomSheet: new Container(
          color: Colors.green,
          child: new Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              new Container(
                color: Colors.yellow,
                child: new Row(
                  children: <Widget>[
                    new Icon(Icons.headset),
                    new Container(
                      width: 200.0,
                      child: new TextField(),
                    ),
                    new Icon(Icons.headset),
                    new Icon(Icons.headset),
                  ],
                ),
              ),
              new FloatingActionButton(
                backgroundColor: Theme.of(context).accentColor,
                child: new Icon(Icons.camera_alt, color: Colors.white),
                onPressed: () => print("Open Chats!"),
              )
            ],
          ),
        ));
  }
}
