# 🧩 E‑Commerce Inventory Analysis | PostgreSQL

**Overview**  
Analyzed real inventory data from Zepto using PostgreSQL. Performed structured EDA, cleaned data, and answered key business questions on stock levels, discounts, product weight tiers, and revenue per category.

---

## 🔍 Contents

1. **Project Context**  
   Explains why inventory insights matter in retail operations.

2. **Data Overview**  
   - Source: Zepto inventory export  
   - Schema: product_id, price, mrp, stock_qty, sold_qty, weight_in_gms, category, etc.

3. **EDA & Data Quality Checks**  
   - Checked row counts, nulls, duplicates  
   - Examined value distributions and anomalies  
   - Documented sample queries via SQL comments

4. **Business Questions & Analysis**  
   - **Stock levels**: Flagged low-stock items (qty < threshold)  
   - **Top discounts**: Identified highest discount% per product  
   - **Weight categories**: Labeled products as light/medium/heavy  
   - **Revenue by category**: Calculated selling_price × stock_qty
   - 
5. **Key Insights**

**Deepest Discounts**

✪.Several products are priced at 30–50% off, which may reflect clearance strategies or margin trade-offs.

**Weight Tier Distribution**

✪.60% of products are classified as light (<500 g)

✪.30% as medium (500–5000 g)

✪.10% as heavy (>5000 g)
This breakdown helps in packaging, logistics, and delivery planning.

**Revenue Potential by Category**
✪.Grocery and personal care categories contribute ~70% of the total inventory value, making them high-priority segments for demand forecasting and promotions.



6. **Tech Stack & SQL Features**  
   - PostgreSQL  
   - Key SQL CONCEPTS: `GROUP BY`, `SUM`, `COUNT`, `CASE`

