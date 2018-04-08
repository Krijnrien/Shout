part of shout;

class RegisterPage extends StatefulWidget {
  static const String routeName = '/registerPage';

  const RegisterPage({Key key}) : super(key: key);

  @override
  RegisterPageState createState() => new RegisterPageState();
}

class Register {
  String email = '';
  String password = '';
  bool isAgreed = false;
}

class RegisterPageState extends State<RegisterPage>
    with SingleTickerProviderStateMixin {
  final GlobalKey<ScaffoldState> scaffoldKey = new GlobalKey<ScaffoldState>();
  Register register = new Register();
  AnimationController iconAnimationController;
  Animation<double> iconAnimation;

  @override
  void initState() {
    super.initState();

    iconAnimationController = new AnimationController(
      vsync: this,
      duration: new Duration(milliseconds: 500),
    );

    iconAnimation = new CurvedAnimation(
      parent: iconAnimationController,
      curve: Curves.easeIn,
    );

    iconAnimation.addListener(() => this.setState(() {}));
    iconAnimationController.forward();
  }

  void showInSnackBar(String value) {
    scaffoldKey.currentState.showSnackBar(new SnackBar(content: new Text(value)));
  }

  bool autoValidate = true;
  bool formWasEdited = false;
  final GlobalKey<FormState> formKey = new GlobalKey<FormState>();
  final GlobalKey<FormFieldState<String>> passwordFieldKey = new GlobalKey<FormFieldState<String>>();

  final googleSignIn = new GoogleSignIn();
  final auth = FirebaseAuth.instance;

  void handleSubmitted() {
    final FormState form = formKey.currentState;
    if (!form.validate()) {
      autoValidate = true; // Start validating on every change.
      showInSnackBar('Please fix the errors in red before submitting.');
    } else {
      form.save();
      registerWithEmail(register.email, register.password);
    }
  }

  String validateEmail(String value) {
    if (value.isEmpty) return 'Email is required.';
    final RegExp nameExp = new RegExp(r'^\w+@[a-zA-Z_]+?\.[a-zA-Z]{2,3}$');
    if (!nameExp.hasMatch(value)) return 'Invalid email address format';
    return null;
  }

  String validatePassword(String value) {
    if (value == null || value.isEmpty) return 'Please choose a password.';
    // if (confirmPassword.value != value)
    //   return 'Passwords don\'t match';
    return null;
  }

  String validateConfirmPassword(String value) {
//    final FormFieldState<String> passwordField = passwordFieldKey.currentState;
//    if (passwordField.value != value) return 'Passwords don\'t match';
    return null;
  }

  String validateTermsAgreement(bool value) {
    if (value == false)
      return "To use this app you are required to accept our terms and conditions.";
    return null;
  }

  Future<bool> warnUserAboutInvalidData() async {
    final FormState form = formKey.currentState;
    if (form == null || !formWasEdited || form.validate()) {
      return true;
    }

    return await showDialog<bool>(
      context: context,
      child: new AlertDialog(
        title: const Text('This form has errors'),
        content: const Text('Really leave this form?'),
        actions: <Widget>[
          new FlatButton(
            child: const Text('Yes'),
            onPressed: () {
              Navigator.of(context).pop(true);
            },
          ),
          new FlatButton(
            child: const Text('No'),
            onPressed: () {
              Navigator.of(context).pop(false);
            },
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;

    return new Scaffold(
      key: scaffoldKey,
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
              key: formKey,
              autovalidate: autoValidate,
              onWillPop: warnUserAboutInvalidData,
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
                      size: iconAnimation.value * 100,
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
                        validateFunction: validateEmail,
                        onSaved: (String email) {
                          register.email = email;
                        }),
                    new InputField(
                        key: passwordFieldKey,
                        hintText: "Password",
                        obscureText: true,
                        textInputType: TextInputType.text,
                        textStyle: textStyle,
                        textFieldColor: textFieldColor,
                        icon: Icons.vpn_key,
                        iconColor: Colors.white,
                        bottomMargin: 40.0,
                        validateFunction: validatePassword,
                        onSaved: (String password) {
                          register.password = password;
                        }),
                    new InputField(
                      hintText: "Re-type password",
                      obscureText: true,
                      textInputType: TextInputType.text,
                      textStyle: textStyle,
                      textFieldColor: textFieldColor,
                      icon: Icons.lock_outline,
                      iconColor: Colors.white,
                      bottomMargin: 40.0,
                      validateFunction: validateConfirmPassword,
                    ),
                    new CheckboxListTile(
                      title: new Text(
                        'I agree to the Terms and Conditions',
                        style: new TextStyle(
                          color: Colors.white,
                          fontSize: 12.0,
                        ),
                      ),
                      value: register.isAgreed,
                      activeColor: Colors.teal,
                      controlAffinity: ListTileControlAffinity.leading,
                      onChanged: (bool value) {
                        setState(() {
                          register.isAgreed = value;
                        });
                      },
                    ),
                    new RoundedButton(
                        buttonName: "Submit",
                        onTap: handleSubmitted,
                        width: screenSize.width,
                        height: 50.0,
                        bottomMargin: 10.0,
                        borderWidth: 1.0),
                    new Container(
                      alignment: Alignment.center,
                      child: new InkWell(
                        child: new Text(
                          "Already have an account? Login!",
                          style: new TextStyle(
                            color: Colors.white,
                            fontSize: 14.0,
                          ),
                        ),
                        onTap: () =>
                            Navigator.pushNamed(context, LoginPage.routeName),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
