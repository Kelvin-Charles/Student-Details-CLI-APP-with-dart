import 'dart:async';
import 'dart:io';
import 'package:dart_and_mysql/mkuu.dart';

import 'UserRegister.dart';
import 'admin.dart';
import 'login.dart';

void main() async {
  print("===== Welcom to Our System =====");
  print("");
  print("=== Select option You want below ====");
  print("=== 1. Login                     ====");
  print("=== 2. Register                  ====");
  stdout.write("Press (1) to Login or Press (2) to register: ");
  var userSelection = stdin.readLineSync();
  if (userSelection == "1") {
    print("Who are U");
    print("1. Normal User");
    print("2. Mkuu");
    stdout.write("press 1 or 2");
    var loginRole = stdin.readLineSync();
    if (loginRole == "1") {
      login();
    } else if (loginRole == "2") {
    
      adminLogin();
      
    }
  } else if (userSelection == "2") {
    userRegister();
  }
}
