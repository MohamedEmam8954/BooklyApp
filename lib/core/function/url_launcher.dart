import 'package:booklyapp/core/function/showmessage.dart';

import 'package:url_launcher/url_launcher.dart';

Future<void> urlLauncher({required String url, required context}) async {
  final Uri _url = Uri.parse(url);
  if (await canLaunchUrl(_url)) {
    try {
      await launchUrl(_url);
    } catch (e) {
      showmessage(context, "Opps There Is An Error Try Later!");
    }
  } else {
    showmessage(context, "You Can't preview this Book try Later");
  }
}
