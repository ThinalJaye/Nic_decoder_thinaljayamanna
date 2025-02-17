class NicModel {
  final String dateOfBirth;
  final String gender;
  final int age;
  final String weekday;
  final bool canVote;
  final String serialNumber; // Add this field

  NicModel({
    required this.dateOfBirth,
    required this.gender,
    required this.age,
    required this.weekday,
    required this.canVote,
    required this.serialNumber, // Add this parameter
  });
}