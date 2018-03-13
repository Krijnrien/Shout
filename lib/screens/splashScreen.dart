part of shout;

class SplashPage extends StatefulWidget {
  @override
  State createState() => new _SplashPageState();
}

class _SplashPageState extends State {
  @override
  void initState() {
    super.initState();

    // Listen for our auth event (on reload or start)
    // Go to our /todos page once logged in

    if (isLoggedIn()) {
      print('check');
      //Navigator.pushNamed(context, RegisterPage.routeName);
    } else {
      print('cross');
      //Navigator.pushNamed(context, LoginPage.routeName);
    }
//
//    _auth.onAuthStateChanged.firstWhere((user) => user != null).then((user) {
//
//    });

    // Give the navigation animations, etc, some time to finish
    // signInWithGoogle();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          new Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              new CircularProgressIndicator(),
              new SizedBox(width: 20.0),
              new Text("Please wait..."),
            ],
          ),
        ],
      ),
    );
  }
}