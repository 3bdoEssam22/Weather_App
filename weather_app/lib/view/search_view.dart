import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubits/get_weather_cubit/get_weather_cubit.dart';

class SearchView extends StatelessWidget {
  const SearchView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:  Text('Search a city'),
        // backgroundColor:  Color.fromARGB(255, 186, 113, 4),
      ),
      body: Center(
        child: Padding(
          child: TextField(
            onSubmitted: (value) async {
              var getWeatherCubit = BlocProvider.of<GetWeatherCubit>(context);
              getWeatherCubit.getWeather(cityName: value);
              Navigator.pop(context);
            },
            decoration: const InputDecoration(
              contentPadding: EdgeInsets.symmetric(
                vertical: 32,
                horizontal: 16,
              ),
              suffixIcon: Icon(Icons.search),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(5),
                ),
              ),
              label: Text('Search'),
              hintText: 'Enter city name',
              // enabledBorder: OutlineInputBorder(
              //   borderSide: BorderSide(color: Colors.green),
              // ),
              // focusedBorder: OutlineInputBorder(
              //     borderSide:
              //         BorderSide(color: Color.fromARGB(255, 186, 113, 4))),
            ),
          ),
        ),
      ),
    );
  }
}
