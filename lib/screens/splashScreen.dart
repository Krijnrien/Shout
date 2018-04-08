part of shout;

class SplashPage extends StatefulWidget {
  @override
  State createState() => new _SplashPageState();
}

class _SplashPageState extends State {
  @override
  void initState() {
    super.initState();

    new Future.delayed(const Duration(seconds: 1), () => "1");

    if (isLoggedIn()) {
      sleep(const Duration(seconds: 3));
      //Navigator.pushNamed(context, ChatPage.routeName);
      SchedulerBinding.instance.addPostFrameCallback((_) {
        Navigator.of(context).pushNamed(ChatPage.routeName);
      });
    } else {
      sleep(const Duration(seconds: 3));
      SchedulerBinding.instance.addPostFrameCallback((_) {
        Navigator.of(context).pushNamed(LoginPage.routeName);
      });
      //Navigator.pushNamed(context, LoginPage.routeName);
    }
//
//    _auth.onAuthStateChanged.firstWhere((user) => user != null).then((user) {
//
//    });
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
