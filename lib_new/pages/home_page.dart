import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:moriapp/cubit/password_cubit.dart';
import 'package:moriapp/styles/colors.dart' as m_colors;
import 'package:moriapp/styles/dimens.dart' as m_dimens;
import 'package:moriapp/ui/action_button.dart';
import 'package:moriapp/ui/custom_slider_thumb_circle.dart';
import 'package:moriapp/ui/option_button.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => PasswordCubit(),
      child: const HomeView(),
    );
  }
}

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  void _copyToClipboard(String newPassword) {
    Clipboard.setData(ClipboardData(text: newPassword));

    if (Platform.isAndroid || Platform.isIOS) {
      Fluttertoast.showToast(
          msg: "Password copied to clipboard",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor:
            m_colors.backgroundView, // status bar coloraturas bar brightness
        title: Text(
          "Psw rd",
          style: GoogleFonts.roboto(
            color: m_colors.colorTextLight,
          ),
        ),
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.only(right: 16),
            child: IconButton(
                iconSize: 24,
                color: m_colors.colorTextLight,
                icon: const Icon(Icons.person_outline),
                onPressed: () => context.push('/about')),
          ),
        ],
      ),
      body: Column(
        children: <Widget>[
          Container(
            margin: EdgeInsets.all(m_dimens.defaultSpace),
            height: 160,
            decoration: BoxDecoration(
              color: m_colors.colorEnabled,
              borderRadius:
                  BorderRadius.all(Radius.circular(m_dimens.roundedCorner)),
            ),
            padding:
                EdgeInsets.symmetric(horizontal: m_dimens.paddingHorizontal),
            alignment: const Alignment(0, 0),
            child: Text(
              context.select((PasswordCubit cubit) => cubit.state.password),
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 30,
                  color: m_colors.colorTextDark),
            ),
          ),
          //https://medium.com/flutter-community/flutter-sliders-demystified-4b3ea65879c
          SliderTheme(
            data: SliderTheme.of(context).copyWith(
                activeTrackColor: m_colors.colorEnabled,
                trackHeight: m_dimens.heightSlider * 1.1,
                inactiveTrackColor: m_colors.colorDisabled,
                thumbColor: m_colors.colorEnabled,
                thumbShape: CustomSliderThumbCircle(
                    thumbRadius: m_dimens.heightSlider,
                    value: context
                        .select((PasswordCubit cubit) => cubit.state.length))),
            child: Slider(
                min: 8.0,
                max: 32.0,
                divisions: 20,
                value: context.select(
                    (PasswordCubit cubit) => cubit.state.length.toDouble()),
                onChanged: (double value) =>
                    context.read<PasswordCubit>().changeLength(value.toInt())),
          ),
          SizedBox(
            height: m_dimens.defaultSpace,
          ),
          Padding(
            padding:
                EdgeInsets.symmetric(horizontal: m_dimens.paddingHorizontal),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              mainAxisSize: MainAxisSize.max,
              children: [
                OptionButton(
                  title: "Uppercase",
                  description: "ABC",
                  icon: Icons.title,
                  active: context.select(
                      (PasswordCubit cubit) => cubit.state.withUppercase),
                  callback: () =>
                      context.read<PasswordCubit>().changeUppercase(),
                ),
                SizedBox(
                  width: m_dimens.defaultSpace,
                ),
                OptionButton(
                    title: "Lowercase",
                    description: "abc",
                    icon: Icons.format_size,
                    active: context.select(
                        (PasswordCubit cubit) => cubit.state.withLowercase),
                    callback: () =>
                        context.read<PasswordCubit>().changeLowercase()),
              ],
            ),
          ),
          SizedBox(
            height: m_dimens.defaultSpace,
          ),
          Padding(
            padding:
                EdgeInsets.symmetric(horizontal: m_dimens.paddingHorizontal),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              mainAxisSize: MainAxisSize.max,
              children: [
                OptionButton(
                    title: "Numbers",
                    description: "123",
                    icon: Icons.looks_one,
                    active: context.select(
                        (PasswordCubit cubit) => cubit.state.withNumbers),
                    callback: () =>
                        context.read<PasswordCubit>().changeNumbers()),
                SizedBox(
                  width: m_dimens.defaultSpace,
                ),
                OptionButton(
                    title: "Special",
                    description: "@£*",
                    icon: Icons.star,
                    active: context.select(
                        (PasswordCubit cubit) => cubit.state.withSpecial),
                    callback: () =>
                        context.read<PasswordCubit>().changeSpecial()),
              ],
            ),
          ),
          Expanded(
            child: Container(),
          ),
          BlocConsumer<PasswordCubit, PasswordState>(
            listener: (context, state) {},
            builder: (context, state) {
              return Padding(
                padding:
                    EdgeInsets.symmetric(horizontal: m_dimens.paddingHorizontal),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    ActionButton(
                      text: "Copy",
                      icon: Icons.copy,
                      isMain: false,
                      callback: () => _copyToClipboard(state.password),
                    ),
                    SizedBox(
                      height: m_dimens.defaultSpace,
                    ),
                    ActionButton(
                      text: "Generate",
                      icon: Icons.sync,
                      isMain: true,
                      callback: () =>
                          context.read<PasswordCubit>().updatePassword(),
                    ),
                  ],
                ),
              );
            },
          ),
          SizedBox(
            height: m_dimens.hugeSpace,
          ),
        ],
      ),
    );
  }
}
