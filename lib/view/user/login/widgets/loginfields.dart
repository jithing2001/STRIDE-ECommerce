import 'package:ecommerce/constants.dart';
import 'package:flutter/material.dart';

class LoginFields extends StatefulWidget {
  String? title;
  String? hint;
  bool? isSuffix;
  TextEditingController controller = TextEditingController();

  LoginFields(
      {super.key,
      required this.title,
      required this.hint,
      required this.controller,
      this.isSuffix = false});

  @override
  State<LoginFields> createState() => _LoginFieldsState();
}

class _LoginFieldsState extends State<LoginFields> {
  bool _passwordVisible = true;
  @override
  void initState() {
    // TODO: implement initState

    _passwordVisible = false;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '${widget.title}',
            style: const TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
          ),
          kheight10,
          TextFormField(
            obscureText: (widget.isSuffix!) ? !_passwordVisible : false,
            controller: widget.controller,
            decoration: InputDecoration(
                suffixIcon: (widget.isSuffix!)
                    ? IconButton(
                        onPressed: () {
                          setState(() {
                            _passwordVisible = !_passwordVisible;
                          });
                        },
                        icon: (_passwordVisible)
                            ? const Icon(Icons.visibility)
                            : const Icon(Icons.visibility_off))
                    : const SizedBox(),
                hintText: '${widget.hint}',
                border: OutlineInputBorder(
                    borderSide: const BorderSide(
                      color: Colors.black,
                    ),
                    borderRadius: BorderRadius.circular(10))),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'this field is requiered';
              } else {
                return null;
              }
            },
          ),
        ],
      ),
    );
  }
}
