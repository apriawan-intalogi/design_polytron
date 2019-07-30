import 'package:flutter/material.dart';
import 'package:polytron_epicmobile/Model/contact.dart';
import 'package:polytron_epicmobile/Model/contactrepository.dart';

class Detail extends StatefulWidget {
  Detail({Key key, this.title,this.list, this.index}) : super(key: key);
  final String title;
  final Contact list;
  final int index;

  @override
  _DetailState createState() => _DetailState();
}

class _DetailState extends State<Detail> {
  TextEditingController txtperconid = new TextEditingController();
    TextEditingController txtname = new TextEditingController();
    TextEditingController txtaddress = new TextEditingController();
    TextEditingController txtcity = new TextEditingController();
    TextEditingController txtstate = new TextEditingController();
    TextEditingController txtcountrynum = new TextEditingController();
    TextEditingController txtphonenum = new TextEditingController();
    TextEditingController txtcellphonenum = new TextEditingController();
    TextEditingController txtfaxnum = new TextEditingController();
    TextEditingController txtktp = new TextEditingController();
    TextEditingController txtnpwp = new TextEditingController();
  String cbterritory;
  
  final _formKey = GlobalKey<FormState>();
  final _scaffoldKey = new GlobalKey<ScaffoldState>();
  Contact contact;
  addData() async {
    var db = ContactRepository();
    var contact = Contact(txtperconid.text, txtname.text, txtaddress.text, txtcity.text, txtstate.text, int.parse(txtcountrynum.text), txtphonenum.text, txtcellphonenum.text, txtfaxnum.text, txtktp.text, txtnpwp.text, "COM");
    await db.saveContact(contact);
    toback();
  }
  void toback(){
    Navigator.pop(context);
  }
  _txtmultiline(_id,_label,_hint,_validator,_keyboardType){
    return new TextFormField(
      maxLines: 5,
      controller: _id,
      keyboardType: _keyboardType,
      textInputAction: TextInputAction.next,
      decoration: new InputDecoration(
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.redAccent, width: 0.0),
        ),
        hintText: _hint,
        labelText: _label
      ),
      validator: _validator,
    );
  }
  _validasi(String pesan){
    final validasi = (String value){
      if (value.isEmpty) {
        return pesan;
      }
      return null;
    };
    return validasi;
  }
  _snackbar(_title){
    final snackBar = SnackBar(
      content: Text(_title),
    );
    return _scaffoldKey.currentState.showSnackBar(snackBar);
  }
  _txt(_id,_label,_validator,_keyboardType){
    return new TextFormField(
      controller: _id,
      keyboardType: _keyboardType,
      decoration: new InputDecoration(
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.redAccent, width: 0.0),
        ),
        hintText: _label,
        labelText: _label
      ),
      validator: _validator,
    );
  }
  _txticon(_id,_label,_validator,_keyboardType){
    return new TextFormField(
      controller: _id,
      keyboardType: _keyboardType,
      decoration: new InputDecoration(
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.redAccent, width: 0.0),
        ),
        hintText: _label,
        labelText: _label,
        suffixIcon: IconButton(
          icon: Icon(Icons.search),
          onPressed: () {}
        ),
      ),
      validator: _validator,
    );
  }
  btnsave(){
    return new Container(
      width: MediaQuery.of(context).size.width,
      margin: const EdgeInsets.only(top: 20.0),
      child: new RaisedButton(
        child: new Container(
          padding: const EdgeInsets.symmetric(
            vertical: 16.0,
            horizontal: 16.0,
          ),
          child: new Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              new Expanded(
                child: Text(
                  "Save",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
        ),
        onPressed: () {
          if (_formKey.currentState.validate()) {
            addData();
          }
        },
        color: Colors.red,
      ),
    );
  }
  
  @override
  void initState() {
    if (widget.list != null){
      contact = widget.list;
      txtperconid = new TextEditingController(text: contact.perconid);
      txtname = new TextEditingController(text: contact.name);
      txtaddress = new TextEditingController(text: contact.address);
      txtcity = new TextEditingController(text: contact.city);
      txtstate = new TextEditingController(text: contact.state);
      txtcountrynum = new TextEditingController(text: contact.countrynum.toString());
      txtphonenum = new TextEditingController(text: contact.phonenum);
      txtcellphonenum = new TextEditingController(text: contact.cellphonenum);
      txtfaxnum = new TextEditingController(text: contact.faxnum);
      txtktp = new TextEditingController(text: contact.ktp);
      txtnpwp = new TextEditingController(text: contact.npwp);
    }
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Detail"),
      ),
      key: _scaffoldKey,
      body: new Container(
        padding: new EdgeInsets.fromLTRB(20,0,20,20),
        child: new Form(
          key: _formKey,
          child: new SingleChildScrollView(
            child: new Column(
              children: <Widget>[
                _txticon(this.txtperconid,'Contact ID',this._validasi('ID customer harus diisi'),TextInputType.text),
                _txt(this.txtktp,'KTP',this._validasi('KTP harus diisi'),TextInputType.text),
                _txt(this.txtnpwp,'NPWP',this._validasi('NPWP harus diisi'),TextInputType.text),
                _txt(this.txtname,'Name',this._validasi('Name harus diisi'),TextInputType.text),
                _txt(this.txtaddress,'Address',this._validasi('Address harus diisi'),TextInputType.text),
                _txt(this.txtcity,'City',this._validasi('City harus diisi'),TextInputType.text),
                _txt(this.txtstate,'State',this._validasi('State harus diisi'),TextInputType.text),
                _txt(this.txtcountrynum,'Country',this._validasi('Country harus diisi'),TextInputType.text),
                _txt(this.txtphonenum,'Phone',null,TextInputType.phone),
                _txt(this.txtcellphonenum,'Cell Phone',this._validasi('Cell Phone harus diisi'),TextInputType.phone),
                _txt(this.txtfaxnum,'Fax',null,TextInputType.phone),
                btnsave(),
              ]
            ),
          ),
        ),
      )
    );
  }
}