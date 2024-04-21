import 'package:add_2_calendar/add_2_calendar.dart';

DateTime _parseDateTime(String dateTimeText) {
  try {
    // Splitting the text to extract date and time components
    List<String> components = dateTimeText.split(", ");
    String dateText = components[0]; // "27-03-2024"
    String timeText = components[1]; // "09:00 PM"

    // Parsing date
    List<String> dateComponents = dateText.split("-");
    int year = int.parse(dateComponents[2]);
    int month = int.parse(dateComponents[1]);
    int day = int.parse(dateComponents[0]);

    // Parsing time
    List<String> timeComponents = timeText.split(":");
    int hour = int.parse(timeComponents[0]);
    int minute = int.parse(timeComponents[1].split(" ")[0]);
    String period = timeComponents[1].split(" ")[1];

    // Adjusting hour for PM
    if (period == "PM" && hour != 12) {
      hour += 12;
    }

    return DateTime(year, month, day, hour, minute);
  } catch (e) {
    print("Error parsing DateTime: $e");
    return DateTime.now(); // Return current time if parsing fails
  }
}


Event buildEvent(String date, String location, String eventName, String name, {Recurrence? recurrence}) {
  DateTime startDate = _parseDateTime(date);
  DateTime endDate = startDate.add(const Duration(hours: 2)); // Should be edited
  print('Start Date is: $startDate');

  return Event(
    title: eventName,
    description: '$eventName | $name | AlaFein Event',
    location: location,
    startDate: startDate,
    endDate: endDate,
    allDay: false,
    iosParams: const IOSParams(
      reminder: Duration(hours: 24),
      url: "http://example.com", // edit url to event
    ),
    // androidParams: const AndroidParams(
    //   emailInvites: ["test@example.com"],
    // ),
    recurrence: recurrence,
  );
}