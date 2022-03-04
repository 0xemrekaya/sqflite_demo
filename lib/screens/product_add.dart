import 'package:flutter/material.dart';
import 'package:sqflite_demo/data/dbHelper.dart';
import 'package:sqflite_demo/models/product.dart';

class ProductAdd extends StatefulWidget{
  @override
  State<StatefulWidget> createState(){
    return ProductAddState();
  }
}

class ProductAddState extends State{
  var dbHelper= DbHelper();
  TextEditingController txtName= TextEditingController();
  TextEditingController txtDescription= TextEditingController();
  TextEditingController txtUnitPrice= TextEditingController();

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text("Yeni Ürün Ekle."),
      ),
      body: Padding(
        padding: EdgeInsets.all(30.0),
        child: Column(
          children: <Widget>[
            buildNameField(),buildDescriptionField(),buildUnitPrice()
            ,buildSaveButton(),
          ],
        ),
      ),
    );
  }

  Widget buildNameField() {
    return TextField(
      decoration: InputDecoration(labelText: "Ürün adı"),
      controller: txtName,
    );
  }

  buildDescriptionField() {
    return TextField(
      decoration: InputDecoration(labelText: "Ürün Açıklaması"),
      controller: txtDescription,
    );
  }

  buildUnitPrice() {
    return TextField(
      decoration: InputDecoration(labelText: "Ürün Fiyatı"),
      controller: txtUnitPrice,
    );
  }
  buildSaveButton(){
    return FlatButton(
      child: Text("Ekle"),
      onPressed: (){
        addProduct();
      },
    );
  }

  void addProduct() async{
   var result= await dbHelper.insert(Product(txtName.text, txtDescription.text, double.tryParse(txtUnitPrice.text)!));
   Navigator.pop(context , true);

  }


  
}
