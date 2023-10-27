import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news/models/category_model.dart';
import 'package:news/screens/%20widget/category_item_widget.dart';

class CategoryScreen extends StatelessWidget {
  var categoryModel = CategoryModel.getCategories();

  CategoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Padding(
          padding: REdgeInsets.symmetric(horizontal: 15, vertical: 13),
          child: Text(
            "Pick your category\nof interest",
            style: GoogleFonts.poppins(
                color: Color(0xFF4F5A69),
                fontSize: 22.sp,
                fontWeight: FontWeight.w700),
          ),
        ),
        Expanded(
          child: GridView.builder(
            itemCount: categoryModel.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: MediaQuery.of(context).size.width * .01,
                mainAxisSpacing: MediaQuery.of(context).size.width * .05),
            itemBuilder: (context, index) {
              return CategoryItemWidget(categoryModel[index]);
            },
          ),
        )
      ],
    );
  }
}