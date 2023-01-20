/* CREATE TABLE ecomm_user_churn (
VisitorID INTEGER PRIMARY KEY NOT NULL,
Session_Interval FLOAT,
Session_Avg_Interval FLOAT,
Session_Int_Std_Deviation FLOAT,
Session_Ratio FLOAT,
User_Session_Interval FLOAT,
Session_Count FLOAT,
Session_Ratio_Frequency FLOAT,
User_App_Interaction FLOAT,
User_App_Session_Frequency FLOAT,
Transaction_Count FLOAT,
Transaction_Session_Frequency FLOAT,
Total_Revenue FLOAT,
Total_Revenue_Session_Freq FLOAT,
Major_Spend FLOAT,
Avg_Categories_Interacted FLOAT,
Avg_Distinct_Items FLOAT,
Avg_Month FLOAT,
Std_Deviation_Months FLOAT,
avg_hour_daily FLOAT,
std_deviation_hours FLOAT,
weekend_sessions FLOAT,
Avg_Session_Duration FLOAT,
Avg_Time_Between_Interaction FLOAT,
Avg_Time_transactional_Events FLOAT,
int_cat1_n INTEGER,
int_cat2_n INTEGER,
int_cat3_n INTEGER,
int_cat4_n INTEGER,
int_cat5_n INTEGER,
int_cat6_n INTEGER,
int_cat7_n INTEGER,
int_cat8_n INTEGER,
int_cat9_n INTEGER,
int_cat10_n INTEGER,
int_cat11_n INTEGER,
int_cat12_n INTEGER,
int_cat13_n INTEGER,
int_cat15_n INTEGER,
int_cat16_n INTEGER,
int_cat17_n INTEGER,
int_cat18_n INTEGER,
int_cat19_n INTEGER,
int_cat20_n INTEGER,
int_cat21_n INTEGER,
int_cat22_n INTEGER,
int_cat23_n INTEGER,
int_cat24_n INTEGER,
target_class INTEGER);
*/ 



sellers
--
seller_id VARCAHR pk FK >- order_items.seller_id
seller_zip_code int
seller_city VARCHAR
seller_state VARCHAR

orders
--
order_id VARCAHR pk FK >- order_reviews.order_id
customer_id VARCHAR FK >- customer.customer_id
order_status VARCHAR
order_purchase_timestamp DATE
order_approved_at DATE
order_delivered_carrier_date DATE
order_delivered_customer_date DATE
order_estimated_delivery_date DATE

products
--
product_id VARCHAR pk FK >- order_items.product_id
product_category_name VARCHAR
product_name_lenght INT
product_description_lengh INT
product_photos_qty INT
product_weight_g INT
product_length_cm INT
product_height_cm INT
product_width_cm INT

order_reviews
--
review_id VARCHAR pk
order_id VARCHAR
review_score INT
review_comment_title VARCHAR 
review_comment_message VARCHAR
review_creation_date DATE
review_answer_timestamp DATE

order_payments
--
order_id VARCHAR FK >- orders.order_id
payment_sequential INT
payment_type VARCHAR
payment_installments INT
payment_value FLOAT

order_items
--
order_id VARCHAR FK >- orders.order_id
order_item_id INT
product_id VARCHAR
seller_id VARCHAR
shipping_limit_date DATE
price FLOAT
freight_value FLOAT

geolocation
--
geolocation_zip_code_prefix INT pk
geolocation_lat FLOAT8
geolocation_lng FLOAT8
geolocation_city VARCHAR
geolocation_state VARCHAR

customer
--
customer_id  VARCHAR pk
customer_unique_id VARCHAR 
customer_zip_code_prefix INT FK >- geolocation.geolocation_zip_code_prefix
customer_city  VARCHAR
customer_state VARCHAR