import 'package:flutter/material.dart';
import 'package:moriapp/styles/colors.dart' as m_colors;
import 'package:moriapp/styles/dimens.dart' as m_dimens;

class AboutRow extends StatelessWidget {
  const AboutRow(
      {Key? key,
      required this.title,
      required this.subtitle,
      required this.icon,
      required this.callback})
      : super(key: key);

  final String title;
  final String subtitle;
  final IconData icon;
  final VoidCallback callback;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: callback,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        height: 80,
        decoration: BoxDecoration(
          color: m_colors.colorDisabled,
          borderRadius: BorderRadius.all(
            Radius.circular(m_dimens.roundedCorner),
          ),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Icon(
                icon,
                size: 32,
                color: m_colors.colorTextLight,
              ),
            ),
            Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      color: m_colors.colorTextLight,
                    ),
                  ),
                  const SizedBox(
                    height: 6,
                  ),
                  Text(
                    subtitle,
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                      color: m_colors.colorTextLightDark,
                    ),
                  )
                ])
          ],
        ),
      ),
    );

    // return ListTile(
    //   leading: Icon(
    //     icon,
    //     color: m_colors.colorTextLight,
    //     size: 23,
    //   ),
    //   title: Text(
    //     subtitle,
    //     style: TextStyle(color: m_colors.colorTextLight, fontSize: 14),
    //   ),
    //   onTap: callback,
    // );
  }
}
