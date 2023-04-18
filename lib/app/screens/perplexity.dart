import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import '../../constatnts/constants.dart';

class Perplexity extends StatefulWidget {
  final String userAgent;
  const Perplexity({Key? key, required this.userAgent}) : super(key: key);

  @override
  State<Perplexity> createState() => _PerplexityState();
}

class _PerplexityState extends State<Perplexity> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SafeArea(
          child: InAppWebView(
            initialUrlRequest: URLRequest(
              url: Uri.parse(
                Constants.perplexityUrl,
              ),
            ),
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
