import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Furniture extends StatelessWidget {
  final String imagePath;
  final String nameProduct;
  final String harga;
  final Color backgroundColor;

  const Furniture({
    Key? key,
    required this.imagePath,
    required this.nameProduct,
    required this.harga,
    this.backgroundColor = const Color.fromRGBO(206, 222, 189, 1), // Mengubah opacity menjadi 1
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 155,
      child: Stack(
        children: [
          Positioned.fill(
            child: Container(
              decoration: BoxDecoration(
                color: backgroundColor,
                borderRadius: BorderRadius.circular(4),
                boxShadow: [
                  BoxShadow(
                    offset: Offset(1, 3),
                        spreadRadius: 1,
                        blurRadius: 5,
                        color: Colors.grey,
                  ),
                ],
              ),
              child: Column(
                children: [
                  SizedBox(
                    width: 165,
                    height: 100,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(4),
                      child: Image.asset(
                        imagePath,
                        height: 60,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            right: 0,
            left: 0,
            child: SizedBox(
              height: 50,
              child: Padding(
                padding: const EdgeInsets.all(5),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      nameProduct,
                      textAlign: TextAlign.center,
                      style: GoogleFonts.poppins(
                        fontSize: 10,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 4),
                    Text(
                      harga,
                      textAlign: TextAlign.center,
                      style: GoogleFonts.poppins(
                        fontSize: 10,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
