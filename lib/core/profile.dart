class Profile {
  Profile({
    required this.name,
  });

  final String name;

  static Profile getCurrentProfile(){
    return Profile(name: "1.21.5");
  }
}

