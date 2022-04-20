# Car-Accidents
In this project I use Python with Random Forest Classifier to predict if people survived car accidents and I did the same with R language and I used Naivebayes Classifier.

# Details
The dataset I am going to use in this assigment are the US data, for 1997-2002, from police-reported car crashes in which there is a harmful event (people or property), and from which at least one vehicle was towed. Data are restricted to front-seat occupants and include only a subset of the variables recorded.

## columns:
#### dvcat: ordered factor with levels (estimated impact speeds) 1-9km/h, 10-24, 25-39, 40-54, 55+
#### weight: Observation weights, albeit of uncertain accuracy, designed to account for varying sampling probabilities.
#### dead: factor with levels alive dead
#### airbag: a factor with levels: airbag, none
#### seatbelt: a factor with levels: belted, none
#### frontal: a numeric vector; 0 = non-frontal, 1=frontal impact
#### sex: a factor with levels f (female) m (male)
#### ageOFocc: age of occupant in years
#### yearacc: year of accident
#### yearVeh: Year of model of vehicle; a numeric vector
#### abcat: Did one or more (driver or passenger) airbag(s) deploy? This factor has levels: deploy, nodeploy, unavail
#### occRole: a factor with levels driver pass
#### deploy: a numeric vector: 0 if an airbag was unavailable or did not deploy; 1 if one or more bags deployed.
#### injSeverity: a numeric vector; 0:none, 1:possible injury, 2:no incapacity, 3:incapacity, 4:killed, 5:unknown, 6:prior death
#### caseid: character, created by pasting together the populations sampling unit, the case number, and the vehicle number. Within each year, use this to uniquely identify the vehicle.
