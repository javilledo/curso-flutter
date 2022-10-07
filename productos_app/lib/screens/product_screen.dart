import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:productos_app/provider/product_form_provider.dart';

import 'package:productos_app/services/services.dart';
import 'package:productos_app/ui/input_decorations.dart';
import 'package:productos_app/widgets/widgets.dart';
import 'package:provider/provider.dart';

class ProductScreen extends StatelessWidget {
   
  const ProductScreen({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {

    final productService = Provider.of<ProductsService>(context);

    return ChangeNotifierProvider(
      create: (context) => ProductFormProvider(productService.selectedProduct!),
      child: _ProductsScreenBody(productService: productService),
    );

  }
}

class _ProductsScreenBody extends StatelessWidget {
  const _ProductsScreenBody({
    Key? key,
    required this.productService,
  }) : super(key: key);

  final ProductsService productService;

  @override
  Widget build(BuildContext context) {

    final productForm = Provider.of<ProductFormProvider>(context);

    return Scaffold(
      body: SingleChildScrollView(
        keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
        child: Column(
          children: [

            Stack(
              children: [
                ProductImage(productUrl: productService.selectedProduct?.picture,),
                Positioned(
                  top: 60,
                  left: 20,
                  child: IconButton(
                    onPressed: () => Navigator.of(context).pop(), 
                    icon: const Icon(Icons.arrow_back_ios_new, size: 40, color: Colors.white)),
                ),
                Positioned(
                  top: 60,
                  right: 20,
                  child: IconButton(
                    onPressed: () {}, // TODO: Cámara o galería 
                    icon: const Icon(Icons.camera_alt_outlined, size: 40, color: Colors.white)),
                ),

              ]
            ),

            const _ProductForm(),

            const SizedBox(height: 100)

          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.save_outlined),
        onPressed: () async {
          if(!productForm.isValidForm()) return;
          await productService.saveOrCreateProduct(productForm.product);
          //TODO: Guardar producto
        }),
    );
  }
}

class _ProductForm extends StatelessWidget {
  const _ProductForm({Key? key,}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final productForm = Provider.of<ProductFormProvider>(context);
    final product = productForm.product;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        width: double.infinity,
        decoration: _buildBoxDecoration(),
        child: Form(
          key: productForm.formKey,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          child: Column(
            children: [

              const SizedBox(height: 10),

              TextFormField(
                initialValue: product.name,
                onChanged: (value) => product.name = value,
                validator: (value) {
                  if( value == null || value.isEmpty) {
                    return 'El nombre es obligatorio';
                  }
                },
                decoration: InputDecorations.authInputDecorations(
                  hintText: 'Nombre del producto', 
                  labelText: 'Nombre:',
                ),
              ),

              const SizedBox(height: 30),

              TextFormField(
                initialValue: '${product.price}',
                inputFormatters: [
                  FilteringTextInputFormatter.allow(RegExp(r'^(\d+)?\.?\d{0,2}'))
                ],
                onChanged: (value){
                  if( double.tryParse(value) == null){
                    product.price = 0;
                  } else {
                    product.price = double.parse(value);
                  }
                },
                keyboardType: TextInputType.number,
                decoration: InputDecorations.authInputDecorations(
                  hintText: '\$150', 
                  labelText: 'Precio:'
                ),
              ),

              const SizedBox(height: 30),

              SwitchListTile.adaptive(
                value: product.available, 
                title: const Text('Disponible'),
                activeColor: Colors.indigo,
                onChanged: productForm.updateAvailability //Como el valor que se recibe es el mismo que se envía, puede ponerse únicamente el nombre de la función
              ),

              const SizedBox(height: 30),

            ],
          )),
      ),
    );
  }

  BoxDecoration _buildBoxDecoration() => BoxDecoration(
    color: Colors.white,
    borderRadius: const BorderRadius.only(bottomRight: Radius.circular(25), bottomLeft: Radius.circular(25)),
    boxShadow: [
      BoxShadow(
        color: Colors.black.withOpacity(0.05),
        offset: const Offset(0, 5),
        blurRadius: 5
      )
    ]
  );
}