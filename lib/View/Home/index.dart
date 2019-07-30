import 'package:flutter/material.dart';
import 'package:polytron_epicmobile/Model/menu.dart';
import 'package:polytron_epicmobile/View/CaseEntry/list.dart';
import 'package:polytron_epicmobile/View/Contact/list.dart';
import 'package:polytron_epicmobile/View/Synchronize/list.dart';
import 'package:polytron_epicmobile/Model/menurepository.dart';
import 'package:polytron_epicmobile/searchhelper.dart';


class MyHome extends StatefulWidget {
  MyHome({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomeState createState() => _MyHomeState();
}

class _MyHomeState extends State<MyHome> {
  final _scaffoldKey = new GlobalKey<ScaffoldState>();
  final GlobalKey<RefreshIndicatorState> _refreshIndicatorKey =
      new GlobalKey<RefreshIndicatorState>();
  var db = new MenuRepository();
  String searchonbar = "";
  SearchBar searchBar;
  _MyHomeState() {
    searchBar = new SearchBar(
        inBar: false,
        setState: setState,
        onClosed: onClosed,
        clearOnSubmit: false,
        onChanged: onfilter,
        onSubmitted: onfilter,
        buildDefaultAppBar: buildAppBar);
  }
  onfilter(String value) async {
    searchonbar = "";
    if (value.length > 0) {
      setState(() {
        searchonbar = value;
      });
    }
  }

  void onClosed() {
    setState(() {
      searchonbar = "";
    });
  }

  AppBar buildAppBar(BuildContext context) {
    return new AppBar(
        title: new Text('Polytron EpicMobile'),
        actions: [searchBar.getSearchAction(context)]);
  }

  Future<List> getData() async {
    return db.getDataMenu();
  }

  void initState() {
    super.initState();
    getData();
  }

  void toback() {
    Navigator.pop(context);
  }

  gotomenu(_menuid){
    if (_menuid == 'SVC_001') {
      return Navigator.push(context, MaterialPageRoute(builder: (context) => ListContact()));
    }
    if (_menuid == 'SVC_002') {
      return Navigator.push(context, MaterialPageRoute(builder: (context) => ListCaseEntry()));
    }
  }
  drawerheader() {
    return new UserAccountsDrawerHeader(
      accountName: Text("Sales 001"),
      accountEmail: Text("Sales@polytron.com"),
      // currentAccountPicture: CircleAvatar(
      //   child: Icon(Icons.access_alarms,size: 42.0,),
      //   backgroundColor: Colors.white,
      // ),
    );
  }

  draweritems(List<Menu> list) {
    var getdata = List<Widget>();
    for (var item in list) {
      getdata.add(ListTile(
        title: Text(item.name),
        onTap: (){
         gotomenu(item.menuid);
        },
      ));
    }
    getdata.add(new Divider());
    getdata.add(
      ListTile(
        title: Text("Synchronize"),
        leading: Icon(Icons.sync),
        onTap: (){
          Navigator.push(context, MaterialPageRoute(builder: (context) => ListSynchronize()));
        },
      )
    );
    getdata.add(
      ListTile(
        title: Text("Logout"),
        leading: Icon(Icons.power_settings_new),
        onTap: (){
          
        },
      )
    );
    
    return new Column(children: getdata);
  }

  listdrawer() {
    return new FutureBuilder<List>(
      future: getData(),
      builder: (context, snapshot) {
        if (snapshot.hasError) print(snapshot.error);
        return snapshot.hasData
            ? new Drawer(
                child: ListView(
                  children: <Widget>[
                    drawerheader(),
                    new FutureBuilder<List>(
                      future: getData(),
                      builder: (context, snapshot) {
                        if (snapshot.hasError) print(snapshot.error);
                        return snapshot.hasData
                            ? draweritems(snapshot.data)
                            : new Center(
                                child: new CircularProgressIndicator(),
                              );
                      },
                    ),
                  ],
                ),
              )
            : new Center(
                child: new CircularProgressIndicator(),
              );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Polytron EpicMobile"),
      ),
      drawer: listdrawer(),
    );
  }
}
