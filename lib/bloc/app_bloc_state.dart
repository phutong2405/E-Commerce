import 'package:ecom_app_2411/bloc/app_bloc_event.dart';
import 'package:ecom_app_2411/model/product_model.dart';
import 'package:ecom_app_2411/model/purchase_product.dart';
import 'package:flutter/material.dart';

@immutable
abstract class AppState {
  const AppState();
}

class MainActionState implements AppState {
  const MainActionState();
}

class InitialState implements AppState {
  const InitialState();
}

class LoadingState implements AppState {
  const LoadingState();
}

class LoadedState implements AppState {
  final Iterable<Product> data;

  const LoadedState({required this.data});
}

class ErrorState implements AppState {
  const ErrorState();
}

class OutState implements MainActionState {
  const OutState();
}

class TapToItemState implements MainActionState {
  final Product product;
  final bool isFavorited;
  final bool isSaved;
  const TapToItemState({
    required this.isFavorited,
    required this.isSaved,
    required this.product,
  });
}

class ControlBarTappedState implements MainActionState {
  final String animateIconString;
  final Duration duration;

  const ControlBarTappedState({
    required this.animateIconString,
    required this.duration,
  });
}

class CartDetailTappedState implements MainActionState {
  final List<Purchase> purchase;
  final String type;

  const CartDetailTappedState({
    required this.purchase,
    required this.type,
  });
}

class CheckOutTappedState implements MainActionState {
  final List<Purchase> purchase;

  const CheckOutTappedState({
    required this.purchase,
  });
}

class PlaceOrdersTappedState implements MainActionState {
  const PlaceOrdersTappedState();
}

class OtherDetailTappedState implements MainActionState {
  final List<Product> products;
  final String type;

  OtherDetailTappedState({required this.products, required this.type});
}

class FilterTappedState implements MainActionState {
  const FilterTappedState();
}



// class SearchingState implements MainActionState {
//   final Iterable<DictionaryEntry> searchIterable;
//   const SearchingState({required this.searchIterable});
// }

// class LoginState implements MainActionState {
//   const LoginState();
// }

// class LoggedState implements MainActionState {
//   final bool isLogged;
//   const LoggedState({required this.isLogged});
// }
