import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:polytron_epicmobile/Model/menu.dart';
import 'package:polytron_epicmobile/setting.dart';
import 'package:sqflite/sqflite.dart';
import 'dart:io' as io;
import 'dart:async';

class MenuRepository {
  static final MenuRepository _instance = new MenuRepository.internal();
  MenuRepository.internal();

  factory MenuRepository() => _instance;

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
  Future<int> savemenu() async {
    var dbClient = await db;
    int res;
    var list = [
      {
        "menuid": "SLS_001",
        "name": "Sales Non Konsinyasi",
        "appgroup": "sales",
        "orderby": 1,
        "company": CompanyID,
      },
      {
        "menuid": "SLS_002",
        "name": "Sales Konsinyasi",
        "appgroup": "sales",
        "orderby": 2,
        "company": CompanyID,
      },
      {
        "menuid": "SLS_003",
        "name": "Penukaran Barang",
        "appgroup": "sales",
        "orderby": 3,
        "company": CompanyID,
      },
      {
        "menuid": "SLS_004",
        "name": "Penerimaan Barang",
        "appgroup": "sales",
        "orderby": 4,
        "company": CompanyID,
      },
      {
        "menuid": "SLS_005",
        "name": "Pengembalian Barang",
        "appgroup": "sales",
        "orderby": 5,
        "company": CompanyID,
      },
      {
        "menuid": "SLS_006",
        "name": "List of Payment",
        "appgroup": "sales",
        "orderby": 6,
        "company": CompanyID,
      },
      {
        "menuid": "SLS_007",
        "name": "Master Leadtime",
        "appgroup": "sales",
        "orderby": 7,
        "company": CompanyID,
      },
      {
        "menuid": "SLS_008",
        "name": "Transfer Alokasi Kuota",
        "appgroup": "sales",
        "orderby": 8,
        "company": CompanyID,
      },
      {
        "menuid": "SVC_001",
        "name": "Contact Entry",
        "appgroup": "Service",
        "orderby": 9,
        "company": CompanyID,
      },
      {
        "menuid": "SVC_002",
        "name": "Case Entry",
        "appgroup": "Service",
        "orderby": 10,
        "company": CompanyID,
      },
    ];
    for (int i = 0; i < list.length; i++) {
      Menu menu = new Menu(
        list[i]["menuid"],
        list[i]["name"],
        list[i]["appgroup"],
        list[i]["orderby"],
        list[i]["company"],
      );
      res = await dbClient.insert("tb_m_menu", menu.toMap());
    }
    return res;
  }
  Future<int> deleteMenu(_id, _company) async {
    var dbClient = await db;
    int res;
    if(_id == "all"){
      res = await dbClient.delete("tb_m_menu",
      where: "company='" + _company + "'");
    }
    else{
      res = await dbClient.delete("tb_m_menu",
        where: "menuid='" + _id + "' and company='" + _company + "'");
    }
    return res;
  }
  Future<List<Menu>> getDataMenu() async {
    var dbClient = await db;
    String sql = "Select * from tb_m_menu";
    List<Map> list = await dbClient.rawQuery(sql);
    List<Menu> menudata = new List();
    for (int i = 0; i < list.length; i++) {
      var menu = new Menu(
        list[i]["menuid"],
        list[i]["name"],
        list[i]["appgroup"],
        list[i]["orderby"],
        list[i]["company"],
      );
      menudata.add(menu);
    }
    return menudata;
  }
}
