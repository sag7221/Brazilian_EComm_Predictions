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


This project reviews and analysis churn on a set of relational orders & products database from Olist. Olist is an SMB commerce enabler ecosystem, it connects merchants to marketplaces, that specilizes in the fileds of logistics and capital. Our data is sourced from Kaggle. It contains 9 datasets: 
1. Customers
2. Sellers
3. Orders
4. Order Items
5. Order Payments
6. Order Reviews
7. Products
8. Product Category Name
9. Geolocation


We identify churn by segmenting the database using an RFM machine learning model and define it by.... We then use these segments as labels in an AUC model to predict churn. In addition we engineered an addition XXX features to bring the accuracy rate to 86%. 

**Summary:**

The overall dataset was in good shape with the exception of the geolocation table. The table contained over 1M records with dups and unstandardized spelling of geo cities. However, the geo state values were in ISO 2 digit format like the customers and sellers table. We sanitized the geo city column by using python unicodedata library to normalize the spelling, convert to ASCII to match the city format in the customers and sellers table. Then we clean up the dups by grouping zip, city, and state, and taking the average of latitudes and longitudes in that grouping and generate a geo ID that can be assign to customers and sellers. The final clean output was 19.6K from over 1M records.
![This is an image](/olist_ERD.png)

![This is an image](/olist_ERD_clean.png)





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
- Right off that bat, Mandy was able to identify the filth in our data. The geolocation data had some inconsistencies in the spelling of cities and states. For example Through the data you would find the input for "city" in four different variations: SP, sp, sao paulo, or Sao Paulo. This created an issues with the data in three different ways - one, we're now prone to errors, two, we have unnecessary information as well, which in turn means our table size is much bigger than it needs to be (Table size bigger than it needs to be is our number three).
This process was on a rinse and repeat cycle for the rest of the csv files.


**The Wash**
- The solution to the filth was simple. It must be **standardized** and **compressed**. By standardizing the data, Mandy was able to eliminate the possiblity of errors from inconsistences in spelling or variations of certain inputs. Now, for the unnecessary to become necessary, by grouping the latitude, longitude, state, and zip, and then taking the average of the latitude and longitude, where the state, city, and zip are the same (bare with us), the outcome cleaned up the duplicates and reduced the table size from one million records to nineteen thousand records! Now that is what we like to call, ***clean***.


### Phase Three - Construction

Here, we will walk you through the construction of our machine learning models and challenges that we faced.


**Recency, Frequency, Monetary**

*What is RFM?*
1. Recency - How recently did the customer make the last purchase?
2. Frequency - How many purchases did the customer make?
3. Monetary Value - How much did the customer spend total?


*Why RFM?*
1. The first problem we ran into was not having the data labeled for prediction. RFM was the fix.

- The first step to constructing the RFM model was to define each category with specific features. To get our recency, we needed to use the customer unique ID and the order purchase timestamps. With those in our formula we were able to get the days in-between present day and last purchase.
- Next, we need frequency. The features used to get frequency were the customer unique ID and order ID: this told how frequent our customers made purchases.
- Lastly, the monetary value. Features selected for this portion were, again, the customer unique ID and then the payment value. This gives us how much the customers spent on purchases.
- Now that our RFM is defined, we merge the data together to create a new table so we can see our new data. 
- Next, we check for outliers by using a box plot. ***See below***


<img src="Images/Recency_box_plot.png" width=320>     <img src="Images/Frequency_box_plot.png" width=320>     <img src="Images/Monetary_box_plot.png" width=320>

**The Outliers**


- From a glance we can see that we have some outliers. With that being said, we want to make sure we reliably remove the outliers that we don't need, so we use the 1.5 IQR rule.


**Creating the Segments and Linking the Scores**


We take our new data, create the labels, assign them, and then we add the segments. The segments will be matched up with the appropriate scores, letting us know where our customers stand. Here is the source we referred to: https://documentation.bloomreach.com/engagement/docs/rfm-segmentation 


<img src="Images/RFM_Segmentation.png" width=950>


**Transformation**


From here we transform the data into what will show us the answers we've been working towards.

  

<img src="Images/Distribution_of_Segments.png" width=950>



## Results
- Fill with our outcomes/images  

## Product Recommendations and Market Basket Analysis
Given that we have done customer segmentation and have identified the churn, we are now targetting the other segments to retain customers and provide a better experience through our product recommendation system.

For product recommendations, one of the challenges we faced is that maximum number of transactions are single product purchases. But given this, we still need to figure out the market basket analysis.
Also, <i>explicit</i> vs <i>implicit</i> data.

Having access to explicit data that users have provided is not possible in this case, so we relied entirely on data generated from user activities on site.

Selecting the Algorithm
Association Rule Mining(ARM) can be used to provide session-based recommendations and Apriori is one such widely accepted ARM algorithm. We wanted to establish rules to see if there were products pairs being purchased together, or what is the association of one product with the others.

General idea behind the Apriori algorithm:
We want to establish the the value of the below variables:
#### Support ####
Support refers to the popularity of item and can be calculated by finding the number of transactions containing a particular item divided by the total number of transactions.

$Support(diaper) = (Transactions containing (diaper))/(Total Transactions)$

#### Confidence ####
Confidence refers to the likelihood that an item B is also bought if item A is bought. It can be calculated by finding the number of transactions where A and B are bought together, divided by the total number of transactions where A is bought. Mathematically, it can be represented as:

$Confidence(A → B) = (Transactions containing both (A and B))/(Transactions containing A)$

#### Lift ####
Lift refers to the increase in the ratio of the sale of B when A is sold.
Lift(A –> B) can be calculated by dividing Confidence(A -> B) divided by Support(B).  

Mathematically it can be represented as:  

$Lift(A→B) = (Confidence (A→B))/(Support (B))

Lift(milk → diaper) = (Confidence (milk → diaper))/(Support (diaper))$

#### Steps involved in Apriori Algorithm ####

For larger dataset, this computation can make the process extremely slow.
To speed up the process, we need to perform the following steps:

1. Set a minimum value for support and confidence. This means that we are only interested in finding rules for the items that have certain default existence (e.g. support) and have a minimum value for co-occurrence with other items (e.g. confidence).
2. Extract all the subsets having a higher value of support than a minimum threshold.
3. Select all the rules from the subsets with confidence value higher than the minimum threshold.
4. Order the rules by descending order of Lift.

##### Working on our dataset #####

**Importing and preparing our dataset**  

For this we first identified tables that are required and merged them. These are the tables that were merged:
1. olist_products_dataset.csv
2. product_category_name_translation.csv
3. olist_order_items_dataset.csv
4. olist_orders_dataset.csv
5. olist_customers_dataset.csv


After merging these tables, we get a dataframe like this:

<img src="Images/Merged_Table_1.png">    

**Data Preprocessing**  

The Apriori library requires the dataset to be in the form of list of lists of transactions. We then prepare this.
Next step, we identify the columns that we need to get the list of transactions made by customers.  

<img src="Images/customer_transactions_list_2.png">   

**Using Apriori**  

We now identify the frequent item sets by implementing apriori on our encoded list of lists, with a minimum of support of 0.001  

<img src="Images/frequent_itemsets_3.png">  


We now create association rules with frequent itemsets and we get 26 rules in all.  

<img src="Images/association_rules_4.png">  


With this we now sort the rules to get rules with highest lift.  

<img src="Images/lookup_table_5.png"> 

From the lookup table we can see that the rule that works best is:  

<img src="Images/final_products_6.png"> 



## Summary
-Recap everything from top to bottom

