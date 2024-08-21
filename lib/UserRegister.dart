import 'dart:async';
import 'dart:io';
import 'login.dart';

import 'dbConnection.dart';

Future userRegister() async {
  var conn = await dbConnect();
  print("=====WELCOME TO OUR REGISTRATION =====");

  print("");

  stdout.write("====1. Enter your first name: ");
  var fName = stdin.readLineSync();

  stdout.write("====2. Enter your lName name: ");
  var lName = stdin.readLineSync();
  print("===== Select Your Gender =====");
  print("===== 1. Male            ======");
  print("===== 2. Female          =====");
  stdout.write("press (1) for Male or  (2) for Female: ");
  var user_gender = stdin.readLineSync();
  var gender;
  if (user_gender == "1")  {
    gender = "MALE";
  } else if (user_gender == "2") {
    gender = "FEMALE";
  }

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
  var urole = "kawaida";
  var pasword;
  if (password == verPassword) {
    pasword = verPassword;
    var user_data_insert = await conn.query(
      'insert into users values(?,?,?,?,?,?)',
      [fName, lName, gender, username, pasword, urole]);
  await conn.close();
    print("Thank you for using our registration menu");
    print("=====You are successfuly registered=====");
    print(" ______________________________________ ");
    print("#______________________________________#");
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
    print("Password did not match try again later");
    exit(0);
  }
  
}
