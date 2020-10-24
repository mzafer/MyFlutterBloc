part of 'items_bloc.dart';

class ItemsState extends Equatable {
  
  List<String>  items = null;

  ItemsState({this.items});
  @override
  List<Object> get props => [items];
    
}
