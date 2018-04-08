library shout;

import 'dart:async';
import 'dart:math';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/scheduler.dart';

import 'package:google_sign_in/google_sign_in.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'package:location/location.dart';

part 'package:shout/themes.dart';

part 'package:shout/screens/registerScreen.dart';
part 'package:shout/screens/loginScreen.dart';
part 'package:shout/screens/chatScreen.dart';
part 'package:shout/screens/splashScreen.dart';

part 'package:shout/screens/style.dart';
part 'package:shout/screens/widgets/inputField.dart';
part 'package:shout/screens/widgets/roundedButton.dart';
part 'package:shout/screens/widgets/googleSignInButton.dart';

part 'package:shout/util/auth.dart';

part 'package:shout/services/validation.dart';

// ignore: must_be_immutable
class ShoutApp extends StatefulWidget {

  bool _useLightTheme = true;

  @override
  ShoutAppState createState() {
    return new ShoutAppState();
  }
}

class ShoutAppState extends State<ShoutApp> {
  Widget build(BuildContext _context) {
    var routes = <String, WidgetBuilder>{
      LoginPage.routeName: (BuildContext _context) => new LoginPage(),
      RegisterPage.routeName: (BuildContext _context) => new RegisterPage(),
      ChatPage.routeName: (BuildContext _context) => new ChatPage(),
    };

    return new MaterialApp(
      home: new LoginPage(),
      theme: (widget._useLightTheme ? _kGalleryLightTheme : _kGalleryDarkTheme),
      routes: routes,
    );
  }
}
