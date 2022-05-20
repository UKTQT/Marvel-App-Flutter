abstract class BaseModel<T> {
  Map<String, Object> toJson(e);
  T fromJson(Map<String, Object> json);
}
