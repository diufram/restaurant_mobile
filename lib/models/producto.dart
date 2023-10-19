class Producto {
  String nombre;
  double precio;
  String imagenPath;
  String descripcion;

  // CONSTRUCTOR
  Producto(
      {required this.nombre,
      required this.precio,
      required this.imagenPath,
      required this.descripcion});
  String get _nombre => nombre;
  double get _precio => precio;
  String get _imagenPath => imagenPath;
  String get _descripcion => descripcion;
}
