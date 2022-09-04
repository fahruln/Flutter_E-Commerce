class Collection {
  String name;
  int price;
  String description;
  List<String> image;
  int amount = 1;

  Collection(
      {required this.name,
      required this.price,
      required this.description,
      required this.image});
}

var collectionList = [
  Collection(
      name: 'Dublin Vest With Pocket Black Oversize',
      price: 499000,
      description:
          'Rome Jacket Dark Misty\nMaterial : Cotton Lacoste\nPanjang baju : 75 cm\nPanjang tangan : 40 cm\nLingkar dada : 120 cm\nPreorder, Estimasi Pengerjaan 2 - 3 Minggu\nHappy Shopping !!',
      image: [
        'https://sirclocdn.com/rashawl/products/_211109155928_dublin%20vest%20os%20blk%202_zoom.jpg',
        'https://sirclocdn.com/rashawl/products/_211109155928_dublin%20vest%20os%20blk%201_tn.jpg',
        'https://sirclocdn.com/rashawl/products/_211109155928_dublin%20vesy%20os%20blk%203_tn.jpg'
      ]),
  Collection(
      name: 'Cologne Long Sleeve Polo Shirt Dark Misty',
      price: 450000,
      description:
          'Rome Jacket Dark Misty\nMaterial : Cotton Lacoste\nPanjang baju : 75 cm\nPanjang tangan : 40 cm\nLingkar dada : 120 cm\nPreorder, Estimasi Pengerjaan 2 - 3 Minggu\nHappy Shopping !!',
      image: [
        'https://sirclocdn.com/rashawl/products/_211204160726_COLOGNE%20LONG%20SLEEVE%20POLO%20SHIRT%201%20DM_zoom.jpg',
        'https://sirclocdn.com/rashawl/products/_211204152212_PORTO%20HOODIE%20COAT%20BRONZE%202_zoom.jpg?v=1656485933059',
        'https://sirclocdn.com/rashawl/products/_211204152212_PORTO%20HOODIE%20COAT%20BRONZE%203_zoom.jpg?v=1656485954699'
      ]),
  Collection(
      name: 'Budapest Tailored Jacket Dark Misty',
      price: 549000,
      description:
          'Rome Jacket Dark Misty\nMaterial : Cotton Lacoste\nPanjang baju : 75 cm\nPanjang tangan : 40 cm\nLingkar dada : 120 cm\nPreorder, Estimasi Pengerjaan 2 - 3 Minggu\nHappy Shopping !!',
      image: [
        'https://sirclocdn.com/rashawl/products/_211108164916_BUDAPEST%20TAILORED%20COAT%20DM_tn.jpg',
        'https://sirclocdn.com/rashawl/products/_211108161107_BUDAPEST%20TAILORED%20COAT%20DM_tn.jpg',
        'https://sirclocdn.com/rashawl/products/_211108161107_BUDAPEST%20TAILORED%20COAT%20dm%203_tn.jpg'
      ]),
  Collection(
      name: 'Numberg Hoodie Coat Army',
      price: 515000,
      description:
          'Rome Jacket Dark Misty\nMaterial : Cotton Lacoste\nPanjang baju : 75 cm\nPanjang tangan : 40 cm\nLingkar dada : 120 cm\nPreorder, Estimasi Pengerjaan 2 - 3 Minggu\nHappy Shopping !!',
      image: [
        'https://sirclocdn.com/rashawl/products/_211204151525_NUMBERG%20HOODIE%20COAT%20ARMY%201_tn.jpg',
        'https://sirclocdn.com/rashawl/products/_211204151525_NUMBERG%20HOODIE%20COAT%20ARMY%202_tn.jpg',
        'https://sirclocdn.com/rashawl/products/_211204151525_NUMBERG%20HOODIE%20ARMY%203_tn.jpg'
      ]),
  Collection(
      name: 'Annover Tailored Coat Navy',
      price: 500000,
      description:
          'Rome Jacket Dark Misty\nMaterial : Cotton Lacoste\nPanjang baju : 75 cm\nPanjang tangan : 40 cm\nLingkar dada : 120 cm\nPreorder, Estimasi Pengerjaan 2 - 3 Minggu\nHappy Shopping !!',
      image: [
        'https://sirclocdn.com/rashawl/products/_211108163900_HANNOVER%20NAVY%201_tn.jpg',
        'https://sirclocdn.com/rashawl/products/_211204151525_NUMBERG%20HOODIE%20COAT%20ARMY%202_tn.jpg',
        'https://sirclocdn.com/rashawl/products/_211204151525_NUMBERG%20HOODIE%20ARMY%203_tn.jpg'
      ]),
  Collection(
      name: 'Cargo Denim Pants By Renni Andriani',
      price: 450000,
      description:
          'Rome Jacket Dark Misty\nMaterial : Cotton Lacoste\nPanjang baju : 75 cm\nPanjang tangan : 40 cm\nLingkar dada : 120 cm\nPreorder, Estimasi Pengerjaan 2 - 3 Minggu\nHappy Shopping !!',
      image: [
        'https://sirclocdn.com/rashawl/products/_211224094823_CARGO%20DENIM%20PANTS%20BY%20RENNI%20ANDRIANI%201_zoom.jpg',
        'https://sirclocdn.com/rashawl/products/_211204152212_PORTO%20HOODIE%20COAT%20BRONZE%202_zoom.jpg?v=1656485933059',
        'https://sirclocdn.com/rashawl/products/_211204152212_PORTO%20HOODIE%20COAT%20BRONZE%203_zoom.jpg?v=1656485954699'
      ]),
];

List bagList = [];
List wishList = [];
