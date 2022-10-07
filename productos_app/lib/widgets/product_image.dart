import 'package:flutter/material.dart';

class ProductImage extends StatelessWidget {
  const ProductImage({super.key, this.productUrl});

  final String? productUrl;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10, right: 10, top: 10),
      child: Container(
        decoration: _buildBoxDecoration(),
        width: double.infinity,
        height: 450,
        child: Opacity(
          opacity: 0.9,
          child: ClipRRect(
            borderRadius: const BorderRadius.only(topLeft: Radius.circular(45), topRight: Radius.circular(45)),
            child: productUrl == null
              ? const Image(
                  image: AssetImage('assets/no-image.png'),
                  fit: BoxFit.cover
                  )
              : FadeInImage(
                  placeholder: const AssetImage('assets/jar-loading.gif'), 
                 image: NetworkImage(productUrl!),
                 fit: BoxFit.cover,
                ),
          ),
        ),
      ),
    );
  }

  BoxDecoration _buildBoxDecoration(){
    return BoxDecoration(
      color: Colors.black,
      borderRadius: const BorderRadius.only(topLeft: Radius.circular(45), topRight: Radius.circular(45)),
      boxShadow: [
        BoxShadow(
          color: Colors.black.withOpacity(0.05),
          blurRadius: 10,
          offset: const Offset(0, 5)
      )]
    );
  }
}