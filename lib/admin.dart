import 'dart:io';
import 'package:dart_and_mysql/mkuu.dart';

import 'dbConnection.dart';

import 'UserRegister.dart';
import 'login.dart';
import 'dart:async';

Future adminLogin() async {
  var conn = await dbConnect();
  print("# Welcome to Admin Panel  #");
  print("");
  print("Please Authorize your Administrative Identity");
  print("");
  stdout.write("Enter Your Username: ");
  var user_username = stdin.readLineSync();

  stdout.write("Enter Your Password: ");
  stdin.echoMode = false;
  var user_password = stdin.readLineSync();
  stdin.echoMode = true;
  // Extracting Username from DB
  var db_usernames = await conn.query("SELECT username FROM users");
  var userList = [];
  for (var user in db_usernames) {
    userList.add(user.first.toString());
  }
  // for (var username in userList) {
  //   username = username.toString();
  if (userList.contains(user_username)) {
    var u_username = user_username;
// Extractin UserPassword from DB
    var db_password = await conn
        .query("SELECT password FROM users WHERE username=?", [u_username]);
    var names = [];
    var db_names =
        await conn.query("select * from users where username=?", [u_username]);

    for (var name in db_names.toList()) {
      names.add(name[0].toString());
      names.add(name[1].toString());
    }
    var realPassword = db_password.toList()[0][0];

// Extracting User Role from DB
    var db_role = await conn
        .query("SELECT role FROM users WHERE username=?", [u_username]);
    var roles = [];
    var db_roles =
        await conn.query("select * from users where username=?", [u_username]);

    for (var role in db_roles.toList()) {
      names.add(role[0].toString());
      names.add(role[1].toString());
    }
    var realRole = db_role.toList()[0][0];

//Verifying User Identity from details above
    if (realPassword.toString() == user_password.hashCode.toString() &&
        realRole == "mkuu") {
          print("");
      print("welcome ${names[0]} ${names[1]}");
      mkuu();
    }
  } else {
    print("Wewe sio Mkuu");
  }
  // var dis
}
