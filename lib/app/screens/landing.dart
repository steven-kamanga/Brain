import 'package:flutter/material.dart';
import 'package:flutter_user_agentx/flutter_user_agent.dart';
import 'package:gpt3_webview/app/screens/gpt.dart';
import 'package:gpt3_webview/app/screens/perplexity.dart';
import 'package:gpt3_webview/app/screens/phind.dart';
import '../../constatnts/constants.dart';

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
  void dispose() {
    super.dispose();
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
            child: Text(AppStrings.heading,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: FontSize.fs20,
                  fontWeight: FontWeight.bold,
                )),
          ),
          const SizedBox(
            height: AppPadding.ap20,
          ),
          Column(
            children: [
              Center(
                child: Container(
                  height: AppSize.as40,
                  width: AppSize.as130,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(
                      AppPadding.ap10,
                    ),
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
                        AppStrings.chatGpt,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: FontSize.fs14,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: AppSize.as10,
              ),
              Center(
                child: Container(
                  height: AppSize.as40,
                  width: AppSize.as130,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(
                      AppPadding.ap10,
                    ),
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
                        AppStrings.phind,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: FontSize.fs14,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: AppSize.as10,
              ),
              Center(
                child: Container(
                  height: AppSize.as40,
                  width: AppSize.as130,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(
                      AppPadding.ap10,
                    ),
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
                            builder: (context) => Perplexity(
                              userAgent: userAgent,
                            ),
                          ),
                        );
                      },
                      child: const Text(
                        AppStrings.perplexity,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: FontSize.fs14,
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
