#### THIS IS JUST A DRAFT OF WHAT THE LAYOUT WILL POSSIBLY LOOK LIKE. MAKE RECOMMENDATION FOR CHANGES ON HERE OR SLACK. 
# Brazilian_EComm_Predictions  (Title)

## Team Members
* Shilpa Gollamuda (Team Leader)
* Mandy Fu
* Shrouq Alelaumi
* Armine Khananyan
* Steven Salazar

**Overview**

This project reviews and analysis churn on a set of relational orders & products database from Olist. Olist is an SMB commerce enabler ecosystem, it connects merchants to marketplaces, that specilizes in the fileds of logistics and capital. Out data is sourced from Kaggle. It contains 9 datasets: 
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

ML models:


**Results**

Exploratory Analysis and Predictions based on public dataset collected on orders made at Olist Store.
1. Fill with objectives/task to complete
2. Fill with objectives/task to complete
3. Fill with objectives/task to complete
4. Fill with objectives/task to complete
5. Fill with objectives/task to complete

## Resources
- Fill with data source
- Fill with software used to accomplish our objectives/task

## Analysis
- Fill with Analysis data
- Fill with Images

## Results
- Fill with our outcomes/images  

## Recommendations
- Fill with the recommendations

## Summary
-Recap everything from top to bottom
