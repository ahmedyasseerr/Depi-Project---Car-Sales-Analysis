

CREATE TABLE dim_date (
    date_key      INT PRIMARY KEY,
    full_date     DATE,
    year          INT,
    quarter       INT,
    month         INT,
    month_name    VARCHAR(12),
    day           INT,
    weekday_name  VARCHAR(12)
);

CREATE TABLE dim_make (
    make_id    INT PRIMARY KEY AUTO_INCREMENT,
    make_name  VARCHAR(50)
);

CREATE TABLE dim_model (
    model_id    INT PRIMARY KEY AUTO_INCREMENT,
    make_id     INT,
    model_name  VARCHAR(50),
    FOREIGN KEY (make_id) REFERENCES dim_make(make_id)
);

CREATE TABLE dim_vehicle (
    vehicle_id    INT PRIMARY KEY AUTO_INCREMENT,
    model_id      INT,
    trim          VARCHAR(50),
    body          VARCHAR(30),
    transmission  VARCHAR(20),
    model_year    INT,
    FOREIGN KEY (model_id) REFERENCES dim_model(model_id)
);

CREATE TABLE dim_location (
    location_id  INT PRIMARY KEY AUTO_INCREMENT,
    state_code   VARCHAR(10)
);

CREATE TABLE dim_seller (
    seller_id    INT PRIMARY KEY AUTO_INCREMENT,
    seller_name  VARCHAR(100)
);

CREATE TABLE dim_appearance (
    appearance_id  INT PRIMARY KEY AUTO_INCREMENT,
    color          VARCHAR(20),
    interior       VARCHAR(20)
);

CREATE TABLE fact_sales (
    sale_id          INT PRIMARY KEY AUTO_INCREMENT,
    vin              CHAR(17),
    date_key         INT,
    vehicle_id       INT,
    location_id      INT,
    seller_id        INT,
    appearance_id    INT,
    sale_datetime    DATETIME,
    condition_score  INT,
    odometer         INT,
    mmr              INT,
    selling_price    INT,
    FOREIGN KEY (date_key)      REFERENCES dim_date(date_key),
    FOREIGN KEY (vehicle_id)    REFERENCES dim_vehicle(vehicle_id),
    FOREIGN KEY (location_id)   REFERENCES dim_location(location_id),
    FOREIGN KEY (seller_id)     REFERENCES dim_seller(seller_id),
    FOREIGN KEY (appearance_id) REFERENCES dim_appearance(appearance_id)
);
