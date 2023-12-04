import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:homepage/widget/category.dart';
import 'package:homepage/widget/furniture.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:homepage/widget/home_header.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<Map<String, String>> imageList = [
    {'assetPath': 'assets/images/slider1.png'},
    {'assetPath': 'assets/images/slider1.png'},
    {'assetPath': 'assets/images/slider1.png'},
  ];

  String searchText = '';

  List<Furniture> filteredFurnitureList = [
    Furniture(
      imagePath: "assets/kursi_hijau.jpg",
      nameProduct: "KURSI HIJAU",
      harga: "Rp 120.000,00",
    ),
    Furniture(
      imagePath: "assets/kursi_putih.jpg",
      nameProduct: "KURSI PUTIH",
      harga: "Rp 120.000,00",
    ),
    Furniture(
      imagePath: "assets/meja.jpg",
      nameProduct: "MEJA KAYU",
      harga: "Rp 180.000,00",
    ),
    Furniture(
      imagePath: "assets/pintu_kayu.png",
      nameProduct: "PINTU KAYU",
      harga: "Rp 180.000,00",
    ),
  ];

  List<Furniture> getFilteredFurnitureList() {
    return filteredFurnitureList.where((furniture) {
      final name = furniture.nameProduct.toLowerCase();
      final searchLowerCase = searchText.toLowerCase();
      return name.contains(searchLowerCase);
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background Image
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/Background_homepage.png'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          SingleChildScrollView(
            child: SafeArea(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Stack(
                    children: <Widget>[
                      Container(
                        height: 78,
                        width: double.infinity,
                        color: Color.fromRGBO(158, 179, 132, 5),
                      ),
                      HomeHeader(),
                    ],
                  ),
                  buildSliderSection(),
                  buildCategorySection(),
                  buildFurnitureGridSection(),
                ],
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: buildBottomNavigationBar(),
    );
  }


  Widget buildBottomNavigationBar() {
    return BottomNavigationBar(
      backgroundColor: const Color.fromRGBO(206, 222, 189, 5),
      selectedItemColor: const Color.fromRGBO(67, 83, 52, 5),
      unselectedItemColor: const Color.fromRGBO(67, 83, 52, 5),
      selectedIconTheme:
          IconThemeData(color: const Color.fromRGBO(67, 83, 52, 5), size: 32),
      unselectedIconTheme: IconThemeData(
          color: const Color.fromRGBO(250, 241, 228, 5), size: 30),
      selectedFontSize: 12,
      unselectedFontSize: 10,
      type: BottomNavigationBarType.fixed,
      unselectedLabelStyle: GoogleFonts.inter(fontWeight: FontWeight.bold),
      selectedLabelStyle: GoogleFonts.inter(fontWeight: FontWeight.bold),
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.help_outline),
          label: "ABOUT",
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.assignment),
          label: "PESANAN",
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.account_circle_outlined),
          label: "PROFIL",
        ),
      ],
    );
  }

  Widget buildSliderSection() {
    return SizedBox(
      height: 250,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25),
        child: CarouselSlider(
          options: CarouselOptions(
            autoPlay: true,
            enlargeCenterPage: true,
            enableInfiniteScroll: true,
            aspectRatio: 16 / 9,
            viewportFraction: 1,
          ),
          items: imageList.map((item) {
            return Builder(
              builder: (BuildContext context) {
                return Container(
                  width: MediaQuery.of(context).size.width,
                  margin:
                      const EdgeInsets.symmetric(vertical: 15, horizontal: 9),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: const [
                      BoxShadow(
                        offset: Offset(3, 3),
                        spreadRadius: 3,
                        blurRadius: 3,
                        color: Colors.grey,
                      )
                    ],
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.asset(
                      item['assetPath']!,
                      fit: BoxFit.cover,
                      width: double.infinity,
                    ),
                  ),
                );
              },
            );
          }).toList(),
        ),
      ),
    );
  }

  Widget buildCategorySection() {
    return Column(
      children: [
        SizedBox(
          height: 95,
          child: Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Category(
                    imagePath: "assets/pintu.png",
                    title: "PINTU",
                    showBorder: true,
                  ),
                  SizedBox(width: 10),
                  Category(
                    imagePath: "assets/kasur.png",
                    title: "RUANG TIDUR",
                    showBorder: true,
                  ),
                  SizedBox(width: 10),
                  Category(
                    imagePath: "assets/lemari.png",
                    title: "LEMARI",
                    showBorder: true,
                  ),
                  SizedBox(width: 10),
                  Category(
                    imagePath: "assets/dapur.png",
                    title: "ALAT DAPUR",
                    showBorder: true,
                  ),
                ],
              ),
            ),
          ),
        ),
        SizedBox(height: 30),
      ],
    );
  }

  Widget buildFurnitureGridSection() {
    return SizedBox(
      height: 350,
      child: GridView.count(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        crossAxisCount: 2,
        padding: EdgeInsets.symmetric(horizontal: 35),
        crossAxisSpacing: 20,
        mainAxisSpacing: 20,
        children: getFilteredFurnitureList().map((furniture) {
          return Furniture(
            imagePath: furniture.imagePath,
            nameProduct: furniture.nameProduct,
            harga: furniture.harga,
          );
        }).toList(),
      ),
    );
  }
}
