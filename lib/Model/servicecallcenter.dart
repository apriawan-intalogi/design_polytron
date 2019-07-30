class ServiceCallCenter {
  int _callnum;
  String _callnummobile;
  String _custid;
  String _prcconnum;
  String _perconid;
  String _shiptonum;
  String _shiptocustid;
  String _taxcatid;
  String _planid;
  String _currencycode;
  int _hdcasenum;
  String _callcode;
  String _servicetype;
  String _requestdate;
  String _requesttime;
  String _scheddate;
  String _schedtime;
  String _actualdate;
  String _actualtime;
  String _status;
  String _userstatus;
  String _partnum;
  String _partdescription;
  String _nomorseri;
  double _callqty;
  String _kelengkapan;
  String _tanggalakhirgaransi;
  String _warrantytype;
  int _linenum;
  String _jobnum;
  String _servicedescription;
  String _issuetopics;
  String _topics1;
  String _topics2;
  String _topics3;
  String _topics4;
  String _topics5;
  String _callcomment;
  double _doctotlabor;
  double _doctotmaterial;
  double _doctotbilllabor;
  double _discountservice;
  double _doctotbillmaterial;
  double _discountmaterial;
  double _totaldiscount;
  double _totalbayar;
  double _persentasediscount;
  double _jaminan;
  double _tambahanjaminan;
  double _totaljaminan;
  String _company;

  ServiceCallCenter(
      this._callnum,
      this._callnummobile,
      this._custid,
      this._prcconnum,
      this._perconid,
      this._shiptonum,
      this._shiptocustid,
      this._taxcatid,
      this._planid,
      this._currencycode,
      this._hdcasenum,
      this._callcode,
      this._servicetype,
      this._requestdate,
      this._requesttime,
      this._scheddate,
      this._schedtime,
      this._actualdate,
      this._actualtime,
      this._status,
      this._userstatus,
      this._partnum,
      this._partdescription,
      this._nomorseri,
      this._callqty,
      this._kelengkapan,
      this._tanggalakhirgaransi,
      this._warrantytype,
      this._linenum,
      this._jobnum,
      this._servicedescription,
      this._issuetopics,
      this._topics1,
      this._topics2,
      this._topics3,
      this._topics4,
      this._topics5,
      this._callcomment,
      this._doctotlabor,
      this._doctotmaterial,
      this._doctotbilllabor,
      this._discountservice,
      this._doctotbillmaterial,
      this._discountmaterial,
      this._totaldiscount,
      this._totalbayar,
      this._persentasediscount,
      this._jaminan,
      this._tambahanjaminan,
      this._totaljaminan,
      this._company);

  ServiceCallCenter.map(dynamic obj) {
    this._callnum = obj["callnum"];
    this._callnummobile = obj["callnummobile"];
    this._custid = obj["custid"];
    this._prcconnum = obj["prcconnum"];
    this._perconid = obj["perconid"];
    this._shiptonum = obj["shiptonum"];
    this._shiptocustid = obj["shiptocustid"];
    this._taxcatid = obj["taxcatid"];
    this._planid = obj["planid"];
    this._currencycode = obj["currencycode"];
    this._hdcasenum = obj["hdcasenum"];
    this._callcode = obj["callcode"];
    this._servicetype = obj["servicetype"];
    this._requestdate = obj["requestdate"];
    this._requesttime = obj["requesttime"];
    this._scheddate = obj["scheddate"];
    this._schedtime = obj["schedtime"];
    this._actualdate = obj["actualdate"];
    this._actualtime = obj["actualtime"];
    this._status = obj["status"];
    this._userstatus = obj["userstatus"];
    this._partnum = obj["partnum"];
    this._partdescription = obj["partdescription"];
    this._nomorseri = obj["nomorseri"];
    this._callqty = obj["callqty"];
    this._kelengkapan = obj["kelengkapan"];
    this._tanggalakhirgaransi = obj["tanggalakhirgaransi"];
    this._warrantytype = obj["warrantytype"];
    this._linenum = obj["linenum"];
    this._jobnum = obj["jobnum"];
    this._servicedescription = obj["servicedescription"];
    this._issuetopics = obj["issuetopics"];
    this._topics1 = obj["topics1"];
    this._topics2 = obj["topics2"];
    this._topics3 = obj["topics3"];
    this._topics4 = obj["topics4"];
    this._topics5 = obj["topics5"];
    this._callcomment = obj["callcomment"];
    this._doctotlabor = obj["doctotlabor"];
    this._doctotmaterial = obj["doctotmaterial"];
    this._doctotbilllabor = obj["doctotbilllabor"];
    this._discountservice = obj["discountservice"];
    this._doctotbillmaterial = obj["doctotbillmaterial"];
    this._discountmaterial = obj["discountmaterial"];
    this._totaldiscount = obj["totaldiscount"];
    this._totalbayar = obj["totalbayar"];
    this._persentasediscount = obj["persentasediscount"];
    this._jaminan = obj["jaminan"];
    this._tambahanjaminan = obj["tambahanjaminan"];
    this._totaljaminan = obj["totaljaminan"];
    this._company = obj["company"];
  }
  int get callnum => _callnum;
  String get callnummobile => _callnummobile;
  String get custid => _custid;
  String get prcconnum => _prcconnum;
  String get perconid => _perconid;
  String get shiptonum => _shiptonum;
  String get shiptocustid => _shiptocustid;
  String get taxcatid => _taxcatid;
  String get planid => _planid;
  String get currencycode => _currencycode;
  int get hdcasenum => _hdcasenum;
  String get callcode => _callcode;
  String get servicetype => _servicetype;
  String get requestdate => _requestdate;
  String get requesttime => _requesttime;
  String get scheddate => _scheddate;
  String get schedtime => _schedtime;
  String get actualdate => _actualdate;
  String get actualtime => _actualtime;
  String get status => _status;
  String get userstatus => _userstatus;
  String get partnum => _partnum;
  String get partdescription => _partdescription;
  String get nomorseri => _nomorseri;
  double get callqty => _callqty;
  String get kelengkapan => _kelengkapan;
  String get tanggalakhirgaransi => _tanggalakhirgaransi;
  String get warrantytype => _warrantytype;
  int get linenum => _linenum;
  String get jobnum => _jobnum;
  String get servicedescription => _servicedescription;
  String get issuetopics => _issuetopics;
  String get topics1 => _topics1;
  String get topics2 => _topics2;
  String get topics3 => _topics3;
  String get topics4 => _topics4;
  String get topics5 => _topics5;
  String get callcomment => _callcomment;
  double get doctotlabor => _doctotlabor;
  double get doctotmaterial => _doctotmaterial;
  double get doctotbilllabor => _doctotbilllabor;
  double get discountservice => _discountservice;
  double get doctotbillmaterial => _doctotbillmaterial;
  double get discountmaterial => _discountmaterial;
  double get totaldiscount => _totaldiscount;
  double get totalbayar => _totalbayar;
  double get persentasediscount => _persentasediscount;
  double get jaminan => _jaminan;
  double get tambahanjaminan => _tambahanjaminan;
  double get totaljaminan => _totaljaminan;
  String get company => _company;

  Map<String, dynamic> toMap() {
    var map = Map<String, dynamic>();
    map["callnum"] = _callnum;
    map["callnummobile"] = _callnummobile;
    map["custid"] = _custid;
    map["prcconnum"] = _prcconnum;
    map["perconid"] = _perconid;
    map["shiptonum"] = _shiptonum;
    map["shiptocustid"] = _shiptocustid;
    map["taxcatid"] = _taxcatid;
    map["planid"] = _planid;
    map["currencycode"] = _currencycode;
    map["hdcasenum"] = _hdcasenum;
    map["callcode"] = _callcode;
    map["servicetype"] = _servicetype;
    map["requestdate"] = _requestdate;
    map["requesttime"] = _requesttime;
    map["scheddate"] = _scheddate;
    map["schedtime"] = _schedtime;
    map["actualdate"] = _actualdate;
    map["actualtime"] = _actualtime;
    map["status"] = _status;
    map["userstatus"] = _userstatus;
    map["partnum"] = _partnum;
    map["partdescription"] = _partdescription;
    map["nomorseri"] = _nomorseri;
    map["callqty"] = _callqty;
    map["kelengkapan"] = _kelengkapan;
    map["tanggalakhirgaransi"] = _tanggalakhirgaransi;
    map["warrantytype"] = _warrantytype;
    map["linenum"] = _linenum;
    map["jobnum"] = _jobnum;
    map["servicedescription"] = _servicedescription;
    map["issuetopics"] = _issuetopics;
    map["topics1"] = _topics1;
    map["topics2"] = _topics2;
    map["topics3"] = _topics3;
    map["topics4"] = _topics4;
    map["topics5"] = _topics5;
    map["callcomment"] = _callcomment;
    map["doctotlabor"] = _doctotlabor;
    map["doctotmaterial"] = _doctotmaterial;
    map["doctotbilllabor"] = _doctotbilllabor;
    map["discountservice"] = _discountservice;
    map["doctotbillmaterial"] = _doctotbillmaterial;
    map["discountmaterial"] = _discountmaterial;
    map["totaldiscount"] = _totaldiscount;
    map["totalbayar"] = _totalbayar;
    map["persentasediscount"] = _persentasediscount;
    map["jaminan"] = _jaminan;
    map["tambahanjaminan"] = _tambahanjaminan;
    map["totaljaminan"] = _totaljaminan;
    map["company"] = _company;

    return map;
  }

  // void setCustid(String id){
  //   this._custid = id;
  // }

}
class ServiceCallCenterTechnician {
  int _callnum;
  String _callnummobile;
  String _empid;
  String _name;
  String _company;

  ServiceCallCenterTechnician(
      this._callnum,
      this._callnummobile,
      this._empid,
      this._name,
      this._company);

  ServiceCallCenterTechnician.map(dynamic obj) {
    this._callnum = obj["callnum"];
    this._callnummobile = obj["callnummobile"];
    this._empid = obj["empid"];
    this._name = obj["name"];
    this._company = obj["company"];
  }
  int get callnum => _callnum;
  String get callnummobile => _callnummobile;
  String get empid => _empid;
  String get name => _name;
  String get company => _company;

  Map<String, dynamic> toMap() {
    var map = Map<String, dynamic>();
    map["callnum"] = _callnum;
    map["callnummobile"] = _callnummobile;
    map["empid"] = _empid;
    map["name"] = _name;
    map["company"] = _company;

    return map;
  }

  // void setCustid(String id){
  //   this._custid = id;
  // }

}