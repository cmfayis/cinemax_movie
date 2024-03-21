import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:meta/meta.dart';

part 'profile_event.dart';
part 'profile_state.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  ProfileBloc() : super(ProfileInitial()) {
    on<intialEvent>((event, emit) async {
      User? user = FirebaseAuth.instance.currentUser;
      QuerySnapshot<Map<String, dynamic>> userData = await FirebaseFirestore
          .instance
          .collection("Users")
          .where("uid", isEqualTo: user!.uid)
          .get();

      final Email = userData.docs.first.get('Email');
      final Name = userData.docs.first.get('Name');
      emit(FetchState(
        name: Name,
        email: Email,
      ));
    });
    on<LogoutEvent>((event, emit) {
      FirebaseAuth.instance.signOut();
      emit(LogoutState());
    });
  }
}
