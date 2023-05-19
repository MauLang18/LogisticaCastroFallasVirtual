class User {
  final String pass;

  User({required this.pass});

  Map<String, dynamic> toJson() => {
        'pass': pass,
      };
}
