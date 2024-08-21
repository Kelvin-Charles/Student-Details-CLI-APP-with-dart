import 'dart:async';
import 'dart:io';
import 'RegistrarRegistration.dart';
import 'UserRegister.dart';

import 'admin.dart';

Future mkuuAct() async {
  print("What do u want? ");
  print("1. Register Registrar");
  print("2. Register Normal User");
  stdout.write("press 1 to Registrar or 2 for Normal user");
  var userInput = stdin.readLineSync();
  if (userInput == "1") {
    registrarRegister();
  } else if (userInput == "2") {
    userRegister();
  }
}

Future mkuu() async {
 
  mkuuAct();
}
