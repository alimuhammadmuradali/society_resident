class User
{
  String email = '';
  String name = '';
  String password = '';
  User.fromJson(Map<String, dynamic> map) {
    if (map == null){
      return;
    }
    email = ['email']?? '';
    name = ['name'] ?? '';
  }


  void set Email(String email)
  {
    this.email = email;
  }
  void set Name(String names)
  {
    this.name = names;
  }
  String get Email
  {
    return email ;
  }
  String get Name
  {
    return name;
  }

  User({this.email});
}
