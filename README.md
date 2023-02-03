#### THIS IS JUST A DRAFT OF WHAT THE LAYOUT WILL POSSIBLY LOOK LIKE. MAKE RECOMMENDATION FOR CHANGES ON HERE OR SLACK. 
# Brazilian_EComm_Predictions

## Team Members
* Shilpa Gollamuda ***(Team Leader)***
* Mandy Fu
* Shrouq Alelaumi
* Armine Khananyan
* Steven Salazar

## Overview

To review and provide an analysis breakdown of a dataset from an SMB (small and midsized buisness) known as Olist; by doing so, we will predict churn. 
In this review and analysis you'll see the tools that will be and were used to accomplish this.

## Purpose
So, what is the purpose of all this? Well, here is your answer, to predict churn and understand why it's important. To understand what churn is we first have to provide you the definition - **a tendency of customers to stop being a client of that service** - in other words, for this business, customers no longer making purchases from Olist.


The Results from predicting churn = ***customer retention, satisfaction, and a great revenue source.***

## Resources

- Fill with data source
- Fill with software used to accomplish our objectives/task

## Analysis

### Phase One - Exploring the Data
Before we can move further, we have to ensure that we have sufficent data to work with. When you're trying to predict churn, you will need, both qualitative and quantitative customer data. Within those two data types you will find the features that you will need for your machine learning models. Looking through the data, we made a consensus that we had sufficent data to progress further. It's important to note that with insufficent data, you will encounter inaccurate predictions when running your model. Do make sure you avoid making this mistake early on!


-Fill with the csv files here?


### Phase Two - Cleaning the Data
With dirty data you will find yourself creating problems. More problems equals wasted resources and businesses want to make money not hemorrhage money. With that being said, the process was first started by looking for four commom types of dirty data (Duplicates, errors, unnecessary information, or missing information). 

**The Filth**
- Right off that bat, Mandy was able to identify the filth in our data. The Geolocation data had some inconsistencies in the spelling of cities and states. For example Through the data you would find the input for "city" in four different variations: SP, sp, sao paulo, or Sao Paulo. This created an issues with the data in three different ways - one, we're now prone to errors, two, we have unnecessary information as well, which in turn means our table size is much bigger than it needs to be (Table size bigger than it needs to be is our number three).
This process was on a rinse and repeat cycle for the rest of the csv files.


**The Wash**
- The solution to the filth was simple. It must be **standardized** and **compressed**. By standardizing the data, Mandy was able to eliminate the possiblity of errors from inconsistences in spelling or variations of certain inputs. Now, for the unnecessary to become necessary, by grouping the latitude, longitude, state, and zip, and then taking the average of the latitude and longitude, where the state, city, and zip are the same (bare with us), the outcome cleaned the up duplicates and reduced the table size from one million records to nineteen thousand records! Now that is what we like to call, ***clean***.


### Phase Three - Construction

Here, we will walk you through the construction of our machine learning models and challenges that we faced. Also, Shrouq was our specialist when it came to the construct of our machine learning models. 



**Roundtable**



<img src="Images/Roundtable.png" width=200>



- Like all great and successful orginizations, there must be a discussion. Here is where you want to share your ideas and thought process during the construction phase. If you already have great communication through github, then good, but you can still get together to get more clairification on certain task/objectives you're trying to accomplish or even just review what has been completed so far. We used this everytime we got together to get a better understanding of the direction we were heading and ensuring that the path was clear. When obstacles presented themselves we knew that we had the right team to challenge or question if what we were doing was going to be efficient and effective. Below we will start with the RFM model and move foreward from there. Don't forget, communication is key!


**Recency, Frequency, Monetary**

*What is RFM?*
1. Recency - How recently did the customer make a purchase?
2. Frequency - How often does the customer make purchases?
3. Monetary Value - How much do your customers spend per purchase?


*Why RFM?*
1. The first problem we ran into was not having the data labeled for prediction. RFM was the fix.

- The first step to constructing the RFM model was to define each category with specific features. To get our recency, we needed to use the customer unique ID and the order purchase timestamps. With those in our formula we were able to get the days in-between present day and last purchase.
- Next, we need frequency. The features used to get frequency were the customer unique ID and order ID: this told how frequent our customers made purchases.
- Lastly, the monetary value. Features selected for this portion were, again, the customer unique ID and then the payment value. This gives us how much the customers spent on purchases.
- Now that we have defined our RFM we have to  

<img src="Images/Distribution_of_Segments.png" width=950>






## Results
- Fill with our outcomes/images  

## Recommendations
- Fill with the recommendations

## Summary
-Recap everything from top to bottom

The overall dataset was in good in shape with the exception of the geolocation table. The table contained over 1M records with dups and unstandardized spelling of geo cities. However, the geo state values were in ISO 2 digit format like the customers and sellers table. We sanitized the geo city column by using python to standarized the unicode spelling then we clean up the dups by grouping the zip, state, latitude and longitude and taking the average on latitude and longitude where zip, city, and state are the same. The final clean output was 19.6K from over 1M records.
![This is an image](/olist_ERD.png)

![This is an image](/olist_ERD_clean.png)

