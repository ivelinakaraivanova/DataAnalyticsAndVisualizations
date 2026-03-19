# Brief Notes – Applied Logic

## Part 1: SQL Views
- **v_Product_Enriched**: LEFT JOIN products → categories → suppliers to keep products even without a category/supplier. Excluded redundant columns. Aliased supplier company_name as "Supplier".
- **v_Order_Sales**: INNER JOIN orders → order_details. Calculated `Total Line Amount = unit_price * quantity * (1 - discount)`, cast to numeric and rounded.
- **v_Customer_Geo**: Selected geographic fields (City, Country) plus Company Name and Contact Name. No active/inactive filter — Northwind has no such column. Excluded sensitive fields (phone, fax, address).

## Part 2: Data Model
- **Star Schema**: Sales (fact) center, linked to Customers, Products, Employees, Shippers, Dates (dimensions).
- **Relationships**: All one-to-many, single direction, from dimension to fact.
- **Hidden columns:** All ID/FK columns used only for relationships were hidden from report view to keep the field list clean for business users.
- **Calendar Table**: DAX `CALENDAR()`, marked as Date Table. Added Month, Month Number, Year columns.
- **Calculated Columns**: `Full Name` (Employees), `Month`/`Year` (Dates). Hidden technical keys from Report view.

## Part 3: DAX Measures
- All measures use **VAR** for readability and **DIVIDE** for safe division.
- Organized into Display Folders: Basic Measures, Time Intelligence, Business Logic.

## Part 4: Dashboard Pages
| Page | Visuals | Key Features |
|---|---|---|
| **1 - Executive Overview** | 4 KPI cards, line chart, map, donut chart, year slicer | YoY Growth % with conditional coloring (blue/red). Line chart compares current vs previous year. A Year slicer controls which year is "current". |
| **2 - Detailed Analysis** | Bar chart (Top 10), column chart (by Employee), decomposition tree, 3 slicers | Top N filter on bar chart. Decomposition tree: Category → Product → Customer. |
| **3 - Order Details** | Detail table, dynamic title card, back button | Drill-through by Product Name. Dynamic title shows drilled product via HASONEVALUE. |

- **Navigation**: Page buttons on Pages 1 & 2. Back button on Page 3.

