class Team {

  Team(this.id, this.name, this.phone, this.website, this.email,
      this.clubColors, this.venue, this.address);

  final int id;
  final String name;
  final String phone;
  final String website;
  final String email;
  final String clubColors;
  final String venue;
  final String address;

  Map<String, String> toMap() => {
    'Name': name,
    'Phone': phone,
    'Website': website,
    'Email': email,
    'ClubColors': clubColors,
    'Venue': venue,
    'Address': address,
  };
}
