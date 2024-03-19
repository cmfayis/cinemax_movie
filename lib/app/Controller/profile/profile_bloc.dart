import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:meta/meta.dart';

part 'profile_event.dart';
part 'profile_state.dart';

class SettingBloc extends Bloc<SettingEvent, SettingState> {
  SettingBloc() : super(SettingInitial()) {
    on<intialEvent>((event, emit) async {
      User? user = FirebaseAuth.instance.currentUser;
      QuerySnapshot<Map<String, dynamic>> userData = await FirebaseFirestore
          .instance
          .collection("Users")
          .where("uid", isEqualTo: user!.uid)
          .get();
      if (userData.docs.isNotEmpty) {
        final Email = userData.docs.last.get('Email');
        final Name = userData.docs.last.get('Name');

        emit(FetchState(
          name: Name,
          email: Email,
        ));
      }
    });
        on<LogoutEvent>((event, emit) {
      FirebaseAuth.instance.signOut();
      emit(LogoutState());
    });
  }
}
