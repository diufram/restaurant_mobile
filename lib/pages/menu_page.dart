import 'package:e_comerce/components/button_intro.dart';
import 'package:e_comerce/models/carrito.dart';
import 'package:e_comerce/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import '../components/comida_title.dart';
import '../data/respositories/compras_respository.dart';
import 'dealles_producto_page.dart';

class MenuPage extends StatefulWidget {
  const MenuPage({super.key});

  @override
  State<MenuPage> createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Provider.of<Carrito>(context, listen: false).getMenu();
    });
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Provider.of<Compra>(context, listen: false).getCompras();
    });
    super.initState();
  }

  // NAVEGADOR AL ITEM DE LA COMIDA
  void irDetallesComida(int index) {
    final carrito = context.read<Carrito>();
    final menuComidas = carrito.menu;

    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => DetallesComida(
                  comida: menuComidas[index],
                )));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.grey[800],
        elevation: 0,
        leading: Builder(
          builder: (context) => IconButton(
            icon: const Icon(
              Icons.menu,
            ),
            onPressed: () {
              Scaffold.of(context).openDrawer();
            },
          ),
        ),
        title: const Text(
          'SANTA CRUZ',
        ),
        actions: [
          // BOTON CARRITO
          IconButton(
              onPressed: () {
                Navigator.pushNamed(context, '/carritopage');
              },
              icon: const Icon(Icons.shopping_cart))
        ],
      ),
      drawer: Drawer(
        backgroundColor: secundaryColor,
        child: Column(
          children: [
            //LOGO
            DrawerHeader(
                child: Image.asset(
              'lib/images/icono.png',
            )),

            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 25.0),
              child: Divider(
                color: Colors.grey,
              ),
            ),

            //OTRAS PAGINAS

            const Padding(
              padding: EdgeInsets.only(left: 25.0),
              child: ListTile(
                leading: Icon(
                  Icons.home,
                  color: Colors.white,
                ),
                title: Text(
                  'Home',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),

            //
            const Padding(
              padding: EdgeInsets.only(left: 25.0),
              child: ListTile(
                leading: Icon(
                  Icons.logout,
                  color: Colors.white,
                ),
                title: Text(
                  'Logout',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 25.0),
              child: ListTile(
                  leading: const Icon(
                    Icons.shop,
                    color: Colors.white,
                  ),
                  title: const Text(
                    'Compras',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                  onTap: () {
                    Navigator.pushNamed(context, '/compraspage');
                  }),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 25.0),
              child: ListTile(
                  leading: const Icon(
                    Icons.calendar_today,
                    color: Colors.white,
                  ),
                  title: const Text(
                    'Reserva',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                  onTap: () {
                    Navigator.pushNamed(context, '/reservapage');
                  }),
            )
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 1),
        child: SingleChildScrollView(
          child: Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // PROMOCION
                Container(
                  decoration: BoxDecoration(
                      color: primaryColor,
                      borderRadius: BorderRadius.circular(20)),
                  margin: const EdgeInsets.symmetric(horizontal: 25),
                  padding:
                      const EdgeInsets.symmetric(vertical: 25, horizontal: 30),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // MENSAJE DE PROMOCION
                            Text(
                              'Nueva Promocion 50%',
                              style: GoogleFonts.dmSerifDisplay(
                                  fontSize: 20, color: Colors.white),
                            ),
                            const SizedBox(
                              height: 25,
                            ),

                            // BOTON
                            MyButtonI(text: 'Leer', onTap: () {})
                          ],
                        ),
                      ),
                      Expanded(
                        child: Image.asset(
                          'lib/images/majadito.png',
                          height: 100,
                        ),
                      )
                    ],

                    //
                  ),
                ),
                const SizedBox(
                  height: 25,
                ),

                // BARRA DE BUSQUDA

                Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25.0),
                    child: TextField(
                      decoration: InputDecoration(
                          focusedBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                color: Colors.white,
                              ),
                              borderRadius: BorderRadius.circular(20)),
                          enabledBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                color: Colors.white,
                              ),
                              borderRadius: BorderRadius.circular(20)),
                          hintText: "BUSCA AQUI.."),
                    )),
                const SizedBox(
                  height: 25,
                ),

                // MENU

                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: Text(
                    "Menu de Comidas",
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.grey[((800))]),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),

                SizedBox(
                    width: MediaQuery.of(context).size.width - 30,
                    height: 250,
                    child: Consumer<Carrito>(
                      builder: (context, value, child) {
                        if (value.isLoading) {
                          return const Center(
                            child: CircularProgressIndicator(),
                          );
                        }
                        final menu = value.menu;
                        return ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: menu.length,
                          itemBuilder: (context, index) => ComidaTitulo(
                            comida: menu[index],
                            onTap: () => irDetallesComida(index),
                          ),
                        );
                      },
                    )),
                const SizedBox(
                  height: 25,
                ),
                // COMIDAS POPULARES

                Container(
                  height: 130,
                  decoration: BoxDecoration(
                      color: Colors.grey[100],
                      borderRadius: BorderRadius.circular(20)),
                  margin:
                      const EdgeInsets.only(left: 25, right: 25, bottom: 25),
                  padding: const EdgeInsets.all(20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Row(
                        children: [
                          // IMAGEN
                          Image.asset(
                            'lib/images/picante.png',
                            height: 90,
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          // NOMBRE Y PRECIO
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              // NOMBRE
                              Text(
                                "PICANTE DE POLLO",
                                style: GoogleFonts.dmSerifDisplay(fontSize: 15),
                              ),
                              const SizedBox(
                                height: 5,
                              ),

                              // PRECIO
                              Text(
                                '\$ 55.0',
                                style: TextStyle(color: Colors.grey[700]),
                              ),
                            ],
                          ),
                        ],
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      const Icon(
                        Icons.favorite_outline,
                        color: Colors.grey,
                        size: 28,
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
