import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:polytron_epicmobile/Model/caseentry.dart';
import 'package:polytron_epicmobile/setting.dart';
import 'package:sqflite/sqflite.dart';
import 'dart:io' as io;
import 'dart:async';

class CaseEntryRepository {
  static final CaseEntryRepository _instance = new CaseEntryRepository.internal();
  CaseEntryRepository.internal();

  factory CaseEntryRepository() => _instance;

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

  Future<int> saveCaseEntry(CaseEntry caseentry) async {
    var dbClient = await db;
    int res;
    List<Map> list = await dbClient.rawQuery(
        "Select * from tb_t_caseentry where hdcasenummobile='" +
            caseentry.hdcasenummobile +
            "'");
    if (list.length > 0) {
      res = await dbClient.update("tb_t_caseentry", caseentry.toMap(),
          where: "hdcasenummobile='" +
              caseentry.hdcasenummobile +
              "'");
    } else {
      res = await dbClient.insert("tb_t_caseentry", caseentry.toMap());
    }
    return res;
  }

  Future<int> deleteCaseEntry(_id, _company) async {
    var dbClient = await db;
    int res;
    res = await dbClient.delete("tb_t_caseentry",
        where: "hdcasenummobile='" + _id + "'");
    return res;
  }

  Future<List<CaseEntry>> getDataCaseEntry(String _search,String _company) async {
    var dbClient = await db;
    String sql = "Select * from tb_t_caseentry where 1=1";
    if (_search != "") {
      sql += " And hdcasenummobile like '%" +
          _search +
          "%' or hdcasenum like '%" +
          _search +
          "%' and company = '" + _company + "'";
    }
    List<Map> list = await dbClient.rawQuery(sql);
    List<CaseEntry> listdata = new List();
    for (int i = 0; i < list.length; i++) {
      var item = new CaseEntry(
          list[i]["casetypeid"],
          list[i]["caseowner"],
          list[i]["hdcasenum"],
          list[i]["hdcasenummobile"],
          list[i]["statuscase"],
          list[i]["district"],
          list[i]["reqperconid"],
          list[i]["name"],
          list[i]["customer"],
          list[i]["link"],
          list[i]["context"],
          list[i]["description"],
          list[i]["territoryid"],
          list[i]["partnum"],
          list[i]["revisionnum"],
          list[i]["partdescription"],
          list[i]["quantity"],
          list[i]["quantityuom"],
          list[i]["serialnum"],
          list[i]["callnum"],
          list[i]["rmanum"],
          list[i]["externallinks"],
          list[i]["topicid1"],
          list[i]["topicid2"],
          list[i]["topicid3"],
          list[i]["resolutiontext"],
          list[i]["tasksetid"],
          list[i]["complete"],
          list[i]["company"]);
      listdata.add(item);
    }
    return listdata;
  }
}
