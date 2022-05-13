
import 'package:pay_fare/shared/components/components.dart';
import 'package:pay_fare/shared/network/local/cache_helper.dart';

void signOut (context)
{
  CacheHelper.removeData(key: 'token').then((value) {
    if(value)
    {
      //navigateAndFinish(context, ShopLodginScreen());
    }
  });
}

String? clientId ='';

