import 'package:equatable/equatable.dart';

class PostEntities extends Equatable {
  //the same class as the normal model class in data layer but without the constructors that convert from json and vice versa
  //نفس كلاس الموديل عادي اللي بيكون فالداتا لاير بس من غير الكونستراكتورز اللي بتحولي من جيسون والعكس
  final int id;
  final String title;
  final String body;

  const PostEntities(
      {required this.id, required this.title, required this.body});
  @override
  // TODO: implement props
  List<Object?> get props => [id,title,body];
}
