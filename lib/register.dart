import 'dart:async';
import 'dart:io';
import 'login.dart';

import 'dbConnection.dart';

Future register() async {
  var conn = await dbConnect();
  print("=====WELCOME TO OUR REGISTRATION =====");

  print("");

  stdout.write("====1. Enter your first name: ");
  var fName = stdin.readLineSync();

  stdout.write("====2. Enter your lName name: ");
  var lName = stdin.readLineSync();

  stdout.write("====3. Enter your username: ");
  var username = stdin.readLineSync();

  stdout.write("====4. Enter your password: ");
  stdin.echoMode = false;
  var password = stdin.readLineSync().hashCode;
  stdin.echoMode = true;
 print("");
  stdout.write("====5. Enter your password to verify: ");
  stdin.echoMode = false;
  var verPassword = stdin.readLineSync().hashCode;
  stdin.echoMode = true;
  print("");
  var pasword;
  if (password == verPassword) {
    pasword = verPassword;
    print("Thank you for using our registration menu");
    print("=====You are successfuly registered=====");
    print("#                                      #");
    print("You Want to login...?: ");
    print("1. Yes");
    print("2. No");

    stdout.write("Press (1) to accept login page or (2) to cancel ");
    var userAcception = stdin.readLineSync();
    if (userAcception == "1") {
      login();
    } else {
      exit(0);
    }
  } else {
    print("Password did not match try again");
  }
  var user_data_insert = await conn.query(
      'insert into users values(?,?,?,?)', [fName, lName, username, pasword]);
  await conn.close();
}
