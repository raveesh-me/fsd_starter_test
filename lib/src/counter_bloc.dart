import 'package:fsdstartertest/src/counter_service.dart';
import 'package:rxdart/rxdart.dart';

class CounterBlocModel {
  final int count;
  final CounterBloc bloc;

  CounterBlocModel(this.count, this.bloc);
}

class CounterBloc {
  CounterBlocModel _counterBlocModel;
  CounterService _counterService;
  int get _count => _counterBlocModel.count;
  set _count(int count) {
    _counterBlocModel = CounterBlocModel(count, this);
    _subject.add(_counterBlocModel);
  }

  BehaviorSubject<CounterBlocModel> _subject = BehaviorSubject();
  Stream<CounterBlocModel> get stream => _subject.stream;

  CounterBloc(this._counterService) {
    _count = _counterService.getCount();
    if (_count == null) _count = 0;
  }

  dispose() {
    _subject.close();
  }

  addOne() {
    _count = _count + 1;
    _counterService.changeCount(_count);
  }
}
