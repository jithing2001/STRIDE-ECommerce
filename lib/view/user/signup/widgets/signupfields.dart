import 'package:ecommerce/constants.dart';
import 'package:flutter/material.dart';

class SignupFields extends StatefulWidget {
  String? title;
  String? hint;
  TextEditingController controller = TextEditingController();
  bool? isSuffix;
  SignupFields(
      {super.key,
      required this.title,
      required this.hint,
      required this.controller,
      this.isSuffix = false});

  @override
  State<SignupFields> createState() => _SignupFieldsState();
}

class _SignupFieldsState extends State<SignupFields> {
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
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '${widget.title}',
            style: const TextStyle(fontSize: 17, fontWeight: FontWeight.w500),
          ),
          TextFormField(
            obscureText: (widget.isSuffix!) ? !_passwordVisible : false,
            controller: widget.controller,
            decoration: InputDecoration(
                hintText: widget.hint,
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
          kheight10
        ],
      ),
    );
  }
}
