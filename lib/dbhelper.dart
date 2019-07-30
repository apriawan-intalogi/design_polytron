import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:polytron_epicmobile/Model/menurepository.dart';
import 'package:polytron_epicmobile/Model/synchronizerepository.dart';
import 'package:polytron_epicmobile/setting.dart';
import 'package:sqflite/sqflite.dart';
import 'dart:io' as io;
import 'dart:async';

class DBHelper {
  static final DBHelper _instance = new DBHelper.internal();
  DBHelper.internal();

  factory DBHelper() => _instance;

  static Database _db;

  Future<Database> get db async {
    if (_db != null) return _db;
    _db = await setDB();
    return _db;
  }

  setDB() async {
    io.Directory directory = await getApplicationDocumentsDirectory();
    String path = join(directory.path, DatabaseName);
    var dB = await openDatabase(path, version: 1, onCreate: _onCreate);
    return dB;
  }

  void _onCreate(Database db, int version) async {
    await db.execute("""
    Create Table tb_m_contact(
      perconid Text,
      name Text,
      address Text,
      city Text,
      state Text,
      countrynum Integer,
      phonenum Text,
      cellphonenum Text,
      faxnum Text,
      ktp Text,
      npwp Text,
      company Text)
    """);
    await db.execute("""
    Create Table tb_m_menu(
      menuid Text,
      name Text,
      appgroup Text,
      orderby Integer,
      company Text
    )
    """);
    await db.execute("""
    Create Table tb_t_caseentry(
      casetypeid Text,
      caseowner Text,
      hdcasenum Integer,
      hdcasenummobile Text,
      statuscase Text,
      district Text,
      reqperconid Integer,
      name Text,
      customer Text,
      link Text,
      conText Text,
      description Text,
      territoryid Text,
      partnum Text,
      revisionnum Text,
      partdescription Text,
      quantity Real,
      quantityuom Text,
      serialnum Text,
      callnum Integer,
      rmanum Integer,
      externallinks Text,
      topicid1 Text,
      topicid2 Text,
      topicid3 Text,
      resolutionText Text,
      tasksetid Text,
      complete Integer,
      company Text)
    """);
    await db.execute("""
    Create Table tb_m_synchronize(
      modulid Text,
      name Text,
      tglupdate Text,
      company Text)
    """);
    await db.execute("""
    Create Table tb_m_user(
      userid Text,
      name Text,
      pass Text,
      company Text)
    """);
    await db.execute("""
    Create Table tb_t_fscallhd(
      callnum Integer,
      callnummobile Text,
      custid Text,
      prcconnum Text,
      perconid Text,
      shiptonum Text,
      shiptocustid Text,
      taxcatid Text,
      planid Text,
      currencycode Text,
      hdcasenum Integer,
      callcode Text,
      servicetype Text,
      requestdate Text,
      requesttime Text,
      scheddate Text,
      schedtime Text,
      actualdate Text,
      actualtime Text,
      status Text,
      userstatus Text,
      partnum Text,
      partdescription Text,
      nomorseri Text,
      callqty Real,
      kelengkapan Text,
      tanggalakhirgaransi Text,
      warrantytype Text,
      linenum Integer,
      jobnum Text,
      servicedescription Text,
      issuetopics Text,
      topics1 Text,
      topics2 Text,
      topics3 Text,
      topics4 Text,
      topics5 Text,
      callcomment Text,
      doctotlabor Real,
      doctotmaterial Real,
      doctotbilllabor Real,
      discountservice Real,
      doctotbillmaterial Real,
      discountmaterial Real,
      totaldiscount Real,
      totalbayar Real,
      persentasediscount Real,
      jaminan Real,
      tambahanjaminan Real,
      totaljaminan Real,
      company Text)
    """);
    await db.execute("""
    Create Table tb_m_fscallhd_tech(
      callnum Integer,
      callnummobile Text,
      linenum Integer,
      empid Text,
      name Text,
      company Text)
    """);
    print("DB created");
  }

  savemasterapk() async {
    SynchronizeRepository.internal().deleteSynchronize("all", CompanyID);
    MenuRepository.internal().deleteMenu("all", CompanyID);
    //UserRepository.internal().deleteAllUser(CompanyID);
    SynchronizeRepository.internal().saveSynchronize();
    MenuRepository.internal().savemenu();
    //UserRepository.internal().saveuser();
  }
}
