import 'package:flutter/material.dart';
import 'package:flutter_user_agentx/flutter_user_agent.dart';
import 'package:gpt3_webview/gpt.dart';
import 'package:gpt3_webview/phind.dart';

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
          const Center(
            child: Text("AI Dev. Tools",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                )),
          ),
          const SizedBox(
            height: 20,
          ),
          Column(
            children: [
              Center(
                child: Container(
                  height: 40,
                  width: 130,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Center(
                    child: InkWell(
                      onTap: () {
                        setState(() {
                          userAgent = FlutterUserAgent.userAgent!;
                        });
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Gpt(
                              userAgent: userAgent,
                            ),
                          ),
                        );
                      },
                      child: const Text(
                        "Chat Gpt",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Center(
                child: Container(
                  height: 40,
                  width: 130,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Center(
                    child: InkWell(
                      onTap: () {
                        setState(() {
                          userAgent = FlutterUserAgent.userAgent!;
                        });
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Phind(
                              userAgent: userAgent,
                            ),
                          ),
                        );
                      },
                      child: const Text(
                        "Phind",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
