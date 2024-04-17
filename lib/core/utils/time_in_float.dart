double timInFloat({required String time}) {
  // String time = "11:45";

  // Split the time string by ":" to separate hours and minutes
  List<String> parts = time.split(":");

  // Convert hours part to an integer
  int hours = int.parse(parts[0]);

  // Convert minutes part to an integer
  int minutes = int.parse(parts[1]);

  // Convert the time to a floating-point number
  double timeInFloat = hours + (minutes / 100);

  print(timeInFloat);

  return timeInFloat;
}

double currentTimeInFloat({required DateTime now}) {
  // Extract hours and minutes
  int hours = now.hour;
  int minutes = now.minute;

  // Convert the time to a floating-point number
  double timeInFloat = hours + (minutes / 100);

  print(timeInFloat.toStringAsFixed(2)); // Output: e.g., 11.50
  return timeInFloat;
}
