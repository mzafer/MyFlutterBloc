import 'dart:async';
import 'dart:convert';
import 'dart:math';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

part 'items_event.dart';
part 'items_state.dart';

class ItemsBloc extends HydratedBloc<ItemsEvent, ItemsState> {
  ItemsBloc() : super(ItemsState(items: []));

  @override
  Stream<ItemsState> mapEventToState(
    ItemsEvent event,
  ) async* {
    if(event is LoadItems){
      if(state.items == null || state.items.isEmpty){
        yield ItemsState(items:_fetchItems());
      } else {
        yield state;
      }
    } else if( event is ClearItems){
      await this.clear();
      yield ItemsState(items:[]);
    }
  }

  List<String> _fetchItems(){
    List<String> items = [];
    var rng = new Random();
    items.add('Item code : ${rng.nextInt(900000)}');
    items.add('Item code : ${rng.nextInt(900000)}');
    items.add('Item code : ${rng.nextInt(900000)}');
    items.add('Item code : ${rng.nextInt(900000)}');
    items.add('Item code : ${rng.nextInt(900000)}');
    items.add('Item code : ${rng.nextInt(900000)}');
    return items;
  }

  @override
  ItemsState fromJson(Map<String, dynamic> json) {
    var itemsJson =   jsonDecode(json['items']) as List;
    List<String> items = itemsJson != null ? List.from(itemsJson) : null;
    return ItemsState(items: items);
  } 

  
    @override
  Map<String, String> toJson(ItemsState state) => { 'items': jsonEncode( state.items)};

}
