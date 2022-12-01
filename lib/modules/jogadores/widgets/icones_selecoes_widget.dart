import 'package:fifa_status/consts/base_url.dart';
import 'package:fifa_status/consts/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class IconeSelecaoWidget extends StatelessWidget {
  final String caminho;
  final String nome;
  final VoidCallback onTap;
  const IconeSelecaoWidget(
      {Key? key,
      required this.caminho,
      required this.onTap,
      required this.nome})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100),
          border: Border.all(color: Colors.white),
        ),
        child: ListTile(
          leading: Container(
            width: 50,
            height: 50,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(100),
              child: Image.network(
                "${BaseUrl.baseUrl}$caminho",
                fit: BoxFit.cover,
              ),
            ),
          ),
          title: Text(
            nome.toUpperCase(),
            style: TextStyles.nomePaisesHome,
          ),
        ),
      ),
    );
  }
}
