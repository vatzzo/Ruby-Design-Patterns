### Template Method

1. Placing immutable elements in the base class and moving more specialized elements to subclasses. 
2. The base class can define implementations of basic methods that can be overridden by subclasses (hook methods).
3. Methods in subclasses must define their own implementation unless they are hook methods.
