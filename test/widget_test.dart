import 'package:crud_bloc/data/providers/api_service.dart';

void main() async {
  // UserProvider userProvider = UserProvider();

  // ListModel listModel = await userProvider.getDataList();
  // for (var i = 0; i < listModel.data!.length; i++) {
  //   var datas = listModel.data![i];
  //   print(datas.lastName);
  // }
  UserService userService = UserService();

  try {
    final user = await userService.getDetailUser('2');
    print('User Details:');
    print('ID: ${user.id}');
    print('Email: ${user.email}');
    print('First Name: ${user.firstName}');
    print('Last Name: ${user.lastName}');
    print('Avatar: ${user.avatar}');
  } catch (e) {
    print('Error: $e');
  }

  // for (var i = 0; i < a.data!.length; i++) {
  //   var b = a.data![i];
  //   print(b.lastName);
}
