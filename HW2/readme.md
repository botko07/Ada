For mark 2.
Create a Conveyer_System generic package.

The generic parameters are:

Item: discrete type, possible items of the conveyor belt. Suppose the first element is the empty element, this will be used in places where we don’t want item. E.g. in main program use type Toys is (Nothing, Car, Doll, Ball);
Index: discrete type, the index of the belt.
The Conveyor type:

The package has a private type Conveyor with discriminant, which has no equality and assignment defined. The internal representation should be a record with discriminant, the type parameter is the size of the belt. The fields of the record are:

Items: the array of the belt, the size is equal to the capacity, initialize all with the first element of the type Item.
Robot_Position: the position of the robot, initially first position.
Operations to be implemented:

Move_Robot: receives an index of type Index, places the robot arm to that index.
Put: receives an Item, places to the actual position of the robot.
Get: gets the item from where the robot is and returns it.
Show: Prints the content of the belt.
For mark 2 the belt is not moving, it is static. Write a demo to illustrate the above operations.

For mark 3.
Create a Rotate generic procedure (in separate files), which rotates the elements of an array. The generic parameters are:

Item: arbitrary type, which has equality and assignment.
Index: discrete type.
Item_Array: an array of Item-s with Index indefinite array range.
The procedure has an in and out Item_Array parameter. It should shift the elements to the left, so i receives the i+1 element, at last position it should be the first element.

The Conveyer_System generic package should be extended by Move operation, which shifts the belt to the left. For implementation use the above Rotate generic.

Write a demo to illustrate how the moving operation works.

For mark 4.
Extend the package by two exceptions Slot_Is_Empty, Slot_Not_Empty which will be raised if we get a value from an empty place, and if we insert in an occupied place. Extend the Rotate generic procedure with a logical parameter, if it is true rotate the items to right, if false rotate to left.

Insert in the Conveyer_System generic package an enumeration type which stores two direction values. The Move should have a second parameter of this type with default value left direction. For implementation use the modified Rotategeneric. Write a demo to illustrate the above operations.

For mark 5.
The Conveyer_System generic package should be extended by new generic parameter: Put_Nothing. In the Show operation call this procedure if the field is empty, i.e. the first value of Item is there. In demo instantiate with a printing procedure that prints a "*" character.

Extend in the Conveyer_System generic package with a Command enumeration type, with the following values: Move_Left, Move_Right, Put, Get. Define an Algorithm type which is an array containing Command elements. Write a Run procedure which receives an algorithm and a number of iterations, and it executes the algorithm as many times as is in iterations.

Help:

The Put should place a random item on the belt. This can be done with Ada.Numerics.Discrete_Random generic package, which should be instantiated with the name Random_Item using the Item type (or a subtype of it, which has as first element Nothing). In the following find how a random can be done.
