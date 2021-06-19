Given a petrol station with 3 filling pumps, 20 dynamic cars. Write an agenda of the activities of the station. The station should be protected; the pumps are private Boolean variables kept in an array.

The cars, after arrival to the station, will check which pump is empty and they will fill their tank and leave the station. If more pumps are empty, they choose one randomly and go there for filling up. If all stations are busy, then they return again after 1 second. They make maximum 3 trials to get petrol, if not successful they just go away. The filling ups should be entries of the protected (each pump has one), and can serve a car when the pump is empty.

Each car has two discriminants:

a licence number (an integer), and when is filling up it has to give it to the station to register in the agenda. This number is a value in 1..20 interval. The drivers are not patient if they can’t fill the tank immediately, then they go away an try again as written above.

a filling up time (duration random value between 2.0 and 3.0 second).

The cars are starting in random time intervals (between 0.1 and 1.1 seconds) going to the station and they are created by the main program. Write every activity on the screen using a protected printer.
