tire_sample - facet_filter issue
===========


How to run
===========
1. rake db:migrate
2. rake db:seed
3. rake tire:reindex
4. rails s

Issues
===========
Case 1
1. Go to /
2. Select 105 KM
3. We should see 1 result and we see 3 results - no idea why...

Case 2
1. Please see welcome_controller.rb
2. Comment out lines 30-48 and uncomment lines 52-58
3. Go to /
4. Select 105 KM
5. We see now 1 result and this is correct
6. Problem here is the 'capacity' facet is not updating its counts accoring to selected value in 'power' facet