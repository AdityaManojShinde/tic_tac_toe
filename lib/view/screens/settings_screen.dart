import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:tic_tac_toe/model/play_audio.dart';
import 'package:tic_tac_toe/model/utils.dart';
import 'package:url_launcher/url_launcher.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // ignore: unused_element
    void goToUrl(String url, LaunchMode mode) async {
      try {
        await launchUrl(Uri.parse(url), mode: mode);
      } catch (e) {
        playAudio(Utils.audioWin);
        if (context.mounted) {
          AwesomeDialog(
            context: context,
            dialogType: DialogType.warning,
            animType: AnimType.scale,
            title: 'Error',
            titleTextStyle: const TextStyle(fontWeight: FontWeight.bold),
            desc: 'failed to launch url',
            btnOkOnPress: () {},
          ).show();
        }
      }
    }

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              context.go('/');
            },
            icon: const Icon(Icons.arrow_back)),
      ),
      body: ListView(
        children: [
          ListTile(
            onTap: () {
              playAudio(Utils.audioWin);
              AwesomeDialog(
                context: context,
                dialogType: DialogType.info,
                animType: AnimType.scale,
                title: 'App Version',
                titleTextStyle: const TextStyle(fontWeight: FontWeight.bold),
                desc: 'version : 1.0.0',
                btnOkOnPress: () {},
              ).show();
            },
            leading: const Icon(Icons.android),
            title: const Text("Version"),
          ),
          ListTile(
            onTap: () {
              playAudio(Utils.audioWin);
              AwesomeDialog(
                      context: context,
                      dialogType: DialogType.question,
                      animType: AnimType.leftSlide,
                      title: 'Privacy Policy',
                      btnOkText: 'Read',
                      titleTextStyle:
                          const TextStyle(fontWeight: FontWeight.bold),
                      desc:
                          'This application does not collect any form of user data in any format. read the privacy policy for more information.',
                      btnOkOnPress: () {
                        goToUrl(Utils.privacyPolicyUrl,
                            LaunchMode.inAppBrowserView);
                      },
                      btnCancelOnPress: () {})
                  .show();
            },
            leading: const Icon(Icons.info),
            title: const Text("Privacy Policy"),
          ),
          ListTile(
            onTap: () {
              playAudio(Utils.audioWin);
              AwesomeDialog(
                context: context,
                dialogType: DialogType.success,
                animType: AnimType.scale,
                title: 'More Apps',
                btnOkText: 'Explore',
                titleTextStyle: const TextStyle(fontWeight: FontWeight.bold),
                desc: 'Ready for more? Explore all our apps!',
                btnOkOnPress: () {
                  goToUrl(Utils.playstoreUrl, LaunchMode.externalApplication);
                },
                btnCancelOnPress: () {},
              ).show();
            },
            leading: const Icon(Icons.apps_outlined),
            title: const Text("More Apps"),
          ),
        ],
      ),
    );
  }
}
