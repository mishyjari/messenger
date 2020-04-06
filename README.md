Messenger is a personal project for the Flatiron Software Engineering Boot Camp, Module 1
Starting out, we will have three object classes: Courier, Client, and Dispatch

A courier has many clients.
A client is served by many couriers
A delivery is initiated by using dispatch as the join class between the two

Courier:
- Initialize
	- Initialized with a name, birthday, and rookie year
	- Initialize method will set a default 'active' status of true
- Instance Methods
	#age - will calculate courier's age
	#years_experience - calculate years experience

Client:
- Initialized with a name, address and zone

Dispatch
- Initialized with courier, client, time job was added, time delivery is due and type of package
