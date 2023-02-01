import 'package:hydrated_bloc/hydrated_bloc.dart';

class BottomNavCubit extends HydratedCubit<int> {
  BottomNavCubit() : super(0);

  void updateIndex(int index) => emit(index);

  @override
  int? fromJson(Map<String, dynamic> json) {
    return json['indexPage'] as int;
  }

  @override
  Map<String, dynamic>? toJson(int state) {
    return <String, int>{'indexPage': state};
  }
}
