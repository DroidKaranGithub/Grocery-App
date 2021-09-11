class Data {
  String? name;
  String? email;

  Data({this.name, this.email});

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        name: json['name'] as String?,
        email: json['email'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'name': name,
        'email': email,
      };

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Data && other.name == name && other.email == email;
  }

  @override
  int get hashCode => name.hashCode ^ email.hashCode;
}
