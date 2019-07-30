import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:polytron_epicmobile/Model/user.dart';
import 'package:polytron_epicmobile/setting.dart';
import 'package:sqflite/sqflite.dart';
import 'dart:io' as io;
import 'dart:async';

class UserRepository {
  static final UserRepository _instance = new UserRepository.internal();
  UserRepository.internal();

  factory UserRepository() => _instance;

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
  Future<int> saveuser() async {
    var dbClient = await db;
    int res;
    var list = [
      {
        "userid": "service",
        "name": "Service Name",
        "pass": "service",
        "company": CompanyID,
      },
      {
        "userid": "sales",
        "name": "Sales Name",
        "pass": "sales",
        "company": CompanyID,
      },
    ];
    for (int i = 0; i < list.length; i++) {
      User user = new User(
        list[i]["userid"],
        list[i]["name"],
        list[i]["pass"],
        list[i]["company"],
      );
      res = await dbClient.insert("tb_m_user", user.toMap());
    }
    return res;
  }
  
  Future<int> deleteAllUser(_company) async {
    var dbClient = await db;
    int res;
    res = await dbClient.delete("tb_m_user",
    where: "company='" + _company + "'");
    return res;
  }
  Future<int> deleteUser(_id, _company) async {
    var dbClient = await db;
    int res;
    if(_id == "all"){
      res = await dbClient.delete("tb_m_user",
      where: "company='" + _company + "'");
    }
    else{
      res = await dbClient.delete("tb_m_user",
        where: "userid='" + _id + "' and company='" + _company + "'");
    }
    return res;
  }
  Future<List<User>> getDataUser() async {
    var dbClient = await db;
    String sql = "Select * from tb_m_user";
    List<Map> list = await dbClient.rawQuery(sql);
    List<User> userdata = new List();
    for (int i = 0; i < list.length; i++) {
      var user = new User(
        list[i]["userid"],
        list[i]["name"],
        list[i]["pass"],
        list[i]["company"],
      );
      userdata.add(user);
    }
    return userdata;
  }
  Future<List<User>> login(_id, _pass,_company) async {
    var dbClient = await db;
    String sql = "Select * from tb_m_user where userid='" + _id + "' and pass='" + _pass + "' and company='" + _company + "'";
    List<Map> list = await dbClient.rawQuery(sql);
    List<User> userdata = new List();
    for (int i = 0; i < list.length; i++) {
      var user = new User(
        list[i]["userid"],
        list[i]["name"],
        list[i]["pass"],
        list[i]["company"],
      );
      userdata.add(user);
    }
    return userdata;
  }  
}
