OO Class structure for luau language. Enhances original paradigm to support:

- Type annotations while writing class methods.

- Removal of unecessary members and functions such as `__index` appearing at the class and object level, and `.new()` appearing at the object level.

- Public/private members & methods with minimal metatable jargon. Provides ability to secure members and methods from being accessed from outside sources. This is typical in other languages that give you access modifiers like private and public. Typically on Roblox we mark these with `_` prefix but with this model you can actually make them private, and then supply public getters and setters. The private memory table is never exposed outside of the module making it impossible to access unless you intentionally expose it (getter & setters recommended)

- Members and methods are clearly defined as .public or .private

- Proper types for public and private versions of the class. Exporting type with label Type allows for fluent type requires (ex. require(YourClass).Type instead of require(YourClass).YourClass)
