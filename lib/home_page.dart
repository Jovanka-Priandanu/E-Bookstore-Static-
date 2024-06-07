// import package
import 'package:flutter/material.dart';
// import carousel effect slider & shared preferences dari dependencies
import 'package:carousel_slider/carousel_slider.dart';
import 'package:shared_preferences/shared_preferences.dart';
// import file
import 'data.dart';
import 'account.dart';
import 'store.dart';
import 'product.dart';
import 'library.dart';

// class utama
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Reffvision E-Book Store',
      // home menuju class HomePage
      home: HomePage(),
    );
  }
}

// state homepage
class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

// class state yang di extends dari class homepage
class _HomePageState extends State<HomePage> {
  // variabel untuk index Bottom button navigation (index 0 Home, 1 Store, 2 library, 3 Profile)
  int _selectedIndex = 0;
  // array untuk menyimpan produk yang di wishlist
  List<AllBook> wishlist = [];
  // array untuk menyimpan produk yang di masukkan ke cart
  List<AllBook> cart = [];

  // Route untuk BottomNavigationBar
  static List<Widget> _widgetOptions = <Widget>[
    HomeScreen(),
    Store(),
    LibraryPage(),
    Account(),
  ];

  // fungsi click pada tombol BottomNavigationBar, dengan parameter int
  void _onItemTapped(int index) {
    // membuat state
    setState(() {
      // membuat index pada variabel _selectedIndex menyesuaikan pada index _onItemTapped (halaman yang di click)
      _selectedIndex = index;
    });
  }

  // menarik data username dari Shared preferences (dari login)
  Future<String?> getUsername() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString('username');
  }

  // tampilan utama HomePage
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // membuat agar appbar tidak dobel di menu lain (jadi appbar homepage hanya di homepage saja (index 0))
      appBar: _selectedIndex == 0
          ? AppBar(
        title: FutureBuilder<String?>(
          // menarik data username
          future: getUsername(),
          builder: (context, snapshot) {
            // jika data username masih waiting
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Text('Home');
            //   jika data username error
            } else if (snapshot.hasError) {
              return Text('Error');
            //   jika data ditarik dari sharedpreference tanpa masalah
            } else {
              String username = snapshot.data ?? '';
              return Text('Hello $username, lagi mau cari buku apa nih?',
                  style: TextStyle(color: Colors.white, fontSize: 14));
            }
          },
        ),
        backgroundColor: Colors.red,
      )
          : null,

      // Navbar bottom berdasarkan route _widgetOptions dan _selectedIndex daat menu ditekan
      body: _widgetOptions.elementAt(_selectedIndex),
      // tombol navbar
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          // Index 0
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          // Index 1
          BottomNavigationBarItem(
            icon: Icon(Icons.store),
            label: 'Book-Store',
          ),
          // Index 2
          BottomNavigationBarItem(
            icon: Icon(Icons.shelves),
            label: 'Library',
          ),
          // Index 3
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
        // set home sebagai index awal
        currentIndex: _selectedIndex,
        // set agar tombol yang click akan berwarna merah
        selectedItemColor: Colors.red,
        // sedangkan yang tidak akan berwarna abu
        unselectedItemColor: Colors.grey,
        // buat agar saat di click akan menyesuaikan index
        onTap: _onItemTapped,
      ),
    );
  }
}

// state HoemScreen
class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

// tampilan utama HomeScreen
class _HomeScreenState extends State<HomeScreen> {
  // menarik data buku dari darray BookList yang ada di file data.dart
  final BookList bookList = BookList();
  // membuat array untuk menyimpan produk pada wishlist
  List<AllBook> wishlist = [];

