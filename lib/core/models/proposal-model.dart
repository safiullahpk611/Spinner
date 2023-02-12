class LinkAddress {

  String? addressLink;
  List<dynamic>? prizeItems;
  


  LinkAddress({

    this.addressLink,
    this.prizeItems,

});
  LinkAddress.fromJson(json, id) {

    this.addressLink = json['addressLink'];
    this.prizeItems = json['prizeitems'];


  }
  toJson() {
    return {

      'addressLink': this.addressLink,
      'prizeitems':this.prizeItems,
    };
  }

}