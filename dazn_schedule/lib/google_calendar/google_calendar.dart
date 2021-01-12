import 'package:dazn_schedule/google_calendar/google_auth.dart';
import 'package:dazn_schedule/program_guide/program.dart';
import 'package:googleapis/calendar/v3.dart';

class GoogleCalendar {

  static const timeZone = 'GMT+09:00';
  static const calendarId = 'primary';
  final _googleAuth = GoogleAuth([CalendarApi.CalendarScope]);

  void add(Program program) {
    _addEvent(_createEvent(program));
  }

  Event _createEvent(Program program) {
    final start = EventDateTime()
      ..timeZone = timeZone
      ..dateTime = program.dateTime;
    final end = EventDateTime()
      ..timeZone = timeZone
      ..dateTime = start.dateTime.add(const Duration(hours: 2));

    return Event()
      ..summary = program.programName
      ..start = start
      ..end = end;
  }

  void _addEvent(Event event) {
    _googleAuth.authenticate((authClient) {
      CalendarApi(authClient)
          .events
          .insert(event, calendarId)
          .then((authClient) {
            if ('confirmed' == authClient.status) {
            } else {
            }
          });
    });
  }
}
