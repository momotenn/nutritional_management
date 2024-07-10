import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:nutritional_management/common/domain/infra_interface/user_remote_repository_interface.dart';
import 'package:nutritional_management/common/domain/model/user/user.dart'
    as domain;

class UserRemoteRepository implements UserRemoteRepositoryInterface {
  @override
  Future<String> create(
      String name, String? base64DataImage, String uid) async {
    try {
      final firestore = FirebaseFirestore.instance;

      final user = <String, dynamic>{
        'name': name,
        'base64DateImage': base64DataImage,
        'googleUID': uid
      };
      final snapshot = await firestore.collection("users").add(user);
      return snapshot.id;
    } catch (e) {
      return Future.error(e);
    }
  }

  @override
  Future<domain.User?> readByGoogleUID(String uid) async {
    try {
      QuerySnapshot querySnapshot = await FirebaseFirestore.instance
          .collection('users')
          .where("googleUID", isEqualTo: uid)
          .get();

      if (querySnapshot.docs.isEmpty) {
        return Future.value(null);
      } else {
        final document = querySnapshot.docs.first;
        final user = domain.User(
            id: document.id,
            name: document.get("name"),
            base64ImageData: document.get('base64ImageData'),
            uid: document.get('googleUID'));
        return Future.value(user);
      }

      // firestoreにgoogleUIDが一致するデータを探してもらう
      // 探してもらった結果が空の場合は、nullを返す
      // 探してもらって結果があれば、domain.Userに変換して返す
    } catch (e) {
      return Future.error(e);
    }
  }
}
