class UserModel {
  String name;
  int age;

  UserModel({this.name, this.age});

  void update(UserModel userModel) {
    this.name = userModel.name;
    this.age = userModel.age;
  }
}
