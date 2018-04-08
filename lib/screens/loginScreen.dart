part of shout;

class LoginPage extends StatefulWidget {
  static const String routeName = "/loginPage";

  @override
  State createState() => new LoginPageState();
}

class Login {
  String email;
  String password;
}

class LoginPageState extends State<LoginPage>
    with SingleTickerProviderStateMixin {
  Login login = new Login();
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
    Size screenSize = MediaQuery.of(context).size;

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
          new SafeArea(
            top: false,
            bottom: false,
            child: new Form(
              child: new Theme(
                data: new ThemeData(
                    brightness: Brightness.light,
                    primarySwatch: Colors.teal,
                    backgroundColor: Colors.white,
                    inputDecorationTheme: new InputDecorationTheme(
                        labelStyle: new TextStyle(
                      color: Colors.white,
                      fontSize: 18.0,
                    ))),
                child: new ListView(
                    padding: const EdgeInsets.fromLTRB(25.0, 60.0, 25.0, 25.0),
                    children: <Widget>[
                      new FlutterLogo(
                        size: _iconAnimation.value * 100,
                      ),
                      new InputField(
                          hintText: "Email",
                          obscureText: false,
                          textInputType: TextInputType.emailAddress,
                          textStyle: textStyle,
                          textFieldColor: textFieldColor,
                          icon: Icons.mail_outline,
                          iconColor: Colors.white,
                          bottomMargin: 20.0,
                          onSaved: (String email) {
                            login.email = email;
                          }),
                      new InputField(
                          hintText: "Password",
                          obscureText: true,
                          textInputType: TextInputType.text,
                          textStyle: textStyle,
                          textFieldColor: textFieldColor,
                          icon: Icons.vpn_key,
                          iconColor: Colors.white,
                          bottomMargin: 40.0,
                          onSaved: (String password) {
                            login.password = password;
                          }),
                      new Padding(
                        padding: const EdgeInsets.only(top: 20.0),
                      ),
                      new RoundedButton(
                          buttonName: "Login",
                          width: screenSize.width,
                          height: 50.0,
                          bottomMargin: 10.0,
                          borderWidth: 1.0),
                      new Container(
                        alignment: Alignment.center,
                        child: new InkWell(
                          child: new Text(
                            "Don't have an account? Register!",
                            style: new TextStyle(
                              color: Colors.white,
                              fontSize: 14.0,
                            ),
                          ),
                          onTap: () => Navigator.pushNamed(
                              context, RegisterPage.routeName),
                        ),
                      ),
                      new Padding(
                        padding: const EdgeInsets.only(top: 20.0),
                      ),
                      new GoogleSignInButton(
                          width: 100.0,
                          height: 50.0,
                          bottomMargin: 10.0,
                          borderWidth: 1.0)
                    ]),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
