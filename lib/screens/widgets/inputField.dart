part of shout;

class InputField extends StatelessWidget {
  final IconData icon;
  final String hintText;
  final TextInputType textInputType;
  final Color textFieldColor, iconColor;
  final bool obscureText;
  final double bottomMargin;
  final TextStyle textStyle, hintStyle;
  final validateFunction;
  final onSaved;
  final Key key;

  InputField({
    this.key,
    this.hintText,
    this.obscureText,
    this.textInputType,
    this.textFieldColor,
    this.icon,
    this.iconColor,
    this.bottomMargin,
    this.textStyle,
    this.validateFunction,
    this.onSaved,
    this.hintStyle
  });

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return (new Container(
      margin: new EdgeInsets.only(top: 10.0),
      child: new DecoratedBox(
        decoration: new BoxDecoration(
          color: textFieldColor,
        ),
        child: new Padding(
          padding: new EdgeInsets.only(left: 10.0),
          child: new TextFormField(
            style: textStyle,
            key: key,
            obscureText: obscureText,
            keyboardType: textInputType,
            validator: validateFunction,
            onSaved: onSaved,
            decoration: new InputDecoration(
              hintText: hintText,
              hintStyle: hintStyle,
              icon: new Icon(
                icon,
                color: iconColor,
              ),
            ),
          ),
        ),
      ),
    ));
  }
}