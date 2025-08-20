import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:provider/provider.dart';
import 'package:task/core/constants/colors.dart';
import '../state/recipe_provider.dart';
import '../core/widgets/search_bar.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<RecipeProvider>(context);

    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        backgroundColor:backgroundColor ,
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            width: 15,
          height: 15,
          decoration: BoxDecoration(
            color: arrowColor,

            borderRadius: BorderRadius.circular(50)
          ),
            child: Icon(Icons.arrow_back_ios_new_outlined,size: 18,)
            ,

          ),
        ),
        title: Text("Search",style: TextStyle(
          fontSize: 16,

              fontWeight: FontWeight.w600

        ),),
        actions: [
          Stack(
            children: [
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.shopping_cart_outlined),
              ),
              Positioned(
                right: 6,
                top: 6,
                child: CircleAvatar(
                  backgroundColor: Colors.red,
                  radius: 8,
                  child: Text("2", style: TextStyle(fontSize: 10, color: Colors.white)),
                ),
              ),
            ],
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          children: [
            CustomSearchBar(
              onChanged: (query) => provider.search(query),
            ),
            Align(
              alignment: Alignment.topLeft,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8),
                child: Text(
                  "Recent Keywords",
                  style: TextStyle(fontWeight: FontWeight.w600),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 4.0),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Wrap(
                  spacing: 8.0,
                  children: [
                    _Chips('Burger'),
                    _Chips('Sandwich'),
                    _Chips('Pizza'),
                    _Chips('Pasta')
                  ],
                ),
              ),
            ),
            SizedBox(height: 22),

            Align(
              alignment: Alignment.topLeft,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8.0),
                child: Text(
                  "Suggested Restaurant",
                  style: TextStyle(fontWeight: FontWeight.w600),
                ),
              ),
            ),
            ListView.separated(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: provider.recipes.length > 3 ? 3 : provider.recipes.length,
              itemBuilder: (context, index) {
                final recipe = provider.recipes[index];
                return ListTile(
                  leading: ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Image.network(
                      recipe.image,
                      width: 70,
                      height: 55,
                      fit: BoxFit.cover,
                    ),
                  ),
                  title: Text(
                    recipe.name,
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
                  ),
                  subtitle: Row(
                    children: [
                      Icon(Icons.star_border, color: Colors.orange),
                      Text("${recipe.rating}"),
                    ],
                  ),
                );
              },
              separatorBuilder: (context, index) =>
                  Padding(
                    padding: const EdgeInsets.only(left: 13.0),
                    child: Divider(),
                  ),
            ),

            SizedBox(height: 22),

            // 🔹 Popular Fast Food
            Align(
              alignment: Alignment.topLeft,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8.0),
                child: Text(
                  "Popular Fast Food",
                  style: TextStyle(fontWeight: FontWeight.w600),
                ),
              ),
            ),


          ],
        ),
      ),
    );
  }
}

Widget _Chips(String label) {
  return Chip(
    label: Text(label),
    backgroundColor: backgroundColor,
    shape: RoundedRectangleBorder(
      side: BorderSide(color: Colors.black12, width: 1),
      borderRadius: BorderRadius.circular(30),
    ),
  );
}



class _FoodCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final String image;

  const _FoodCard({required this.title, required this.subtitle, required this.image});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade200,
            blurRadius: 6,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
            child: Image.network(image, height: 120, fit: BoxFit.cover),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Text(title, style: TextStyle(fontWeight: FontWeight.bold)),
                SizedBox(height: 4),
                Text(subtitle, style: TextStyle(fontSize: 12, color: Colors.grey)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}