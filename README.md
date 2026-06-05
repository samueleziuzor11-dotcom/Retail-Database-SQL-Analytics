# 🛍️ Retail Database SQL Analytics

## 📌 Business Problem
A retail business needed to understand **who their best customers are, which products drive the most revenue, and how sales trend over time** — in order to make smarter decisions around marketing, inventory, and customer retention.

This project builds a full end-to-end analytics pipeline: from SQL querying a relational database, to data modeling in Excel with Power Pivot, to an interactive dashboard for business decision-making.

---

## 🛠️ Tools & Skills Used

| Tool | What I Did |
|---|---|
| **SQL (MySQL)** | Wrote queries across 4 joined tables to extract business insights |
| **Excel + Power Pivot** | Imported SQL data, built data model with table relationships |
| **Data Modeling** | Created connections between customer, orders, products & order items tables |
| **Interactive Dashboard** | Built visual dashboard with slicers and charts in Excel |
| **Word** | Documented full business insights summary report |

---

## 🗄️ Database Structure

The database consists of **4 related tables:**

- `customer_table` — customer details
- `orders_table` — order records per customer
- `order_item_table` — individual items per order
- `products_table` — product info, category and price

---

## 🔍 Key SQL Queries Written

- Total revenue per customer
- Monthly sales trend (2023)
- Top 10 best-selling products by revenue
- Customer segmentation by purchase frequency (High / Mid / Low)
- Average order value per customer (using subquery)
- Revenue by product category
- Identifying repeat customers
- Ranking customers by total spend

---

## 📊 Key Business Insights

### 💰 Revenue per Customer
- **496 customers** in the database
- **Customer 463** was the top spender at **$10,574.98**, followed by Customer 12 ($8,962.93) and Customer 454 ($8,956.73)
- A small group of customers drives a large share of total revenue

### 📅 Monthly Sales Trend
- **July was the highest sales month at $157,828.43**
- February was the lowest at $118,396.95
- Overall trend shows a volatile but generally upward pattern — suggesting possible seasonal or inventory-related fluctuations

### 🏆 Top 10 Best-Selling Products
- **Product 74 (Electronics)** led all products at **$33,286.24**
- The **Home category** dominated the top 10 with the most appearances
- Sales figures across all 10 products are close in range — indicating consistent demand rather than one dominant bestseller

### 👥 Customer Segmentation
- **High Frequency** (10+ orders): Only 1 customer — Customer 86
- **Mid Frequency** (5–9 orders): The bulk of customers — a strong core of regularly engaged buyers
- **Low Frequency** (under 5 orders): Customers not yet in consistent buying habits
- 💡 *Opportunity: Push Mid Frequency customers to High Frequency through loyalty programs*

### 📦 Revenue by Product Category
| Category | Revenue |
|---|---|
| Sports | $401,941.52 |
| Electronics | $379,589.49 |
| Home | $371,403.21 |
| Fashion | $288,271.57 |
| Beauty | $268,877.36 |

- Sports leads by ~$133,000 over Beauty — suggesting marketing could shift toward underperforming categories

### 🔁 Customer Retention
- **487 out of 496 customers (98%+) are repeat buyers** — an exceptionally strong retention rate
- Customer 12 leads with **15 orders AND ranks 2nd in total spend** — making them the most valuable customer overall

---

## 💡 Business Recommendations

1. **Reward top spenders** like Customer 463 and Customer 12 with VIP or loyalty perks
2. **Investigate February and June dips** — possible seasonal patterns or stock issues worth addressing
3. **Invest more in Sports & Electronics** — they consistently outperform other categories
4. **Create campaigns targeting Low Frequency customers** to move them into the Mid tier
5. **Leverage the 98% retention rate** as a business strength in marketing

---

## 📁 Files in This Repository

| File | Description |
|---|---|
| `Retail_Database.sql` | All SQL queries used for analysis |
| `RETAIL_DATABASE.xlsx` | Cleaned data with Power Pivot data model + interactive dashboard |
| `Insights_summary_RD_PROJECT.docx` | Full written business insights report |

---

## 👤 Author
**samueleziuzor11-dotcom**
Aspiring Data Analyst | SQL • Excel • Power BI • Power Pivot | Open to first role
