import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:polytron_epicmobile/Model/servicecallcenter.dart';
import 'package:polytron_epicmobile/setting.dart';
import 'package:sqflite/sqflite.dart';
import 'dart:io' as io;
import 'dart:async';

class ServiceCallCenterRepository {
  static final ServiceCallCenterRepository _instance = new ServiceCallCenterRepository.internal();
  ServiceCallCenterRepository.internal();

  factory ServiceCallCenterRepository() => _instance;

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

  Future<int> saveServiceCallCenter(ServiceCallCenter servicecallcenter) async {
    var dbClient = await db;
    int res;
    List<Map> list = await dbClient.rawQuery(
        "Select * from tb_t_fscallhd where callnummobile='" +
            servicecallcenter.callnummobile +
            "' and company = '" +
            servicecallcenter.company +
            "'");
    if (list.length > 0) {
      res = await dbClient.update("tb_t_fscallhd", servicecallcenter.toMap(),
          where: "callnummobile='" +
              servicecallcenter.callnummobile +
              "' and company = '" +
              servicecallcenter.company +
              "'");
    } else {
      res = await dbClient.insert("tb_t_fscallhd", servicecallcenter.toMap());
    }
    return res;
  }

  Future<int> deleteServiceCallCenter(_id, _company) async {
    var dbClient = await db;
    int res;
    res = await dbClient.delete("tb_t_fscallhd",
        where: "callnummobile='" + _id + "' and company='" + _company + "'");
    return res;
  }

  Future<List<ServiceCallCenter>> getDataServiceCallCenter(String _search) async {
    var dbClient = await db;
    String sql = "Select * from tb_t_fscallhd where 1=1";
    if (_search != "") {
      sql += " And callnummobile like '%" +
         _search +
          "%'";
    }
    List<Map> list = await dbClient.rawQuery(sql);
    List<ServiceCallCenter> listdata = new List();
    for (int i = 0; i < list.length; i++) {
      var item = new ServiceCallCenter(
          list[i]["callnum"],
          list[i]["callnummobile"],
          list[i]["custid"],
          list[i]["prcconnum"],
          list[i]["perconid"],
          list[i]["shiptonum"],
          list[i]["shiptocustid"],
          list[i]["taxcatid"],
          list[i]["planid"],
          list[i]["currencycode"],
          list[i]["hdcasenum"],
          list[i]["callcode"],
          list[i]["servicetype"],
          list[i]["requestdate"],
          list[i]["requesttime"],
          list[i]["scheddate"],
          list[i]["schedtime"],
          list[i]["actualdate"],
          list[i]["actualtime"],
          list[i]["status"],
          list[i]["userstatus"],
          list[i]["partnum"],
          list[i]["partdescription"],
          list[i]["nomorseri"],
          list[i]["callqty"],
          list[i]["kelengkapan"],
          list[i]["tanggalakhirgaransi"],
          list[i]["warrantytype"],
          list[i]["linenum"],
          list[i]["jobnum"],
          list[i]["servicedescription"],
          list[i]["issuetopics"],
          list[i]["topics1"],
          list[i]["topics2"],
          list[i]["topics3"],
          list[i]["topics4"],
          list[i]["topics5"],
          list[i]["callcomment"],
          list[i]["doctotlabor"],
          list[i]["doctotmaterial"],
          list[i]["doctotbilllabor"],
          list[i]["discountservice"],
          list[i]["doctotbillmaterial"],
          list[i]["discountmaterial"],
          list[i]["totaldiscount"],
          list[i]["totalbayar"],
          list[i]["persentasediscount"],
          list[i]["jaminan"],
          list[i]["tambahanjaminan"],
          list[i]["totaljaminan"],
          list[i]["company"]);
      listdata.add(item);
    }
    return listdata;
  }
  Future<int> saveServiceCallCenterTechnician(ServiceCallCenterTechnician servicecallcentertechnician) async {
    var dbClient = await db;
    int res;
    List<Map> list = await dbClient.rawQuery(
        "Select * from tb_t_fscallhd_tech where callnummobile='" +
            servicecallcentertechnician.callnummobile +
            "' and empid = '" +
            servicecallcentertechnician.empid +
            "' and company = '" +
            servicecallcentertechnician.company +
            "'");
    if (list.length > 0) {
      res = await dbClient.update("tb_t_fscallhd_tech", servicecallcentertechnician.toMap(),
          where: "callnummobile='" +
              servicecallcentertechnician.callnummobile +
              "' and empid = '" +
              servicecallcentertechnician.empid +
              "' and company = '" +
              servicecallcentertechnician.company +
              "'");
    } else {
      res = await dbClient.insert("tb_t_fscallhd_tech", servicecallcentertechnician.toMap());
    }
    return res;
  }

  Future<int> deleteServiceCallCenterTechnician(_id, _empid, _company) async {
    var dbClient = await db;
    int res;
    res = await dbClient.delete("tb_t_fscallhd_tech",
        where: "callnummobile='" + _id + "' and empid='" + _empid + "' and company='" + _company + "'");
    return res;
  }

  Future<List<ServiceCallCenterTechnician>> getDataServiceCallCenterTechnician(String _search,String _company) async {
    var dbClient = await db;
    String sql = "Select * from tb_t_fscallhd_tech where 1=1";
    if (_search != "") {
      sql += " And callnummobile like '%" + _search + "%' or empid like '%" +_search + "%' and company = '" + _company + "'";
    }
    List<Map> list = await dbClient.rawQuery(sql);
    List<ServiceCallCenterTechnician> listdata = new List();
    for (int i = 0; i < list.length; i++) {
      var item = new ServiceCallCenterTechnician(
          list[i]["callnum"],
          list[i]["callnummobile"],
          list[i]["empid"],
          list[i]["name"],
          list[i]["company"]);
      listdata.add(item);
    }
    return listdata;
  }
}
