/// Allows mapping a JSON to a specific object or list of objects.
///
/// [T] refers to the type of input and [M] refers to the type of output
/// that the methods of the class have.
/// 
abstract class Mapper<T, M> {
  M fromJson(T json);
  List<M> fromJsonList(List<T> jsonList);
}
