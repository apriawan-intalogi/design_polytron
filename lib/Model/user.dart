class User {
  String _userid;
  String _name;
  String _pass;
  String _company;
  
  User(this._userid, this._name, this._pass, this._company);

  User.map(dynamic obj) {
    this._userid = obj["userid"];
    this._name = obj["name"];
    this._pass = obj["pass"];
    this._company = obj["company"];
  }

  String get userid => _userid;
  String get name => _name;
  String get pass => _pass;
  String get company => _company;
  
  Map<String, dynamic> toMap() {
    var map = Map<String, dynamic>();
    map["userid"] = _userid;
    map["name"] = _name;
    map["pass"] = _pass;
    map["company"] = _company;
    return map;
  }

  // void setCustid(String id){
  //   this._custid = id;
  // }

}
