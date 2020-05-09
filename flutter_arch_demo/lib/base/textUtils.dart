class TextUtils {
  static bool isEmpty(String value) {
    return value == null || value == "";
  }

  static String getNonStr(String value, {String ifNonReplace}) {
    return isEmpty(value) ? (ifNonReplace == null ? "" : ifNonReplace) : value;
  }
}
