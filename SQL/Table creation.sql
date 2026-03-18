-- ============================================================
-- CREATE ALL TABLES — FRANCHISE INTELLIGENCE SYSTEM
-- ============================================================

-- Drop tables if they exist (clean start)
DROP TABLE IF EXISTS customer_reviews;
DROP TABLE IF EXISTS staff_records;
DROP TABLE IF EXISTS monthly_performance;
DROP TABLE IF EXISTS daily_transactions;
DROP TABLE IF EXISTS outlet_master;

-- ============================================================
-- TABLE 1: OUTLET MASTER
-- ============================================================
CREATE TABLE outlet_master (
    outlet_id               VARCHAR(10)     PRIMARY KEY,
    city                    VARCHAR(50)     NOT NULL,
    archetype               VARCHAR(20)     NOT NULL,
    tier                    INTEGER         NOT NULL,
    cost_index              DECIMAL(5,2)    NOT NULL,
    demand_index            DECIMAL(5,2)    NOT NULL,
    outlet_open_date        DATE,
    outlet_age_months       INTEGER,
    seating_capacity        INTEGER,
    franchise_fee_paid      BOOLEAN,
    zone                    VARCHAR(20),
    outlet_type             VARCHAR(20)
);

-- ============================================================
-- TABLE 2: DAILY TRANSACTIONS
-- ============================================================
CREATE TABLE daily_transactions (
    transaction_id              VARCHAR(15)     PRIMARY KEY,
    outlet_id                   VARCHAR(10)     REFERENCES outlet_master(outlet_id),
    transaction_date            DATE            NOT NULL,
    transaction_time            TIME,
    day_of_week                 VARCHAR(15),
    month                       VARCHAR(10),
    is_weekend                  SMALLINT,
    is_holiday                  SMALLINT,
    order_channel               VARCHAR(20),
    order_type                  VARCHAR(20),
    item_category               VARCHAR(20),
    items_ordered               INTEGER,
    gross_amount                DECIMAL(10,2),
    discount_applied            DECIMAL(10,2),
    net_amount                  DECIMAL(10,2),
    food_cost                   DECIMAL(10,2),
    packaging_cost              DECIMAL(10,2),
    aggregator_commission       DECIMAL(10,2),
    contribution_margin         DECIMAL(10,2),
    payment_method              VARCHAR(20),
    delivery_time_mins          INTEGER,
    prep_time_mins              INTEGER,
    distance_km                 DECIMAL(5,2),
    customer_id                 VARCHAR(15),
    is_repeat_customer          SMALLINT,
    is_new_customer             SMALLINT,
    customer_rating             DECIMAL(3,1),
    had_complaint               SMALLINT,
    upsell_taken                SMALLINT,
    staff_on_shift              INTEGER,
    kitchen_utilization_pct     DECIMAL(4,2),
    waste_flag                  SMALLINT
);

-- ============================================================
-- TABLE 3: MONTHLY PERFORMANCE
-- ============================================================
CREATE TABLE monthly_performance (
    outlet_id                   VARCHAR(10)     REFERENCES outlet_master(outlet_id),
    month                       VARCHAR(10)     NOT NULL,
    total_orders                INTEGER,
    revenue                     DECIMAL(12,2),
    gross_revenue               DECIMAL(12,2),
    total_discount              DECIMAL(12,2),
    total_food_cost             DECIMAL(12,2),
    total_packaging_cost        DECIMAL(12,2),
    total_agg_commission        DECIMAL(12,2),
    total_contribution          DECIMAL(12,2),
    avg_order_value             DECIMAL(10,2),
    avg_delivery_time           DECIMAL(6,2),
    avg_prep_time               DECIMAL(6,2),
    avg_rating                  DECIMAL(3,2),
    total_complaints            INTEGER,
    total_waste_flags           INTEGER,
    repeat_customers            INTEGER,
    new_customers               INTEGER,
    upsell_orders               INTEGER,
    is_weekend_orders           INTEGER,
    is_holiday_orders           INTEGER,
    food_cost_pct               DECIMAL(6,2),
    packaging_cost_pct          DECIMAL(6,2),
    commission_cost_pct         DECIMAL(6,2),
    discount_pct                DECIMAL(6,2),
    contribution_margin_pct     DECIMAL(6,2),
    complaint_rate              DECIMAL(6,2),
    waste_rate                  DECIMAL(6,2),
    repeat_customer_pct         DECIMAL(6,2),
    upsell_rate                 DECIMAL(6,2),
    tier                        INTEGER,
    city                        VARCHAR(50),
    archetype                   VARCHAR(20),
    outlet_type                 VARCHAR(20),
    zone                        VARCHAR(20),
    rental_cost                 DECIMAL(12,2),
    net_margin                  DECIMAL(12,2),
    net_margin_pct              DECIMAL(6,2),
    month_num                   INTEGER,
    PRIMARY KEY (outlet_id, month)
);

-- ============================================================
-- TABLE 4: STAFF RECORDS
-- ============================================================
CREATE TABLE staff_records (
    outlet_id               VARCHAR(10)     REFERENCES outlet_master(outlet_id),
    month                   VARCHAR(10)     NOT NULL,
    total_staff             INTEGER,
    new_joinings            INTEGER,
    resignations            INTEGER,
    turnover_pct            DECIMAL(5,1),
    avg_experience_months   INTEGER,
    training_hours          DECIMAL(5,1),
    manager_change          SMALLINT,
    overtime_hours          DECIMAL(5,1),
    absenteeism_pct         DECIMAL(5,1),
    PRIMARY KEY (outlet_id, month)
);

-- ============================================================
-- TABLE 5: CUSTOMER REVIEWS
-- ============================================================
CREATE TABLE customer_reviews (
    review_id               VARCHAR(15)     PRIMARY KEY,
    outlet_id               VARCHAR(10)     REFERENCES outlet_master(outlet_id),
    review_date             DATE,
    platform                VARCHAR(20),
    rating                  INTEGER,
    review_category         VARCHAR(30),
    sentiment_score         DECIMAL(4,2),
    is_complaint            SMALLINT,
    was_resolved            SMALLINT,
    response_time_hours     DECIMAL(6,1),
    archetype               VARCHAR(20)
);

-- Verify all tables created
SELECT table_name, 
       (SELECT COUNT(*) FROM information_schema.columns 
        WHERE table_name = t.table_name) AS column_count
FROM information_schema.tables t
WHERE table_schema = 'public'
ORDER BY table_name;