Due to the recent restrictions, shops can only allow a specific number of people
to enter at a time, and the rest of the customers will have to wait until someone leaves from inside. 

Create the following simulation. 
Note: The printing should be done by a protected object.
      The 1 minute in the text is 0.1 second when programming.
      Generating random values should be done also in protected.

Create a task type Customer which receives the name as a discriminant.
A Customer chooses one of the available shops randomly, and then arrives after 5 minutes.
If it is open, enters and prints (his name and shop number) and stays there for 20 min, 
if he couldn't enter, he tries once again after 5 minutes.
If he couldn't enter again, he goes home (and print (his name) couldn't get into shop).

The shop should be also task type.
A shop takes random (float) time to open, after that it allows a Customer to enter every two minutes.
If the number of people inside reaches 5 per shop, then it doesn't allow more until someone leaves.

20 dynamic Customers should be created in an array, arriving at 1-minute intervals.
Once any of the Customers terminate, another one is created.

3 dynamic shops should be created in an array, opening at 2 minutes intervals.
After 2 hours (120 minutes) of opening the shops, all shops should close and declare how many Customers each one served,
then print the number of total customers created and simulation should end. 
