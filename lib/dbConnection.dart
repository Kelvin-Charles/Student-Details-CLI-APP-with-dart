import 'package:mysql1/mysql1.dart';
import 'dart:async';

Future dbConnect() async {
  var con = await ConnectionSettings(
      host: "127.0.0.1", port: 3306, user: "root", db: "jaribu");
  var conn = await MySqlConnection.connect(con);
  return conn;
}
