import 'package:url_launcher/url_launcher.dart';

class UrlService {
  // Method to launch WhatsApp with specific phone number
  static Future<void> launchWhatsApp() async {
    final Uri whatsappUri = Uri.parse('https://wa.me/8562096794376');
    if (!await launchUrl(whatsappUri, mode: LaunchMode.externalApplication)) {
      throw 'Could not launch WhatsApp';
    }
  }

  // Method to launch Google Form
  static Future<void> launchGoogleForm(String url) async {
    final Uri googleFormUri = Uri.parse(url);
    if (!await launchUrl(googleFormUri, mode: LaunchMode.externalApplication)) {
      throw 'Could not launch Google Form';
    }
  }
}