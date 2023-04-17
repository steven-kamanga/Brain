import 'package:flutter/material.dart';
import 'package:flutter_user_agentx/flutter_user_agent.dart';
import 'package:gpt3_webview/home.dart';

class Landing extends StatefulWidget {
  const Landing({super.key});

  @override
  State<Landing> createState() => _LandingState();
}

class _LandingState extends State<Landing> {
  String userAgent = "";
  @override
  void initState() {
    _initUserAgent();
    super.initState();
  }

  Future<void> _initUserAgent() async {
    await FlutterUserAgent.init();

    setState(() {
      userAgent = FlutterUserAgent.userAgent!;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(
            height: 10,
          ),
          Container(
            color: Colors.black,
            child: Center(
              child: InkWell(
                onTap: () {
                  setState(() {
                    userAgent = FlutterUserAgent.userAgent!;
                  });
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Home(
                        userAgent: userAgent,
                      ),
                    ),
                  );
                },
                child: const Icon(
                  Icons.arrow_forward,
                  size: 40,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
