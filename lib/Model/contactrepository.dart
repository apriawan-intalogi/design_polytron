import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:polytron_epicmobile/Model/contact.dart';
import 'package:polytron_epicmobile/setting.dart';
import 'package:sqflite/sqflite.dart';
import 'dart:io' as io;
import 'dart:async';

class ContactRepository {
  static final ContactRepository _instance = new ContactRepository.internal();
  ContactRepository.internal();

  factory ContactRepository() => _instance;

  static Database _db;

  Future<Database> get db async {
    if (_db != null) return _db;
    _db = await setDB();
    return _db;
  }

  setDB() async {
    io.Directory directory = await getApplicationDocumentsDirectory();
    String path = join(directory.path, DatabaseName);
    var dB = await openDatabase(path, version: 1);
    return dB;
  }

  Future<int> saveContact(Contact contact) async {
    var dbClient = await db;
    int res;
    List<Map> list = await dbClient.rawQuery(
        "Select * from tb_m_contact where perconid='" +
            contact.perconid +
            "' and company = '" +
            contact.company +
            "'");
    if (list.length > 0) {
      res = await dbClient.update("tb_m_contact", contact.toMap(),
          where: "perconid='" +
              contact.perconid +
              "' and company = '" +
              contact.company +
              "'");
    } else {
      res = await dbClient.insert("tb_m_contact", contact.toMap());
    }
    return res;
  }

  Future<int> deleteContact(_id, _company) async {
    var dbClient = await db;
    int res;
    res = await dbClient.delete("tb_m_contact",
        where: "perconid='" + _id + "' and company='" + _company + "'");
    return res;
  }

  Future<List<Contact>> getDataContact(String _search) async {
    var dbClient = await db;
    String sql = "Select * from tb_m_contact where 1=1";
    if (_search != "") {
      sql += " And perconid like '%" +
          _search +
          "%' or name like '%" +
          _search +
          "%'";
    }
    List<Map> list = await dbClient.rawQuery(sql);
    List<Contact> listdata = new List();
    for (int i = 0; i < list.length; i++) {
      var item = new Contact(
          list[i]["perconid"],
          list[i]["name"],
          list[i]["address"],
          list[i]["city"],
          list[i]["state"],
          list[i]["countrynum"],
          list[i]["phonenum"],
          list[i]["cellphonenum"],
          list[i]["faxnum"],
          list[i]["ktp"],
          list[i]["npwp"],
          list[i]["company"]);
      listdata.add(item);
    }
    return listdata;
  }
}
