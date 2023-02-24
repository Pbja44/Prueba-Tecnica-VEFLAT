import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/categoria.dart';

class CategoriaItemGrid extends StatelessWidget {
  final bool select;
  const CategoriaItemGrid(this.select, {super.key});

  @override
  Widget build(BuildContext context) {
    final categoria = Provider.of<Categoria>(context, listen: false);

    return Card(
      color: select ? Colors.black : const Color.fromARGB(255, 253, 253, 253),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Container(
        alignment: Alignment.center,
        child: Text(
          categoria.nombre,
          style: TextStyle(
            fontSize: 15,
            color: select ? Colors.white : Colors.black,
          ),
        ),
      ),
    );
  }
}
