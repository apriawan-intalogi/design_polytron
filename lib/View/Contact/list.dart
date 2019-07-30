import 'package:flutter/material.dart';
import 'package:polytron_epicmobile/View/Contact/detail.dart' as DetailData;

class ListContact extends StatefulWidget {
  ListContact({Key key, this.title}) : super(key: key);
  final String title;
  @override
  _ListContactState createState() => _ListContactState();
}

class _ListContactState extends State<ListContact> {
  final _scaffoldKey = new GlobalKey<ScaffoldState>();
  final GlobalKey<RefreshIndicatorState> _refreshIndicatorKey = new GlobalKey<RefreshIndicatorState>();
  var db = new ContactRepository();
  String searchonbar = "";
  SearchBar searchBar;
  _ListContactState() {
    searchBar = new SearchBar(
      inBar: false,
      setState: setState,
      onClosed: onClosed,
      clearOnSubmit: false,
      onChanged: onfilter,
      onSubmitted: onfilter,
      buildDefaultAppBar: buildAppBar
    );
  }
  onfilter(String value) async {
    searchonbar = "";
    if(value.length > 0){
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
      title: new Text('Contact'),
      actions: [searchBar.getSearchAction(context)]
    );
  }  
  Future<List> getData() async {
    return db.getDataContact(searchonbar);
  }
  deleteData(_id,company) async {
    var db = ContactRepository();
    int res = await db.deleteContact(_id, company);
    if (res > 0){
      setState(() {
        getData();
      });
      _snackbar("Success");
    }
    else {
      _snackbar("Failed");
    } 
  }
  _snackbar(_title){
    final snackBar = SnackBar(
      content: Text(_title),
    );
    return _scaffoldKey.currentState.showSnackBar(snackBar);
  }
  void initState() {
    super.initState();
    getData();
  }
  void toback(){
    Navigator.pop(context);
  }
  void tomenu(){
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => new DetailData.Detail(list:null , index: null)),
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: searchBar.build(context),
      floatingActionButton: new FloatingActionButton(
        backgroundColor: Colors.red,
        child: new Icon(Icons.add),
        onPressed: tomenu,
      ),
      key: _scaffoldKey,
      body: new FutureBuilder<List>(
        future: getData(),
        builder: (context, snapshot) {
          if (snapshot.hasError) print(snapshot.error);
          return snapshot.hasData
              ? new RefreshIndicator(
                  key: _refreshIndicatorKey,
                  onRefresh: getData,
                  child:listdata(
                    snapshot.data,
                  ),
                )
              : new Center(
                  child: new CircularProgressIndicator(),
                );
        },
      ),
    );
  }
  ListView listdata(List<Contact> list){
    return new ListView.builder(
      itemCount: list == null ? 0 : list.length,
      itemBuilder: (context, i) {
        return new Container(
          padding: const EdgeInsets.all(10.0),
          child: new GestureDetector(
            onTap: ()=>Navigator.of(context).push(
              new MaterialPageRoute(
                builder: (BuildContext context)=> new DetailData.Detail(list:list[i] , index: i)
              )
            ),
            child: new Card(
              child: new ListTile(
                title: new Text(list[i].name),
                leading: new Icon(Icons.widgets),
                subtitle: new Text("No Identitas : ${list[i].perconid}"),
                trailing: new IconButton(
                  icon: Icon(Icons.delete,color: Colors.red,),
                  onPressed: () {
                    showDialog<String>(
                      context: context,
                      builder: (BuildContext context) => AlertDialog(
                        title: new Text("Konfirmasi"),
                        content: new Text("Apakah ${list[i].name} akan dihapus?"),
                        actions: <Widget>[
                          FlatButton(
                            child: Text("Yes"),
                            onPressed: () => Navigator.pop(context,"Yes"),
                          ),
                          FlatButton(
                            child: Text("Cancel"),
                            onPressed: () => Navigator.pop(context,"Cancel"),
                          )
                        ],
                      ),
                    ).then<String>((onValue){
                      if(onValue == "Yes"){
                        deleteData(list[i].perconid, "COM");
                      }
                    });
                  },
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}