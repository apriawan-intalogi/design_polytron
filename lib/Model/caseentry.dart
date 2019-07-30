class CaseEntry {
  String _casetypeid;
  String _caseowner;
  int _hdcasenum;
  String _hdcasenummobile;
  String _statuscase;
  String _district;
  int _reqperconid;
  String _name;
  String _customer;
  String _link;
  String _context;
  String _description;
  String _territoryid;
  String _partnum;
  String _revisionnum;
  String _partdescription;
  double _quantity;
  String _quantityuom;
  String _serialnum;
  int _callnum;
  int _rmanum;
  String _externallinks;
  String _topicid1;
  String _topicid2;
  String _topicid3;
  String _resolutiontext;
  String _tasksetid;
  int _complete;
  String _company;

  CaseEntry(
      this._casetypeid,
      this._caseowner,
      this._hdcasenum,
      this._hdcasenummobile,
      this._statuscase,
      this._district,
      this._reqperconid,
      this._name,
      this._customer,
      this._link,
      this._context,
      this._description,
      this._territoryid,
      this._partnum,
      this._revisionnum,
      this._partdescription,
      this._quantity,
      this._quantityuom,
      this._serialnum,
      this._callnum,
      this._rmanum,
      this._externallinks,
      this._topicid1,
      this._topicid2,
      this._topicid3,
      this._resolutiontext,
      this._tasksetid,
      this._complete,
      this._company);

  CaseEntry.map(dynamic obj) {
    this._casetypeid = obj["casetypeid"];
    this._caseowner = obj["caseowner"];
    this._hdcasenum = obj["hdcasenum"];
    this._hdcasenummobile = obj["hdcasenummobile"];
    this._statuscase = obj["statuscase"];
    this._district = obj["district"];
    this._reqperconid = obj["reqperconid"];
    this._name = obj["name"];
    this._customer = obj["customer"];
    this._link = obj["link"];
    this._context = obj["context"];
    this._description = obj["description"];
    this._territoryid = obj["territoryid"];
    this._partnum = obj["partnum"];
    this._revisionnum = obj["revisionnum"];
    this._partdescription = obj["partdescription"];
    this._quantity = obj["quantity"];
    this._quantityuom = obj["quantityuom"];
    this._serialnum = obj["serialnum"];
    this._callnum = obj["callnum"];
    this._rmanum = obj["rmanum"];
    this._externallinks = obj["externallinks"];
    this._topicid1 = obj["topicid1"];
    this._topicid2 = obj["topicid2"];
    this._topicid3 = obj["topicid3"];
    this._resolutiontext = obj["resolutiontext"];
    this._tasksetid = obj["tasksetid"];
    this._complete = obj["complete"];
    this._company = obj["company"];
  }
  String get casetypeid => _casetypeid;
  String get caseowner => _caseowner;
  int get hdcasenum => _hdcasenum;
  String get hdcasenummobile => _hdcasenummobile;
  String get statuscase => _statuscase;
  String get district => _district;
  int get reqperconid => _reqperconid;
  String get name => _name;
  String get customer => _customer;
  String get link => _link;
  String get context => _context;
  String get description => _description;
  String get territoryid => _territoryid;
  String get partnum => _partnum;
  String get revisionnum => _revisionnum;
  String get partdescription => _partdescription;
  double get quantity => _quantity;
  String get quantityuom => _quantityuom;
  String get serialnum => _serialnum;
  int get callnum => _callnum;
  int get rmanum => _rmanum;
  String get externallinks => _externallinks;
  String get topicid1 => _topicid1;
  String get topicid2 => _topicid2;
  String get topicid3 => _topicid3;
  String get resolutiontext => _resolutiontext;
  String get tasksetid => _tasksetid;
  int get complete => _complete;
  String get company => _company;

  Map<String, dynamic> toMap() {
    var map = Map<String, dynamic>();
    map["casetypeid"] = _casetypeid;
    map["caseowner"] = _caseowner;
    map["hdcasenum"] = _hdcasenum;
    map["hdcasenummobile"] = _hdcasenummobile;
    map["statuscase"] = _statuscase;
    map["district"] = _district;
    map["reqperconid"] = _reqperconid;
    map["name"] = _name;
    map["customer"] = _customer;
    map["link"] = _link;
    map["context"] = _context;
    map["description"] = _description;
    map["territoryid"] = _territoryid;
    map["partnum"] = _partnum;
    map["revisionnum"] = _revisionnum;
    map["partdescription"] = _partdescription;
    map["quantity"] = _quantity;
    map["quantityuom"] = _quantityuom;
    map["serialnum"] = _serialnum;
    map["callnum"] = _callnum;
    map["rmanum"] = _rmanum;
    map["externallinks"] = _externallinks;
    map["topicid1"] = _topicid1;
    map["topicid2"] = _topicid2;
    map["topicid3"] = _topicid3;
    map["resolutiontext"] = _resolutiontext;
    map["tasksetid"] = _tasksetid;
    map["complete"] = _complete;
    map["company"] = _company;
    return map;
  }

  // void setCustid(String id){
  //   this._custid = id;
  // }

}
