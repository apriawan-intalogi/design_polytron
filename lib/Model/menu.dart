class Menu {
  String _menuid;
  String _name;
  String _appgroup;
  int _orderby;
  String _company;
  
  Menu(this._menuid, this._name, this._appgroup, this._orderby, this._company);

  Menu.map(dynamic obj) {
    this._menuid = obj["menuid"];
    this._name = obj["name"];
    this._appgroup = obj["appgroup"];
    this._orderby = obj["orderby"];
    this._company = obj["company"];
  }

  String get menuid => _menuid;
  String get name => _name;
  String get appgroup => _appgroup;
  int get orderby => _orderby;
  String get company => _company;
  
  Map<String, dynamic> toMap() {
    var map = Map<String, dynamic>();
    map["menuid"] = _menuid;
    map["name"] = _name;
    map["appgroup"] = _appgroup;
    map["orderby"] = _orderby;
    map["company"] = _company;
    return map;
  }

  // void setCustid(String id){
  //   this._custid = id;
  // }

}
