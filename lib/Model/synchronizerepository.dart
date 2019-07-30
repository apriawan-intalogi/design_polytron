import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:polytron_epicmobile/Model/synchronize.dart';
import 'package:polytron_epicmobile/setting.dart';
import 'package:sqflite/sqflite.dart';
import 'dart:io' as io;
import 'dart:async';

class SynchronizeRepository {
  static final SynchronizeRepository _instance = new SynchronizeRepository.internal();
  SynchronizeRepository.internal();

  factory SynchronizeRepository() => _instance;

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
  Future<int> saveSynchronize() async {
    var dbClient = await db;
    int res;
    var list = [
      {
        "modulid": "Customer",
        "name": "Customer",
        "tglupdate": "01/01/19",
        "company": CompanyID
      },
      {
        "modulid": "Contact",
        "name": "Contact",
        "tglupdate": "01/02/19",
        "company": CompanyID
      },
    ];
    for (int i = 0; i < list.length; i++) {
      Synchronize synchronize = new Synchronize(
        list[i]["modulid"],
        list[i]["name"],
        list[i]["tglupdate"],
        list[i]["company"],
      );
      res = await dbClient.insert("tb_m_synchronize", synchronize.toMap());
    }
    return res;
  }
  Future<int> deleteSynchronize(_id, _company) async {
    var dbClient = await db;
    int res;
    if(_id == "all"){
      // res = await dbClient.delete("tb_m_synchronize");
      res = await dbClient.delete("tb_m_synchronize",
      where: "company='" + _company + "'");
    }
    else{
      res = await dbClient.delete("tb_m_synchronize",
        where: "modulid='" + _id + "' and company='" + _company + "'");
    }
    return res;
  }

  Future<List<Synchronize>> getDataSynchronize(String _search) async {
    var dbClient = await db;
    String sql = "Select * from tb_m_synchronize where 1=1";
    if (_search != "") {
      sql += " And modulid like '%" +
          _search +
          "%' or name like '%" +
          _search +
          "%'";
    }
    List<Map> list = await dbClient.rawQuery(sql);
    List<Synchronize> listdata = new List();
    for (int i = 0; i < list.length; i++) {
      var item = new Synchronize(
          list[i]["modulid"],
          list[i]["name"],
          list[i]["tglupdate"],
          list[i]["company"]);
      listdata.add(item);
    }
    return listdata;
  }
}
