part of shout;

class GoogleSignInButton extends StatelessWidget {
  final double height;
  final double width;
  final double bottomMargin;
  final double borderWidth;

  //passing props in react style
  GoogleSignInButton({
    this.height,
    this.bottomMargin,
    this.borderWidth,
    this.width,
  });

  @override
  // ignore: missing_return
  Widget build(BuildContext context) {
    return (new InkWell(
      onTap: signInWithGoogle,
      child: new Container(
        width: width,
        height: height,
        margin: new EdgeInsets.only(bottom: bottomMargin),
        alignment: FractionalOffset.center,
        padding: const EdgeInsets.all(2.0),
        decoration: new BoxDecoration(
          color: const Color(0xff4285F4),
          borderRadius: new BorderRadius.all(const Radius.circular(2.0)),
        ),
        child: new Row(
          children: <Widget>[
            new Container(
              width: 48.0,
              height: 48.0,

              decoration: new BoxDecoration(
                color: Colors.white,
                borderRadius: new BorderRadius.all(const Radius.circular(2.0)),
              ),
              child: new Image(
                image: const AssetImage("Assets/graphics/g-logo.png"),
                width: 20.0,
                height: 20.0,
                fit: BoxFit.contain,
              ),
            ),
            new Padding(
              padding: const EdgeInsets.only(left: 20.0),
            ),
            new Text(
              "Sign in with Google",
              style: const TextStyle(
                color: const Color(0XFFFFFFFF),
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    ));
  }
}
