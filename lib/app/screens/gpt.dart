import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import '../../constatnts/constants.dart';

class Gpt extends StatefulWidget {
  final String userAgent;
  const Gpt({Key? key, required this.userAgent}) : super(key: key);

  @override
  State<Gpt> createState() => _GptState();
}

class _GptState extends State<Gpt> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SafeArea(
          child: InAppWebView(
            initialUrlRequest: URLRequest(url: Uri.parse(Constants.chatGptUrl)),
            initialOptions: InAppWebViewGroupOptions(
              crossPlatform: InAppWebViewOptions(
                userAgent: widget.userAgent,
                mediaPlaybackRequiresUserGesture: false,
                cacheEnabled: true,
                javaScriptEnabled: true,
                useShouldInterceptFetchRequest: true,
                preferredContentMode: UserPreferredContentMode.MOBILE,
              ),
              android: AndroidInAppWebViewOptions(
                useHybridComposition: true,
                builtInZoomControls: true,
                displayZoomControls: false,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
