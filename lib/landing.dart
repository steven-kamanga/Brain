import 'package:flutter/material.dart';
import 'package:flutter_user_agentx/flutter_user_agent.dart';
import 'package:brain/Gpt.dart';
import 'package:brain/phind.dart';

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
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Text(
                    "AI Dev. Tools",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  InkWell(
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
                    child: Container(
                      height: 40,
                      width: 140,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: const Center(
                        child: Text(
                          "Phind",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          Container(
            color: Colors.black,
            child: Column(
              children: [
                InkWell(
                  onTap: () {
                    setState(
                      () {
                        userAgent = FlutterUserAgent.userAgent!;
                      },
                    );
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Gpt(
                          userAgent: userAgent,
                        ),
                      ),
                    );
                  },
                  child: Container(
                    height: 40,
                    width: 140,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: const Center(
                      child: Text(
                        "GPT-3",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
