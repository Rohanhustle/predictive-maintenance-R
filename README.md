# redesigned-octo-potato
This is a simple 'Predictive Maintenance' project.
In this I have created a linear regression model to predict values of different parameters
for the next 10 days.

ABOUT THE DATA SET

Our data set contains various columns with different meaning: - 

1)	Days: - Days contain the number of days a machine has been used. Given values are from Day 1 to Day 30.

2)	Vibrational Parameters: - Vibrational parameters give us the vibrational value on that day. As these must be predicted, their values after day 20 are not filled.


3)	Flow Parameters: - Flow parameters give us the flow values of the machine for that day.

4)	Pressure Parameter: -Pressure parameters give us the pressure values of the machine for that day.


5)	NH(No of Hours): - The number of hours the machine is used.

6)	VibAP(Vibration Acceptable values): - The accurate values of the vibrational parameters that will help the machine work properly.


7)	FlowAp(Flow Acceptable values): -- The accurate values of the flow parameters that will help the machine work properly.

8)	PressureAP(Pressure Acceptable Values): -- The accurate values of the Pressure parameters that will help the machine work properly.



CODE INPUTTED IN RSTUDIO USING LANGUAGE R
1)	We make use of the .csv file containing the dataset to access it.
2)	We have trained 70% of the data and will run test on 30% of the data to check our predicted values. This will run on the row that has all the data.
3)	We calculate SSE (Sum of Squared error),SST(Sum of Square total), R2( R Squared value)
4)	These errors will only show values when there are no ‘NA’ values. Thus, have the first 20 values gives us data on our model.


OUTPUT OBTAINED
 As we can see the output is involves many aspects of statistics of various forms, the terms that are easily decipherable and of use to the us are: -

1)	Coefficients: - The table shows the dependency of vibrational parameters with the other parameters. Some parameters like PressureAp, PressureParameters have been removed in the code as they show no relation with each other.  

2)	Predicted and Actual: -The table show the values of predicted and actual values. These are 6 randomly obtained values from the dataset depicting 30% of the test data. The predicted values give the predicted values obtained from the model and the actual data depicts the actual value of the parameter.
3)	From the results we see that the error are very less between our predicted values and the actual values. 

4)	Finally, the last table depicts the predicted values of the next vibrational parameters for the next 10 days. These are very near the Vibrational accurate values and thus show that the machine would not have any problems because of the vibrational parameters.


5)	Consequently, we can predict the Pressure Parameters and the Flow parameters without even depending on the other two as they are not added in the model nor are there acceptable values.

6)	We have obtained a good model to predict the values of the parameter depending on the previous values and pattern they have shown.


7)	We can have as many parameters as we require and as many data values i.e. Rows of data as we want. Our model can extend up to taking over 30,000 rows of data and accurately predicting the consequent parameters for the next week or month.
