import '../models/nic_model.dart';

class NicDecoder {
  static const List<int> _daysInMonths = [31, 29, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31];
  static const List<String> _months = [
    "January", "February", "March", "April", "May", "June",
    "July", "August", "September", "October", "November", "December"
  ];

  static NicModel decodeNic(String nic) {
    if (!_isValidNic(nic)) {
      throw Exception('Invalid NIC format');
    }

    bool isOldFormat = nic.length == 10;
    String birthYear = '';
    int dayOfYear = 0;
    bool canVote = false;
    String serialNumber;

    if (isOldFormat) {
      birthYear = '19${nic.substring(0, 2)}';
      dayOfYear = int.parse(nic.substring(2, 5));
      canVote = nic[9].toLowerCase() == 'v';
      serialNumber = nic.substring(5, 9); // Extract serial for old format
    } else {
      birthYear = nic.substring(0, 4);
      dayOfYear = int.parse(nic.substring(4, 7));
      serialNumber = nic.substring(7, 12); // Extract serial for new format
    }

    bool isMale = dayOfYear < 500;
    if (!isMale) {
      dayOfYear -= 500;
    }

    // Calculate month and day
    var monthDay = _calculateMonthAndDay(dayOfYear);
    DateTime dateOfBirth = DateTime(
      int.parse(birthYear),
      monthDay['month']! + 1,
      monthDay['day']!
    );

    int age = _calculateAge(dateOfBirth);
    canVote = age >= 18; // Set voting eligibility based on age

    return NicModel(
      dateOfBirth: '${dateOfBirth.day}/${_months[dateOfBirth.month - 1]}/${dateOfBirth.year}',
      gender: isMale ? 'Male' : 'Female',
      age: age,
      weekday: _getWeekday(dateOfBirth.weekday),
      canVote: canVote,
      serialNumber: serialNumber, // Add serial number
    );
  }

  static int _calculateAge(DateTime birthDate) {
    DateTime today = DateTime.now();
    int age = today.year - birthDate.year;
    if (today.month < birthDate.month || 
        (today.month == birthDate.month && today.day < birthDate.day)) {
      age--;
    }
    return age;
  }

  static Map<String, int> _calculateMonthAndDay(int dayOfYear) {
    int total = 0;
    for (int i = 0; i < _daysInMonths.length; i++) {
      total += _daysInMonths[i];
      if (dayOfYear <= total) {
        int day = dayOfYear - (total - _daysInMonths[i]);
        return {'month': i, 'day': day};
      }
    }
    throw Exception('Invalid day of year');
  }

  static bool _isValidNic(String nic) {
    if (nic.isEmpty) return false;
    
    if (nic.length == 10) {
      return RegExp(r'^\d{9}[vV]$').hasMatch(nic);
    } else if (nic.length == 12) {
      return RegExp(r'^[12]\d{11}$').hasMatch(nic);
    }
    return false;
  }

  static String _getWeekday(int day) {
    switch (day) {
      case 1: return 'Monday';
      case 2: return 'Tuesday';
      case 3: return 'Wednesday';
      case 4: return 'Thursday';
      case 5: return 'Friday';
      case 6: return 'Saturday';
      case 7: return 'Sunday';
      default: return 'Invalid';
    }
  }
}