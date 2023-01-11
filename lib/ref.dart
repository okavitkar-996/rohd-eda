import 'dart:convert';
import 'dart:io';
import 'package:xml/xml.dart';
import 'package:xml2json/xml2json.dart';

class Port {
  String name = "N/A";
  String direction = "N/A";
  String left_point = "N/A";
  String right_point = "N/A";

  Port(String a, String b, String c, String d) {
    this.name = a;
    this.direction = b;
    this.left_point = c;
    this.right_point = d;
  }
}

class Component {
  String name = "None";
  String vendor = "None";
  String library = "None";
  String version = "0";

  var null_name = "None";
  var direct = "None";
  var left = "";
  var right = "";
  var ports;
  Map fileSet = {};

  Component(String x, String y, String q, String w, List<Port> ports, Map b) {
    this.name = x;
    this.vendor = y;
    this.library = q;
    this.version = w;
    this.ports = ports;
    this.fileSet = b;
  }
}

void ref(String file) {
  Map directions = {"in": "input", "out": "output"};

  File xml_file = File(file);

  final xmlString = xml_file.readAsStringSync();
  final document = XmlDocument.parse(xmlString);

  final vendor = document.findAllElements('ipxact:vendor');
  final library = document.findAllElements('ipxact:library');
  final name = document.findAllElements('ipxact:name');
  final version = document.findAllElements('ipxact:version');

  var ports = document.findAllElements('ipxact:port');

  var portss = ports.toString();
  var null_name = "None";
  var direct = "None";
  var left = "N/A";
  var right = "N/A";
  List<Port> ports_xml =
      List.filled(ports.length, Port(null_name, direct, left, right));

  for (var i = 0; i < ports.length; i = i + 1) {
    var name = ports.elementAt(i).getElement('ipxact:name')?.text;

    if (name != null) {
      ports_xml.elementAt(i).name = name;
    }
    // = null_name;

    var wire = ports.elementAt(i).getElement('ipxact:wire');
    var direction = wire?.getElement('ipxact:direction')?.innerText;

    if (direction != null) {
      ports_xml.elementAt(i).direction = direction;
    }

    var left = wire
        ?.getElement('ipxact:vectors')
        ?.getElement('ipxact:vector')
        ?.getElement('ipxact:left')
        ?.innerText;
    //var ll;
    if (left != null) {
      ports_xml.elementAt(i).left_point = left;
    }

    var right = wire
        ?.getElement('ipxact:vectors')
        ?.getElement('ipxact:vector')
        ?.getElement('ipxact:right')
        ?.innerText;
    //var rr;
//var ll;
    if (right != null) {
      ports_xml.elementAt(i).right_point = (right as String);
    }

    //  rr = right;

  }
  // var xml2json0 = Xml2Json();
  //var pp = ports.findAllElements('ipxact:port');
//  print(pp.length);
  // for (var i in pp) {
  //  print(i);
  //}

//  xml2json0.parse(ports.toString());
//  var xmlMapP = xml2json0.toBadgerfish();
//  Map portMap = json.decode(xmlMapP);

//  var ap = portMap["ipxact:ports"];

//  print(portMap);

  /*
  for (var i in portMap.values) {
    print(i);
    print("\n");
  }

  final fileSets = document.findAllElements('ipxact:fileSets');

  var xml2json = Xml2Json();

  xml2json.parse(fileSets.toString());
  var xmlMapO = xml2json.toGData();

  Map valueMap = json.decode(xmlMapO);

  var files = xmlMapO;

  
  print(files);
  for (var fle in files.values) {
  print(fle);
  print("\n");
  }
*/
  Component bb = new Component(name.first.text, vendor.first.text,
      library.first.text, version.first.text, ports_xml, {});
}
