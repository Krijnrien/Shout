//part of shout;
//
//class RegisterPage extends StatefulWidget {
//
//  static const String routeName = "/registerPage";
//
//  @override
//  State createState() => new RegisterPageState();
//}
//
//class RegisterPageState extends State<RegisterPage>
//    with SingleTickerProviderStateMixin {
//
//  AnimationController _iconAnimationController;
//  Animation<double> _iconAnimation;
//
//  @override
//  void initState() {
//    super.initState();
//    _iconAnimationController = new AnimationController(
//      vsync: this,
//      duration: new Duration(milliseconds: 500),
//    );
//    _iconAnimation = new CurvedAnimation(
//      parent: _iconAnimationController,
//      curve: Curves.easeIn,
//    );
//    _iconAnimation.addListener(() => this.setState(() {}));
//
//    _iconAnimationController.forward();
//  }
//
//  @override
//  Widget build(BuildContext _context) {
//    return new Scaffold(
//      backgroundColor: Colors.orangeAccent,
//      body: new Stack(
//        fit: StackFit.expand,
//        children: <Widget>[
//          new Container(
//            decoration: new BoxDecoration(
//              gradient: new LinearGradient(
//                begin: new FractionalOffset(0.0, 0.8),
//                end: new FractionalOffset(0.5, 0.0),
//                colors: [
//                  const Color(0xff756b7b),
//                  const Color(0xff944c98),
//                ],
//                tileMode: TileMode.clamp,
//              ),
//            ),
//          ),
//          new ListView(
//              padding: const EdgeInsets.only(top: 60.0),
//              children: <Widget>[
//                new FlutterLogo(
//                  size: _iconAnimation.value * 100,
//                ),
//                new Form(
//                    child: new Theme(
//                      data: new ThemeData(
//                          brightness: Brightness.light,
//                          primarySwatch: Colors.teal,
//                          inputDecorationTheme: new InputDecorationTheme(
//                              labelStyle: new TextStyle(
//                                color: Colors.white,
//                                fontSize: 20.0,
//                              )
//                          )
//                      ),
//                      child: new Container(
//                        padding: const EdgeInsets.all(40.0),
//                        child: new Column(
//                            children: <Widget>[
//                              new TextFormField(
//                                decoration: new InputDecoration(
//                                  labelText: "Enter Email",
//                                ),
//                                keyboardType: TextInputType.emailAddress,
//                              ),
//                              new TextFormField(
//                                decoration: new InputDecoration(
//                                    labelText: "Enter password"
//                                ),
//                                keyboardType: TextInputType.text,
//                                obscureText: true,
//                              ),
//                              new TextFormField(
//                                decoration: new InputDecoration(
//                                    labelText: "Confirm password"
//                                ),
//                                keyboardType: TextInputType.text,
//                                obscureText: true,
//                              ),
//                              new Padding(
//                                padding: const EdgeInsets.only(top: 20.0),
//                              ),
//                              new MaterialButton(
//                                height: 40.0,
//                                minWidth: 100.0,
//                                color: Colors.teal[500],
//                                textColor: Colors.white,
//                                child: new Text("Register"),
//                                onPressed: () => {},
//                                splashColor: Colors.redAccent,
//                              ),
//                              new Padding(
//                                padding: const EdgeInsets.only(top: 20.0),
//                              ),
//                              new InkWell(
//                                  child: new Text(
//                                    "Already have an account? Login!",
//                                    style: new TextStyle(
//                                      color: Colors.white,
//                                      fontSize: 14.0,
//                                    ),
//                                  ),
//                                  onTap: () =>
//                                      Navigator.pushNamed(
//                                          context, RegisterPage.routeName)
//                              )
//                            ]
//                        ),
//                      ),
//                    )
//                ),
//              ]
//
//          )
//        ],
//      ),
//    );
//  }
//}

/*
part of shout;


class RegisterPage extends StatefulWidget {
  const RegisterPage({ Key key }) : super(key: key);

  static const String routeName = '/registerPage';

  @override
  RegisterPageState createState() => new RegisterPageState();
}

class PersonData {
  String email = '';
  String password = '';
}

class RegisterPageState extends State<RegisterPage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  PersonData person = new PersonData();

  void showInSnackBar(String value) {
    _scaffoldKey.currentState.showSnackBar(new SnackBar(
        content: new Text(value)
    ));
  }

  bool _autovalidate = false;
  bool _formWasEdited = false;
  final GlobalKey<FormState> _formKey = new GlobalKey<FormState>();
  final GlobalKey<FormFieldState<String>> _passwordFieldKey = new GlobalKey<
      FormFieldState<String>>();

  void _handleSubmitted() {
    final FormState form = _formKey.currentState;
    if (!form.validate()) {
      _autovalidate = true; // Start validating on every change.
      showInSnackBar('Please fix the errors in red before submitting.');
    } else {
      form.save();
      showInSnackBar('${person.email}\'s phone number is');
    }
  }


  String _validatePassword(String value) {
    _formWasEdited = true;
    final FormFieldState<String> passwordField = _passwordFieldKey.currentState;
    if (passwordField.value == null || passwordField.value.isEmpty)
      return 'Please choose a password.';
    if (passwordField.value != value)
      return 'Passwords don\'t match';
    return null;
  }

  Future<bool> _warnUserAboutInvalidData() async {
    final FormState form = _formKey.currentState;
    if (form == null || !_formWasEdited || form.validate())
      return true;

    return await showDialog<bool>(
      context: context,
      child: new AlertDialog(
        title: const Text('This form has errors'),
        content: const Text('Really leave this form?'),
        actions: <Widget>[
          new FlatButton(
            child: const Text('YES'),
            onPressed: () {
              Navigator.of(context).pop(true);
            },
          ),
          new FlatButton(
            child: const Text('NO'),
            onPressed: () {
              Navigator.of(context).pop(false);
            },
          ),
        ],
      ),
    ) ?? false;
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      key: _scaffoldKey,
      appBar: new AppBar(
        title: const Text('Text fields'),
      ),
      body: new SafeArea(
        top: false,
        bottom: false,
        child: new Form(
          key: _formKey,
          autovalidate: _autovalidate,
          onWillPop: _warnUserAboutInvalidData,
          child: new ListView(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            children: <Widget>[
              new TextFormField(
                decoration: const InputDecoration(
                  icon: const Icon(Icons.email),
                  hintText: 'Your email address',
                  labelText: 'E-mail',
                ),
                keyboardType: TextInputType.emailAddress,
                onSaved: (String value) {
                  person.email = value;
                },
              ),
              new TextFormField(
                key: _passwordFieldKey,
                decoration: const InputDecoration(
                  hintText: 'New Password',
                  labelText: 'New Password *',
                ),
                obscureText: true,
                onSaved: (String value) {
                  person.password = value;
                },
              ),
              new TextFormField(
                decoration: const InputDecoration(
                  hintText: 'Re-type Password',
                  labelText: 'Re-type Password *',
                ),
                obscureText: true,
                onFieldSubmitted: (String value) {
                  _handleSubmitted();
                },
                validator: _validatePassword,
              ),
              new Container(
                padding: const EdgeInsets.all(20.0),
                alignment: Alignment.center,
                child: new RaisedButton(
                  child: const Text('Submit'),
                  onPressed: _handleSubmitted,
                ),
              ),
              new Container(
                padding: const EdgeInsets.only(top: 20.0),
                child: new Text('* indicates required field', style: Theme
                    .of(context)
                    .textTheme
                    .caption),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
 */