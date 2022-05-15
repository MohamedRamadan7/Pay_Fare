import 'package:pay_fare/modules/pay_fare/login/app_login_screen.dart';
import 'package:pay_fare/shared/components/components.dart';
import 'package:pay_fare/shared/network/local/cache_helper.dart';

void signOut(context) {
  CacheHelper.removeData(key: 'clientId').then((value) {
    if (value) {
      navigateAndFinish(context, AppLoginScreen());
    }
  });
}

int? clientId;
String? DriverPhone;
