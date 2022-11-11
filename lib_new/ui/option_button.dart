import 'package:flutter/material.dart';
import 'package:moriapp/styles/colors.dart' as m_colors;
import 'package:moriapp/styles/dimens.dart' as m_dimens;

class OptionButton extends StatelessWidget {
  const OptionButton({
    Key? key,
    required this.title,
    required this.description,
    required this.icon,
    required this.active,
    required this.callback,
  }) : super(key: key);

  final String title;
  final String description;
  final IconData icon;
  final bool active;
  final VoidCallback callback;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: callback,
        child: Container(
          height: 85,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(m_dimens.roundedCorner),
            color: active ? m_colors.colorEnabled : m_colors.colorDisabled,
          ),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 16, right: 12),
                child: Icon(
                  icon,
                  size: 24,
                  color:
                      active ? m_colors.colorTextDark : m_colors.colorTextLight,
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: active
                          ? m_colors.colorTextDark
                          : m_colors.colorTextLight,
                    ),
                  ),
                  const SizedBox(
                    height: 6,
                  ),
                  Text(
                    description,
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w400,
                      color: active
                          ? m_colors.colorTextDark
                          : m_colors.colorTextLight,
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
