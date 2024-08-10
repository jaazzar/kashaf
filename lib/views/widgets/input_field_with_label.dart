import 'package:flutter/material.dart';

// ignore: must_be_immutable
class InpuFieldWithLabel extends StatefulWidget {
  Text hint;
  Text label;
  bool? isPassword;
  final TextEditingController controller;
  var errorText = null;
  Function? resetStoreList;

  InpuFieldWithLabel(
      {super.key,
      required this.label,
      required this.hint,
      this.isPassword = false,
      required this.controller,
      this.errorText = null,
      this.resetStoreList});

  @override
  State<InpuFieldWithLabel> createState() => _InpuFieldWithLabelState();
}

class _InpuFieldWithLabelState extends State<InpuFieldWithLabel> {
  bool _showPassword = false;

  @override
  Widget build(BuildContext context) {
    return Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              const Text(
                '*',
                style: TextStyle(
                    color: Colors.red,
                    fontWeight: FontWeight.w400,
                    fontSize: 16),
              ),
              Text(
                widget.label.data.toString(),
                style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(top: 5),
            child: SizedBox(
              child: TextField(
                obscureText: widget.isPassword! && !_showPassword,
                controller: widget.controller,
                onChanged: (value) {
                  if (widget.resetStoreList != null) {
                    widget.resetStoreList!();
                  }
                },
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.red, width: 5.0),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  hintText: widget.hint.data.toString(),
                  errorText: widget.errorText,
                  suffixIcon: widget.isPassword!
                      ? IconButton(
                          onPressed: () {
                            setState(() {
                              _showPassword = !_showPassword;
                              // print('password hide button pressed');
                            });
                          },
                          icon: Icon(
                            _showPassword
                                ? Icons.visibility
                                : Icons.visibility_off,
                            color: Colors.grey,
                          ),
                        )
                      : null,
                ),
              ),
            ),
          ),
        ]);
  }
}
