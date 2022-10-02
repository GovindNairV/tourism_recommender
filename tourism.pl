/* FACTS */

% romantic 

location(goa,romantic,beaches,leisure).
location(kerala,romantic,beaches,leisure).
location(bali,romantic,beaches,leisure).
location(mauritius,romantic,beaches,leisure).
location(andaman,romantic,beaches,leisure).
location(andaman,romantic,beaches,adventure).
location(andaman,romantic,forest,adventure).
location(himachal,romantic,hill-station,adventure).
location(kashmir,romantic,hill-station,adventure).
location(jaipur,romantic,desert,leisure).
location(jaipur,romantic,historical,leisure).
location(kerala,romantic,forest,adventure).
location(bali,romantic,forest,adventure).
location(hampi,romantic,historical,leisure).
location(agra,romantic,historical,leisure).
location(delhi,romantic,historical,leisure).

%family
location(himachal,family,hill-station,adventure).
location(vaishnodevi,family,hill-station,leisure).
location(kerala,family,beaches,leisure).
location(andaman,family,beaches,leisure).
location(sunderban,family,forest,adventure).
location(jaipur,family,desert,leisure).
location(udaipur,family,desert,leisure).
location(jodhpur,family,desert,adventure).
location(jaipur,family,historical,leisure).
location(agra,family,historical,leisure).
location(delhi,family,historical,leisure).
location(maharashtra,family,historical,leisure).
location(dharamshala,family,historical,adventure).
location(hampi,family,historical,leisure).

%friends

location(andaman,friends,beaches,adventure).
location(goa,friends,beaches,leisure).
location(himachal,friends,hill-station,adventure).
location(shimla,friends,hill-station,adventure).
location(ooty,friends,hill-station,adventure).
location(hampi,friends,historical,leisure).
location(delhi,friends,historical,leisure).
location(jaipur,friends,historical,leisure).
location(jaipur,friends,desert,leisure).
location(jodhpur,friends,desert,adventure).

%solo
location(himachal,solo,hill-station,adventure).
location(uttarakhand,solo,hill-station,adventure).
location(hampi,solo,historical,leisure).
location(vaisnodevi,solo,hill-station,leisure).
location(andaman,solo,beaches,leisure).
location(andaman,solo,beaches,adventure).
location(andaman,solo,forest,adventure).
location(sunderban,solo,forest,adventure).
location(kerala,solo,beaches,leisure).
location(jodhpur,solo,desert,adventure).

%work locations
worklocation(bangalore,it).
worklocation(hyderabad,it).
worklocation(jamshedpur,industrial).
worklocation(vishakapattanam,industrial).
worklocation(delhi,central_government).



/* Rules */


recommendation(Ans, X, Y, Z):- 
	location(Ans, X, Y, Z).


standard_output(Companions):-
    write('   What kind of destination are you looking for? '),nl,
    write('1. Beaches'),nl,
    write('2. Hill Stations'),nl,
    write('3. Deserts'),nl,
    write('4. Forest'),nl,
    write('5. Historical'),nl,
    read(Destination),nl,
    
    write('   What kind of activities are you looking for? '),nl,
    write('1. Adventure'),nl,
    write('2. Leisure'),nl,
    read(Activity),nl,

    write('Thanks to your answers we recommend following destinations to travel:'),nl,
    recommendation(Location, Companions, Destination, Activity),
    write(Location),nl,nl.


work_output:-
    write('What kind of work do you have'),nl,
    write('1. IT work'),nl,
    write('2. Industrial work'),nl,
    write('3. Central government work'),nl,
    read(Work),nl,

    write('Thanks to your answers we recommend following destinations to travel:'),nl,
    worklocation(Location,Work),
    write(Location),nl,nl.


start:-	
    write('Expert System - Tourist Destination Recommender'),nl,
    write('Please answer questions below'),nl,
    write('It helps to find Tourist for your preference'),nl,nl,
    
% STARTING QUESTIONS 
    
    write('   What is your name? '),
    read(Name),nl,
    write('   Hello '),
    write(Name),nl,
    
    write('   What kind of trip are you looking for? '),nl,
    write('1. Romantic Trip'),nl,
    write('2. family trip'),nl,
    write('3. trip with friends'),nl,
    write('4. solo trip'),nl,
    read(Companions),nl,
    
    (	Companions == 'solo' -> 
        write('What is the purpose of your trip'),nl,
        write('1. Work trip'),nl,
    	write('2. Casual trip'),nl,
        read(Purpose),nl,
        (   Purpose	== 'work' ->  
        	work_output
        	; 
        	standard_output(Companions)
         )
    	;   
    	standard_output(Companions)
    ).