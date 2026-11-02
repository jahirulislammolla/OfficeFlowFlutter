class AttendanceRecord {
  final String employeeId;
  final DateTime checkIn;
  final DateTime? checkOut;

  const AttendanceRecord({
    required this.employeeId,
    required this.checkIn,
    this.checkOut,
  });
}