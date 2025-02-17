class NICFormats {
  static const String oldFormat = '853400937v';
  static const String newFormat = '198534000937';

  static const String oldFormatDescription = 
      'Old NIC format: 9 digits followed by a letter (v/x)';
  
  static const String newFormatDescription = 
      'New NIC format: 12 digits';

  static bool isOldFormat(String nic) {
    return RegExp(r'^\d{9}[vVxX]$').hasMatch(nic);
  }

  static bool isNewFormat(String nic) {
    return RegExp(r'^\d{12}$').hasMatch(nic);
  }
}
