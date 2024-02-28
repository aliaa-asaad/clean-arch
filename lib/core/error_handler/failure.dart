import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable{

}
class OfflineFailure extends Failure{
  /* ليه فالكلاس دا طلب مني اني اعمل اوفررايد لميثود الجيت بس مطلبش فالكلاس اللي فوق ولا عشان هو ابستراكت؟ */
  @override
  // TODO: implement props
  List<Object?> get props => [];

}
class ServerFailure extends Failure{
  
  @override
  // TODO: implement props
  List<Object?> get props => [];

}
class EmptyCachedFailure extends Failure{
 
  @override
  // TODO: implement props
  List<Object?> get props =>[];

}
