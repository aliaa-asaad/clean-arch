import 'package:internet_connection_checker/internet_connection_checker.dart';

//this class is an abstract because if the package is changed to another package or if the package is removed
//I can change the implementation of the class without affecting the other classes
abstract class NetworkInfo  {
  Future<bool> get isConnected;
}
//this class is an implementation of the abstract class NetworkInfo using the package internet_connection_checker
class NetworkInfoImpl implements NetworkInfo {
  final InternetConnectionChecker connectionChecker;

  NetworkInfoImpl({required this.connectionChecker});
  @override
  Future<bool> get isConnected => connectionChecker.hasConnection;
}