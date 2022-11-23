abstract class Either<L, R> {
  final dynamic _value;
  Either(this._value) : assert(L.toString() != R.toString());

  bool get isLeft => this is Left;
  bool get isRight => this is Right;

  R get right {
    assert(this is Right, '${this} is not a subtype of Right');
    return _value as R;
  }

  L get left {
    assert(this is Left, '${this} is not a subtype of Left');
    return _value as L;
  }

  T when<T>(T Function(L value) left, T Function(R value) right) {
    if (isLeft) {
      return left(_value as L);
    }
    return right(_value as R);
  }

  T? whenIsLeft<T>(T Function(L value) cb) {
    if (isLeft) {
      return cb(_value as L);
    }
    return null;
  }

  T? whenIsRight<T>(T Function(R value) cb) {
    if (isRight) {
      return cb(_value as R);
    }
    return null;
  }
}

class Left<L, R> extends Either<L, R> {
  Left(L value) : super(value);
}

class Right<L, R> extends Either<L, R> {
  Right(R value) : super(value);
}

class NullValue {}
