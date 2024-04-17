double calculateDuration(
    {required double fromTime,
    required double toTime,
    required double currentTime}) {
  final fromTime24 = fromTime * 60;
  final toTime24 = toTime * 60;
  final currentTime24 = currentTime * 60;

  final durationInMinutes = toTime24 - fromTime24;
  final durationInHours = durationInMinutes / 60;
  final durationIn100 = durationInHours / durationInHours * 100;
  // final durationIn1 = durationIn100 / 100;

  final currentDurationMinutes = currentTime24 - fromTime24;
  final currentDurationHours = currentDurationMinutes / 60;
  print(currentDurationHours);
  final currentTimeIn100 = currentDurationHours / durationInHours * 100;

  final currentTimeIn1 = currentTimeIn100 / durationIn100;
  print(currentTimeIn1);
  return currentTimeIn1;
}
