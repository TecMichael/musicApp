class SignInResponse {
  bool? error;
  String? message;
  User? account;

  SignInResponse({this.error, this.message, this.account});

  SignInResponse.fromJson(Map<String, dynamic> json) {
    error = json['error'];
    message = json['message'];
    account =
    json['account'] != null ? new User.fromJson(json['account']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['error'] = this.error;
    data['message'] = this.message;
    if (this.account != null) {
      data['account'] = this.account!.toJson();
    }
    return data;
  }
}

class User {
  String? id;
  String? api;
  String? username;
  String? firstname;
  String? lastname;
  String? email;
  String? relationship;
  String? gender;
  String? isVerified;
  String? isDisabled;
  String? location;
  String? profilePhoto;
  String? description;
  String? createdAt;

  User(
      {this.id,
        this.api,
        this.username,
        this.firstname,
        this.lastname,
        this.email,
        this.relationship,
        this.gender,
        this.isVerified,
        this.isDisabled,
        this.location,
        this.profilePhoto,
        this.description,
        this.createdAt});

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    api = json['api'];
    username = json['username'];
    firstname = json['firstname'];
    lastname = json['lastname'];
    email = json['email'];
    relationship = json['relationship'];
    gender = json['gender'];
    isVerified = json['isVerified'];
    isDisabled = json['isDisabled'];
    location = json['location'];
    profilePhoto = json['profilePhoto'];
    description = json['description'];
    createdAt = json['created_At'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['api'] = this.api;
    data['username'] = this.username;
    data['firstname'] = this.firstname;
    data['lastname'] = this.lastname;
    data['email'] = this.email;
    data['relationship'] = this.relationship;
    data['gender'] = this.gender;
    data['isVerified'] = this.isVerified;
    data['isDisabled'] = this.isDisabled;
    data['location'] = this.location;
    data['profilePhoto'] = this.profilePhoto;
    data['description'] = this.description;
    data['created_At'] = this.createdAt;
    return data;
  }
}
