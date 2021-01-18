import 'package:dazn_schedule/model/io/google_auth.dart';
import 'package:dazn_schedule/model/program.dart';
import 'package:dazn_schedule/model/repository/i_cloud_calendar_repository.dart';
import 'package:googleapis/calendar/v3.dart';

class GoogleCalendarRepository implements ICloudCalendarRepository {

  static const timeZone = 'GMT+09:00';
  static const calendarId = 'primary';
  GoogleAuth _googleAuth;

  @override
  void init(String apiClientId) =>
      _googleAuth = GoogleAuth(
          [CalendarApi.CalendarScope],
          apiClientId
      );

  @override
  void add(Program program) =>
      _addEvent(_createEvent(program));

  void _addEvent(Event event) {
    if (null == _googleAuth) {
      return;
    }

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
}
