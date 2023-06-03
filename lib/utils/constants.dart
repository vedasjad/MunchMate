import "package:munchmate/models/item.dart";
import "package:munchmate/models/order.dart";

Order order = Order(id: '', items: [], itemCounts: []);
int totalAmount = 0;

const itemTypes = [
  "All",
  "Drinks",
  "Snacks",
  "Meals",
  "Favourites",
];
const headerIcons = [
  "https://freesvg.org/img/fast-food-menu.png",
  "https://freesvg.org/img/Gerald_G_Fast_Food_Drinks_(FF_Menu)_5.png",
  "https://freesvg.org/img/1548610988.png",
  "https://freesvg.org/img/publicdomainq-bento.png",
  "https://img.icons8.com/tiny-color/64/like.png",
];

var selectedItemType = itemTypes[0];

List<Item> items = [
  Item(
    id: "01",
    name: "Burger",
    type: "Snacks",
    price: 35,
    imageUrl:
        "https://tse2.mm.bing.net/th?id=OIP.R5UPva7E315gxahQdEybBwHaFj&pid=Api&P=0&h=180",
    isAvailable: "True",
  ),
  Item(
    id: "02",
    name: "Sandwich",
    type: "Snacks",
    price: 25,
    imageUrl:
        "https://tse4.mm.bing.net/th?id=OIP.WX3BUFQ2XUz8cCpfHhPqDwHaHa&pid=Api&P=0&h=180",
    isAvailable: "True",
  ),
  Item(
    id: "03",
    name: "Chhola Samosa",
    type: "Snacks",
    price: 20,
    imageUrl:
        "https://tse3.mm.bing.net/th?id=OIP.28Z6oNKn3SUtohT_rhvnNAHaF-&pid=Api&P=0&h=180",
    isAvailable: "True",
  ),
  Item(
    id: "04",
    name: "Chhole Kulchhe",
    type: "Snacks",
    price: 50,
    imageUrl:
        "https://tse4.mm.bing.net/th?id=OIP.2P2xmwp69P66f-08CH5dYwHaEK&pid=Api&P=0&h=180",
    isAvailable: "True",
  ),
  Item(
    id: "05",
    name: "Hotdog",
    type: "Snacks",
    price: 35,
    imageUrl:
        "https://tse2.explicit.bing.net/th?id=OIP.WwNG0Db_o58XuR8uyHFGJQHaE8&pid=Api&P=0&h=180",
    isAvailable: "True",
  ),
  Item(
    id: "06",
    name: "Paneer Wrap",
    type: "Snacks",
    price: 37,
    imageUrl:
        "https://tse2.mm.bing.net/th?id=OIP.6ndl-3qP9AI1_1xHfKpm1AHaE8&pid=Api&P=0&h=180",
    isAvailable: "True",
  ),
  Item(
    id: "07",
    name: "Chhole Bhature",
    type: "Meals",
    price: 60,
    imageUrl:
        "https://tse2.mm.bing.net/th?id=OIP.6ndl-3qP9AI1_1xHfKpm1AHaE8&pid=Api&P=0&h=180",
    isAvailable: "True",
  ),
  Item(
    id: "08",
    name: "Cold Drink",
    type: "Drinks",
    price: 20,
    imageUrl:
        "https://tse3.mm.bing.net/th?id=OIP.NNC6AG0Uay8uDcoR7HttOgHaHa&pid=Api&P=0&h=180",
    isAvailable: "True",
  ),
];
