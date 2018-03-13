part of shout;

class LoginPage extends StatefulWidget {

  static const String routeName = "/loginPage";

  @override
  State createState() => new LoginPageState();
}

class LoginPageState extends State<LoginPage>
    with SingleTickerProviderStateMixin {

  AnimationController _iconAnimationController;
  Animation<double> _iconAnimation;

  @override
  void initState() {
    super.initState();
    _iconAnimationController = new AnimationController(
      vsync: this,
      duration: new Duration(milliseconds: 500),
    );
    _iconAnimation = new CurvedAnimation(
      parent: _iconAnimationController,
      curve: Curves.easeIn,
    );
    _iconAnimation.addListener(() => this.setState(() {}));

    _iconAnimationController.forward();
  }

  @override
  Widget build(BuildContext _context) {
    return new Scaffold(
      backgroundColor: Colors.orangeAccent,
      body: new Stack(
        fit: StackFit.expand,
        children: <Widget>[
          new Container(
            decoration: new BoxDecoration(
              gradient: new LinearGradient(
                begin: new FractionalOffset(0.0, 0.8),
                end: new FractionalOffset(0.5, 0.0),
                colors: [
                  const Color(0xff756b7b),
                  const Color(0xff944c98),
                ],
                tileMode: TileMode.clamp,
              ),
            ),
          ),
          new ListView(
              children: <Widget>[
                new FlutterLogo(
                  size: _iconAnimation.value * 100,
                ),
                new Form(
                  child: new Theme(
                      data: new ThemeData(
                          brightness: Brightness.light,
                          primarySwatch: Colors.teal,
                          inputDecorationTheme: new InputDecorationTheme(
                              labelStyle: new TextStyle(
                                color: Colors.white,
                                fontSize: 20.0,
                              )
                          )
                      ),
                      child: new Container(
                        padding: const EdgeInsets.all(40.0),
                          child: new Column(
                              children: <Widget>[
                                new TextFormField(
                                  decoration: new InputDecoration(
                                    labelText: "Enter Email",
                                  ),
                                  keyboardType: TextInputType.emailAddress,
                                ),
                                new TextFormField(
                                  decoration: new InputDecoration(
                                      labelText: "Enter password"
                                  ),
                                  keyboardType: TextInputType.text,
                                  obscureText: true,
                                ),
                                new Padding(
                                  padding: const EdgeInsets.only(top: 20.0),
                                ),
                                new MaterialButton(
                                  height: 40.0,
                                  minWidth: 100.0,
                                  color: Colors.teal[500],
                                  textColor: Colors.white,
                                  child: new Text("Login"),
                                  onPressed: () => {},
                                  splashColor: Colors.redAccent,
                                ),
                                new Padding(
                                  padding: const EdgeInsets.only(top: 20.0),
                                ),
                                new InkWell(
                                    child: new Text(
                                      "Don't have an account? Register!",
                                      style: new TextStyle(
                                        color: Colors.white,
                                        fontSize: 14.0,
                                      ),
                                    ),
                                    onTap: () =>
                                        Navigator.pushNamed(
                                            context, RegisterPage.routeName)
                                )
                              ]
                          ),
                        ),
                      )
                ),
              ]

          )
        ],
      ),
    );
  }
}