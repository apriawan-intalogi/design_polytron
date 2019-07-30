class Contact {
  String _perconid;
  String _name;
  String _address;
  String _city;
  String _state;
  int _countrynum;
  String _phonenum;
  String _cellphonenum;
  String _faxnum;
  String _ktp;
  String _npwp;
  String _company;

  Contact(
      this._perconid,
      this._name,
      this._address,
      this._city,
      this._state,
      this._countrynum,
      this._phonenum,
      this._cellphonenum,
      this._faxnum,
      this._ktp,
      this._npwp,
      this._company);

  Contact.map(dynamic obj) {
    this._perconid = obj["perconid"];
    this._name = obj["name"];
    this._address = obj["address"];
    this._city = obj["city"];
    this._state = obj["state"];
    this._countrynum = obj["countrynum"];
    this._phonenum = obj["phonenum"];
    this._cellphonenum = obj["cellphonenum"];
    this._faxnum = obj["faxnum"];
    this._ktp = obj["ktp"];
    this._npwp = obj["npwp"];
    this._company = obj["company"];
  }
  String get perconid => _perconid;
  String get name => _name;
  String get address => _address;
  String get city => _city;
  String get state => _state;
  int get countrynum => _countrynum;
  String get phonenum => _phonenum;
  String get cellphonenum => _cellphonenum;
  String get faxnum => _faxnum;
  String get ktp => _ktp;
  String get npwp => _npwp;
  String get company => _company;

  Map<String, dynamic> toMap() {
    var map = Map<String, dynamic>();
    map["perconid"] = _perconid;
    map["name"] = _name;
    map["address"] = _address;
    map["city"] = _city;
    map["state"] = _state;
    map["countrynum"] = _countrynum;
    map["phonenum"] = _phonenum;
    map["cellphonenum"] = _cellphonenum;
    map["faxnum"] = _faxnum;
    map["ktp"] = _ktp;
    map["npwp"] = _npwp;
    map["company"] = _company;
    return map;
  }

  // void setCustid(String id){
  //   this._custid = id;
  // }

}
