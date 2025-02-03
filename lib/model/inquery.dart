class Inquery {
  final String firstname;
  final String lastname;
  final String phonenumber;
  final String email;
  final String adress;
  final String enquiry;

  Inquery(
      {required this.firstname,
      required this.lastname,
      required this.phonenumber,
      required this.email,
      required this.adress,
      required this.enquiry});

  Map<String, dynamic> toJson() {
    return {
      "firstName": firstname,
      "lastname": lastname,
      "phoneNumber": phonenumber,
      "email": email,
      "adress": adress,
      "enquiry": enquiry,
    };
  }
}
