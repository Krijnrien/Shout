part of shout;

bool confirmPasswordMatch(String _password, String _confirmPassword) {
  if (_password == _confirmPassword) {
    return true;
  }
  return false;
}