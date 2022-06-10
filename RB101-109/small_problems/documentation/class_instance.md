# Locate the ruby documentation for methods File::path and File#path. How are they different?

- `File::path` is a class method while `File#path` is an instance method
  - the first is called on the `File` class while the latter is called on instances of objects of the `File` class 
- `File::path` returns the string representation of the path
- `File#path` returns the pathname that was used to create the file as a string
