import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weatherapp/controller/dio_service.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SearchBar extends StatelessWidget {
  const SearchBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var state = Provider.of<DioState>((context), listen: true);
    return Consumer<DioState>(
      builder: ((context, DioState, child) {
        return Container(
          child: TextField(
            controller: state.searchBar,
            style: TextStyle(
              fontSize: 25.0,
              color: Colors.blueAccent,
            ),
            decoration: InputDecoration(
                filled: true,
                suffixIcon: IconButton(
                  onPressed: () {
                    if (DioState.searchBar.text.isNotEmpty) {
                      state.SearchCity(DioState.searchBar.text);
                      DioState.searchBar.clear();
                    }
                  },
                  icon: Icon(Icons.search),
                ),
                hintText: "Search Your City",
                border: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.lightBlue, width: 32.0),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.white, width: 32.0),
                )),
            onTap: () {},
          ),
        );
      }),
    );
  }
}
