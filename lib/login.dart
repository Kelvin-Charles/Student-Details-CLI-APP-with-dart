import 'dart:io';
import 'dbConnection.dart';

Future login() async {
  var conn = await dbConnect();
  print("===  Welcome to Our Login Page  ===");
  print("===  Please Authorize your Identity ===");
  stdout.write("Enter your username: ");
  var user_username = stdin.readLineSync();

  stdout.write("Enter your password: ");
  stdin.echoMode = false;
  var user_password = stdin.readLineSync();
  stdin.echoMode = true;
  print("");
  var db_usernames = await conn.query("SELECT username FROM users");
  var userList = [];
  for (var user in db_usernames) {
    userList.add(user.first.toString());
  }
  // for (var username in userList) {
  //   username = username.toString();
  if (userList.contains(user_username)) {
    var u_username = user_username;

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
    if (realPassword.toString() == user_password.hashCode.toString()) {
      print("welcome ${names[0]} ${names[1]}");
      await conn.close();
    }
  } else {
    print("incorrect password or username");
  }
  await conn.close();
}
