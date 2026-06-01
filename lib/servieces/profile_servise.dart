import 'package:hive_ce/hive.dart';

class ProfileServise {

  final Box profileBox = Hive.box('profile');


  Future<void> savepath(String path) async {

    await profileBox.put('profileImage', path);

  }

  String? getpath(){

    return profileBox.get('profileImage');

  }


  Future<void> deletpath() async{

    await profileBox.delete('profileImage');

  }

}