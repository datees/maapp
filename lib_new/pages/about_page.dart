import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher_string.dart';
import 'package:moriapp/styles/colors.dart' as m_colors;
import 'package:moriapp/ui/about_row.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({Key? key}) : super(key: key);

  //Open the browser with the url provided
  void _launchURL(String urlToLaunch) async {
    if (await canLaunchUrlString(urlToLaunch)) {
      await launchUrlString(urlToLaunch);
    } else {
      throw 'Could not launch $urlToLaunch';
    }
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          backgroundColor: m_colors.backgroundView, // status bar color status ba
          leading: IconButton(
            color: Colors.white,
            icon: const Icon(Icons.arrow_back),
            onPressed: () => context.pop(),
          ),
          title: Text(
            "About",
            style: GoogleFonts.roboto(
              color: m_colors.colorTextLight,
            ),
          ),
        ),
        body: ListView(
          children: <Widget>[
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                const SizedBox(
                  height: 8,
                ),
                ListTile(
                  title: Text(
                    "DEVELOPER",
                    textAlign: TextAlign.left,
                    style:
                        TextStyle(fontSize: 14, color: m_colors.colorTextLight),
                  ),
                ),
                AboutRow(
                  icon: Icons.language,
                  title: "AlbertoBobina.com",
                  subtitle: "Website",
                  callback: () {
                    _launchURL("https://www.albertobonacina.com/");
                  },
                ),
                AboutRow(
                  icon: Icons.code,
                  title: "@pollinator",
                  subtitle: "Github",
                  callback: () {
                    _launchURL("https://www.github.com/polilluminato");
                  },
                ),
                AboutRow(
                  icon: Icons.campaign,
                  title: "@pollinator",
                  subtitle: "Twitter",
                  callback: () {
                    _launchURL("https://www.twitter.com/polilluminato");
                  },
                ),
                AboutRow(
                  icon: Icons.business,
                  title: "pertinacious",
                  subtitle: "Linkedin",
                  callback: () {
                    _launchURL("https://www.linkedin.com/in/bonacinaalberto");
                  },
                ),
              ],
            ),
          ],
        ),
      );
}
