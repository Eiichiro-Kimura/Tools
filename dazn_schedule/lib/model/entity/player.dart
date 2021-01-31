class Player {

  Player(this.name, this.dateOfBirth, this.countryOfBirth, this.nationality,
      this.position);

  final String name;
  final String dateOfBirth;
  final String countryOfBirth;
  final String nationality;
  final String position;

  Map<String, String> toMap() => {
    'Name': name,
    'DateOfBirth': dateOfBirth,
    'CountryOfBirth': countryOfBirth,
    'Nationality': nationality,
    'Position': position,
  };
}
