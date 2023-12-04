import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SearchField extends StatelessWidget {
  const SearchField({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Form(
        child: TextFormField(
          onChanged: (value) {},
          cursorColor: const Color.fromRGBO(158, 179, 132, 5),
          decoration: InputDecoration(
            filled: true,
            fillColor: Color.fromRGBO(250, 241, 228, 5),
            contentPadding:
                const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            border: searchOutlineInputBorder,
            focusedBorder: searchOutlineInputBorder,
            enabledBorder: searchOutlineInputBorder,
            hintText: "Cari produk...",
            hintStyle: GoogleFonts.poppins(color: Colors.grey),
            prefixIcon: const Icon(Icons.search),
          ),
        ),
      ),
    );
  }
}

const searchOutlineInputBorder = OutlineInputBorder(
  borderRadius: BorderRadius.all(Radius.circular(30)),
  borderSide: BorderSide.none,
);
