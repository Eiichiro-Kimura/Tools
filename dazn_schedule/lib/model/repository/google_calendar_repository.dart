import 'package:dazn_schedule/model/entity/program.dart';
import 'package:dazn_schedule/model/io/google_auth_executor.dart';
import 'package:dazn_schedule/model/repository/i_cloud_calendar_repository.dart';
import 'package:googleapis/calendar/v3.dart';
import 'package:googleapis_auth/auth.dart';

class GoogleCalendarRepository implements ICloudCalendarRepository {

  static const timeZone = 'GMT+09:00';
  static const calendarId = 'primary';
  GoogleAuthExecutor _googleAuthExecutor;

  @override
  void init(String apiClientId) =>
      _googleAuthExecutor = GoogleAuthExecutor(
          [CalendarApi.CalendarScope],
          apiClientId
      );

  @override
  void addEvent(Program program) {
    if (null == _googleAuthExecutor) {
      throw Exception('GoogleAuth Null Error');
    }

    _googleAuthExecutor.authenticate(
            (authClient) => _authenticated(program, authClient)
    );
  }

  void _authenticated(Program program, AuthClient authClient) =>
      CalendarApi(authClient)
          .events
          .insert(_createEvent(program), calendarId)
          .then(_calendarInsertFinished);

  void _calendarInsertFinished(Event event) {
    if ('confirmed' != event.status) {
      throw Exception('CalendarApi Error ${event.status}');
    }
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
