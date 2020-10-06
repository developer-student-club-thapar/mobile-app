import 'package:data_connection_checker/data_connection_checker.dart';

class InternetChecker {
  static Stream<DataConnectionStatus> get getInternetStatus => (DataConnectionChecker()..checkInterval = Duration(seconds: 1)).onStatusChange;
}
