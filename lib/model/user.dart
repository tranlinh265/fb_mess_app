class User {
  var name;
  var avatar;
  var message;

  User(this.name, this.avatar, this.message);

  User.fromJson(Map<String, dynamic> json)
      : name = json["name"],
        avatar = json["picture"],
        message = json["greeting"];
}
