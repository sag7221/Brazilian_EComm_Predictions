create table customers(
customer_id  varchar primary key,
customer_unique_id varchar,
customer_zip_code_prefix int,
customer_city  varchar,
customer_state varchar);

create table orders(
order_id varchar primary key,
customer_id varchar references customers (customer_id),
order_status varchar,
order_purchase_timestamp date,
order_approved_at date,
order_delivered_carrier_date date,
order_delivered_customer_date date,
order_estimated_delivery_date date);

create table geolocation(
geolocation_zip_code_prefix int, -- dups
geolocation_lat float8,
geolocation_lng float8,
geolocation_city varchar,
geolocation_state varchar);

create table sellers(
seller_id varchar primary key,
seller_zip_code int,
seller_city varchar,
seller_state varchar);

create table products(
product_id varchar primary key,
product_category_name varchar,
product_name_lenght int,
product_description_lengh int,
product_photos_qty int,
product_weight_g int,
product_length_cm int,
product_height_cm int,
product_width_cm int);

create table order_items(
order_id varchar references orders (order_id),
order_item_id int, -- dups
product_id varchar references products (product_id),
seller_id varchar references sellers (seller_id),
shipping_limit_date date,
price float,
freight_value float);

create table order_payments(
order_id varchar references orders (order_id),
payment_sequential int,
payment_type varchar,
payment_installments int,
payment_value float);

create table order_reviews(
review_id varchar, -- dups
order_id varchar references orders (order_id),
review_score int,
review_comment_title varchar, 
review_comment_message varchar,
review_creation_date date,
review_answer_timestamp date);

create table product_translation(
product_category_name varchar,
product_category_name_english varchar);
