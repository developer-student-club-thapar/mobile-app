import 'package:data_connection_checker_nulls/data_connection_checker_nulls.dart';

class InternetChecker {
  static Stream<DataConnectionStatus> get getInternetStatus =>
      (DataConnectionChecker()..checkInterval = Duration(seconds: 1))
          .onStatusChange;
}
