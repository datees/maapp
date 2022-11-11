import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:moriapp/custom.dart';

class GeneratePassword extends StatefulWidget {
  const GeneratePassword({super.key});

  @override
  _GeneratePasswordState createState() => _GeneratePasswordState();
}

class _GeneratePasswordState extends State<GeneratePassword> {
  final _controller = TextEditingController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: Colors.cyan,
          title: const Text('Flutter Generate Random Password'),
        ),
        body: Container(
          padding: const EdgeInsets.all(32),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                children: const [
                  Text(
                    "Generate Strong Random Password",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              const SizedBox(
                height: 15,
              ),
              TextFormField(
                controller: _controller,
                readOnly: true,
                enableInteractiveSelection: false,
                decoration: InputDecoration(
                    focusedBorder: const OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.cyan,
                      ),
                    ),
                    enabledBorder: const OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.cyan),
                    ),
                    suffixIcon: IconButton(
                        onPressed: () {
                          final data = ClipboardData(text: _controller.text);
                          Clipboard.setData(data);

                          const snackBar =
                              SnackBar(content: Text("Password Copy"));

                          ScaffoldMessenger.of(context)
                            ..removeCurrentSnackBar()
                            ..showSnackBar(snackBar);
                        },
                        icon: const Icon(Icons.copy))),
              ),
              const SizedBox(
                height: 15,
              ),
              buildButtonWidget()
            ],
          ),
        ),
      );

  Widget buildButtonWidget() {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(primary: Colors.black),
        onPressed: () {
          final password = generatePassword();
          _controller.text = password;
        },
        child: const Text(
          "Password Generate",
          style: TextStyle(color: Colors.white),
        ));
  }
}
