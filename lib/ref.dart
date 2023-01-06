//import 'package:xml2json/xml2json.dart';
import 'dart:convert';
import 'dart:io';
import 'package:xml/xml.dart';
//import 'package:xml2json/xml2json.dart';

class Component {
  String name = "None";
  String vendor = "None";
  String library = "None";
  String version = "0";
  



  Component(String x, String y, String q, String w) {
    this.name = x;
    this.vendor = y;
    this.library = q;
    this.version = w;
  }

  // Component() {
  //  this.name = "None";
  //  this.vendor = "None";
  //  this.library = "None";
  // this.version = 0;
  // }
  //Component (String name, String vendor, String library, String version)
  // {
  //   this.name = name;
  //   this.vendor = vendor;
  //   this.library = library;
  //   this.version = int.parse(version);
  // }

  //Component(this.name, this.vendor, this.library, this.version);
}

//class Port {
  //String name = "./";
  //String fileType = "None";
  //String logicalName = "None";
//}






class file_ty {
  String name = "./";
  String fileType = "None";
  String logicalName = "None";
}

class Fileset {
  String name = "./";
  String type = "None";
  String dependancty = "None";
  //String library = "None";
  //String version = "0";

}

void ref(String file) {
  File xml_file = File(file);
  

  final xmlString = xml_file.readAsStringSync();
  final document = XmlDocument.parse(xmlString);
  final vendor = document.findAllElements('ipxact:vendor');
  final library = document.findAllElements('ipxact:library');
  final name = document.findAllElements('ipxact:name');
  final version = document.findAllElements('ipxact:version');
  //final vlnv = {
  // 'library': library.first.text,
  // 'vendor': vendor.first.text,
  // 'name': name.first.text,
  // 'version': version.first.text
  //};
  List<Ports>
  Component bb = new Component(name.first.text, vendor.first.text,
      library.first.text, version.first.text);
  //print(vlnv);
  print(bb.name);
  print(bb.vendor);
  print(bb.library);
  print(bb.version);
  print("Finally");
}