  // fungsi click pada wishlist pada menu Produk nanti
  void toggleWishlist(AllBook book) {
    setState(() {
      if (wishlist.contains(book)) {
        wishlist.remove(book);
      } else {
        wishlist.add(book);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    // menarik data bookList dan currency format dari data.dart
    final books = bookList.getBooks();
    final currencyFormat = bookList.getCurrencyFormat();

    // scrolling pada Carousel abnner
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // carousel slider
          CarouselSlider(
            // settingan carousel
            options: CarouselOptions(
              height: 200.0,
              // buat agar gambar yang muncul ditengah akan lebih besar
              enlargeCenterPage: true,
              // membuat slide otomatis
              autoPlay: true,
              // ukuran gambar
              aspectRatio: 16 / 9,
              // animasi
              autoPlayCurve: Curves.fastOutSlowIn,
              // membuat slide loop
              enableInfiniteScroll: true,
              // kecepatan slide
              autoPlayAnimationDuration: Duration(milliseconds: 900),
              // ukuran container gambar
              viewportFraction: 0.8,
            ),
            // item yang di tampilkan carousel
            items: [
              'assets/images/Hamlet-banner.png',
              'assets/images/3book-banner.png',
              'assets/images/mobydick-banner.png'
            ].map((imagePath) {
              // settingan tambahan untuk gambar
              return Container(
                margin: EdgeInsets.all(5.0),
                decoration: BoxDecoration(
                  // membuat bordernya tumpul
                  borderRadius: BorderRadius.circular(8.0),
                  image: DecorationImage(
                    image: AssetImage(imagePath),
                    // membuat gambar mencover container carouselnya sesuai ukuran
                    fit: BoxFit.cover,
                  ),
                ),
              );
            }).toList(),
          ),

          // section rekomendasi produk
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text('Best Seller',
                    style:
                    TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              ],
            ),
          ),
          // tampilan produk rekomendasi
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              // membuat agar tampilan produk rekomendasi hanya menampilkan 3 buku dari index
              children: books.take(3).map((book) {
                // membuat produk dapat di click
                return GestureDetector(
                  onTap: () {
                    // saat di click akan berpindah ke halaman ProductPage pada file product..dart
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ProductPage(
                          book: book,
                          toggleWishlist: () => toggleWishlist(book),
                          isInWishlist: wishlist.contains(book),
                          toggleCart: () {
                            // Implementasi toggle cart di halaman utama (HomeScreen)
                          },
                          isInCart: false, // Implementasi status cart di halaman utama (HomeScreen)
                        ),
                      ),
                    );
                  },
                  //tampilan product page rekomendasi (best seller di homepage)
                  child: Container(
                    width: 150,
                    margin: EdgeInsets.fromLTRB(4, 0, 4, 40),
                    child: Card(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // menampilkan image dari data array book (data.dart)
                          Container(
                            height: 150,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(4),
                                topRight: Radius.circular(4),
                              ),
                              image: DecorationImage(
                                image: AssetImage(book.image),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          // menampilkan title dari data array book (data.dart)
                          Padding(
                            padding: const EdgeInsets.all(15.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  height: 20,
                                  child: Text(book.title,
                                      style: TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.bold)),
                                ),
                                // menampilkan nama penulis dari data array book (data.dart)
                                Container(
                                  height: 20,
                                  child: Text(book.author,
                                      style: TextStyle(fontSize: 12)),
                                ),
                                // menampilkan harga dari data array book (data.dart)
                                SizedBox(height: 8.0),
                                Container(
                                  height: 20,
                                  child: Text(
                                      currencyFormat.format(book.price),
                                      style: TextStyle(
                                          color: Colors.red, fontSize: 13)),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              }).toList(),
            ),
          ),

          // section banner promosi (tambahan aja biar gk sepi)
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text('Penawaran Terbatas!',
                    style:
                    TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                Container(
                  height: 200,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    image: DecorationImage(
                      image: AssetImage('assets/images/atomic-promo.png'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ],
            ),
          ),

          // section carousel lagi (copasan dari carousel atas)
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text('Informasi Menarik Lainnya!',
                    style:
                    TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              ],
            ),
          ),
          CarouselSlider(
            options: CarouselOptions(
              height: 200.0,
              enlargeCenterPage: true,
              autoPlay: true,
              aspectRatio: 16 / 9,
              autoPlayCurve: Curves.fastOutSlowIn,
              enableInfiniteScroll: true,
              autoPlayAnimationDuration: Duration(milliseconds: 900),
              viewportFraction: 0.8,
            ),
            items: [
              'assets/images/Hamlet-banner.png',
              'assets/images/3book-banner.png',
              'assets/images/mobydick-banner.png'
            ].map((imagePath) {
              return Container(
                margin: EdgeInsets.all(5.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.0),
                  image: DecorationImage(
                    image: AssetImage(imagePath),
                    fit: BoxFit.cover,
                  ),
                ),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}

