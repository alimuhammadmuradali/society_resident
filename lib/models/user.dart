class User
{
  String email = '';
  String name = '';
  String password = '';
  int flat = 0;
  String building = '';

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
  void set Flat(int flat)
  {
    this.flat = flat;
  }
  void set Building(String building)
  {
    this.building = building;
  }
  String get Email
  {
    return email ;
  }
  String get Name
  {
    return name;
  }

  int get Flat
  {
    return flat ;
  }
  String get Building
  {
    return building;
  }
  User({this.email});
}
