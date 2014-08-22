# Ruby test task ClosedStruct

Write class ClosedStruct that can be initialized with zero arguments or one hash argument.
Should raise ArgumentError in initialized with one argument that is not a Hash.

Initialized object should have attribute readers and writers for all keys provided in hash on initialization.
But should not have readers and writers for any other attributes, e.g.:

```ruby
object = ClosedStruct.new({ name: "John Smith", age: 70, pension: 300 })
object.pension # => 300
object.pension = 400
object.pension # => 400
object.surname # => NoMethodError
object.surname = "Smith" # => NoMethodError
```
