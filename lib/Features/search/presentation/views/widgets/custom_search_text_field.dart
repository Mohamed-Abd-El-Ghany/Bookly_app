import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CustomSearchTextField extends StatefulWidget {
  const CustomSearchTextField({
    super.key,
    this.onChanged,
    this.onPressed,
    this.onSubmitted,
  });

  final void Function(String)? onChanged;
  final void Function()? onPressed;
  final Function(String)? onSubmitted;

  @override
  CustomSearchTextFieldState createState() => CustomSearchTextFieldState();
}

class CustomSearchTextFieldState extends State<CustomSearchTextField> {
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: _controller,
      onSubmitted: widget.onSubmitted,
      onChanged: widget.onChanged,
      decoration: InputDecoration(
        enabledBorder: buildOutlineInputBorder(),
        focusedBorder: buildOutlineInputBorder(),
        hintText: 'Search',
        suffixIcon: IconButton(
          onPressed: () {
            if (widget.onPressed != null) {
              widget.onPressed!();
            }
            widget.onSubmitted?.call(_controller.text);
          },
          icon: const Icon(
            FontAwesomeIcons.magnifyingGlass,
            size: 22,
          ),
        ),
      ),
    );
  }

  OutlineInputBorder buildOutlineInputBorder() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: const BorderSide(color: Colors.white),
    );
  }
}
