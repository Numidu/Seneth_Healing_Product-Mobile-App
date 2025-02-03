class Product {
  final String pid;
  final String pname;
  final String description;
  final String catogory;
  final String flavour;
  final String url;

  Product(
      {required this.pid,
      required this.pname,
      required this.description,
      required this.catogory,
      required this.flavour,
      required this.url});

  factory Product.fromJson(Map<String, dynamic> data) {
    return Product(
        pid: data["producttId"] ?? "",
        pname: data["productname"] ?? "",
        description: data["productdescription"] ?? "",
        catogory: data["pcatogory"] ?? "",
        flavour: data["flavour"] ?? "",
        url: data["url"] ?? "");
  }

  get name => null;
}
