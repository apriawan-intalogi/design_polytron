class Synchronize {
  String _modulid;
  String _name;
  String _tglupdate;
  String _company;

  Synchronize(
      this._modulid,
      this._name,
      this._tglupdate,
      this._company);

  Synchronize.map(dynamic obj) {
    this._modulid = obj["modulid"];
    this._name = obj["name"];
    this._tglupdate = obj["tglupdate"];
    this._company = obj["company"];
  }
  String get modulid => _modulid;
  String get name => _name;
  String get tglupdate => _tglupdate;
  String get company => _company;

  Map<String, dynamic> toMap() {
    var map = Map<String, dynamic>();
    map["modulid"] = _modulid;
    map["name"] = _name;
    map["tglupdate"] = _tglupdate;
    map["company"] = _company;
    return map;
  }

  // void setCustid(String id){
  //   this._custid = id;
  // }

}
