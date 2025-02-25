// ...existing imports...

/// Model class representing decoded NIC information.
class NicData {
  /// The original NIC number
  final String nicNumber;
  
  /// The extracted birth date
  final DateTime birthDate;
  
  /// The person's gender
  final String gender;
  
  /// The NIC format type (old/new)
  final String nicType;

  /// Creates a new NIC data instance.
  NicData({
    required this.nicNumber,
    required this.birthDate,
    required this.gender,
    required this.nicType,
  });
}
