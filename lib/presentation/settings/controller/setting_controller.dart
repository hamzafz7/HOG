import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

class SettingController extends GetxController {
  void launchTelegramURL() async {
    const url =
        'https://t.me/Mk_0934'; // Replace with your actual Telegram link
    // ignore: deprecated_member_use
    if (await canLaunch(url)) {
      // ignore: deprecated_member_use
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  void launchWhatsAppURL() async {
    const phoneNumber = '0945364375';
    final url = 'whatsapp://send?phone=$phoneNumber';

    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}
