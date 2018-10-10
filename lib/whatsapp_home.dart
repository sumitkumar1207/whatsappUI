import 'package:flutter/material.dart';
import 'package:flutter_whatsapp/pages/call_screen.dart';
import 'package:flutter_whatsapp/pages/camera_screen.dart';
import 'package:flutter_whatsapp/pages/chat_screen.dart';
import 'package:flutter_whatsapp/pages/status_screen.dart';

class WhatsAppHome extends StatefulWidget {
  final cameras;
  WhatsAppHome(this.cameras);
  @override
  _WhatsAppHomeState createState() => new _WhatsAppHomeState();
}

class _WhatsAppHomeState extends State<WhatsAppHome>
    with SingleTickerProviderStateMixin {
  int tab_index;
  TabController _tabController;
  @override
  void initState() {
    super.initState();
    _tabController = new TabController(vsync: this, initialIndex: 1, length: 4);
    _tabController.addListener(_handleTabChange);
  }

  void _handleTabChange() {
    setState(() {
      tab_index = _tabController.index;
    });
  }

  @override
  Widget build(BuildContext context) {
    _tabController.addListener(_handleTabChange);
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("WhatsApp"),
        elevation: 0.7,
        bottom: new TabBar(
          controller: _tabController,
          indicatorColor: Colors.white,
          tabs: <Widget>[
            new Tab(icon: new Icon(Icons.camera_alt)),
            new Tab(text: "CHATS"),
            new Tab(text: "STATUS"),
            new Tab(text: "CALLS"),
          ],
        ),
        actions: <Widget>[
          new Icon(Icons.search),
          new Padding(padding: const EdgeInsets.symmetric(horizontal: 5.0)),
          new Icon(Icons.more_vert)
        ],
      ),
      body: new TabBarView(
        controller: _tabController,
        children: <Widget>[
          new CameraScreen(widget.cameras),
          new ChatScreen(),
          new StatusScreen(),
          new CallsScreen(),
        ],
      ),
      floatingActionButton: setIcon(),
    );
  }

  Widget setIcon() {
    switch (this.tab_index) {
      case 0:
        return new Container();
      default:
        IconData icon;
        if (this.tab_index == 1) {
          icon = Icons.message;
        } else if (this.tab_index == 2) {
          icon = Icons.camera_alt;
        } else {
          icon = Icons.phone;
        }
        return new FloatingActionButton(
          backgroundColor: Theme.of(context).accentColor,
          child: new Icon(icon, color: Colors.white),
          onPressed: () => print("Open Chats!"),
        );
    }
  }
}
