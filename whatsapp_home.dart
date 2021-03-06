import 'package:flutter/material.dart';
import 'pages/call_screen.dart';
import 'pages/camera_screen.dart';
import 'pages/status_screen.dart';
import 'pages/chat_screen.dart';

class WhatsAppHome extends StatefulWidget {
  @override
  _WhatsAppHomeState createState() => _WhatsAppHomeState();
}

class _WhatsAppHomeState extends State<WhatsAppHome>
    with SingleTickerProviderStateMixin {
  TabController _tabController;
  @override
  void initState() {
    super.initState();
    _tabController = new TabController(vsync: this, initialIndex: 1, length: 4);
  }

  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        actions: <Widget>[
          Icon(Icons.search),
          Padding(
            padding: EdgeInsets.only(right: 6.0),
          ),
          Icon(Icons.more_vert),
          Padding(
            padding: EdgeInsets.only(right: 6.0),
          ),
        ],
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
      ),
      body: new TabBarView(
        controller: _tabController,
        children: <Widget>[
          new CameraScreen(),
          new ChatScreen(),
          new StatusScreen(),
          new CallScreen(),
        ],
      ),
      floatingActionButton: new FloatingActionButton(
        backgroundColor: Theme.of(context).accentColor,
        child: new Icon(
          Icons.message,
          color: Colors.white,
        ),
        onPressed: () => print("open chats"),
      ),
    );
  }
}
