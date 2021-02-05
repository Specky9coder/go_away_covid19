// import 'package:go_away/src/Models/Global/Global.dart';
// import 'package:go_away/src/Models/Latest/Latest.dart';
// import 'package:go_away/src/Repository/Repository.dart';
// import 'package:shared_preferences/shared_preferences.dart';
//
// class Network {
//   var _repository = Repository();
//   var _worldWideLatest = Latest();
//   var _userCountryData = Country();
//
//   String getOnlyCountryName(String country) {
//     var splits = country.split(',');
//     return splits[0];
//   }
//
//   void getUserCountryFromSharedPreference() async {
//     var preference = await SharedPreferences.getInstance();
//     var userCountry = await preference.getString('userCountry');
//     print('User Country: $userCountry');
//     _repository.getUserCountryData(userCountry).then((response) {
//       _worldWideLatest = response;
//     });
//   }
// }
