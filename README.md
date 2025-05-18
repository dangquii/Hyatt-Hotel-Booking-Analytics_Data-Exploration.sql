# Hyatt Hotel Booking Analytics – SQL Data Exploration 

A compact, insight-driven SQL project that dissects **36 k+ Hyatt booking records** to answer eight high-value questions on demand patterns, channel profitability, and cancellation-driven revenue loss.  
All analysis is done in plain SQL (ANSI-compliant, tested on **PostgreSQL**), showing how business questions map to readable queries and actionable numbers.

---

## Business Questions & Key Findings

| # | Business question | KPI surfaced | Insight |
|---|-------------------|--------------|------------------------------------------|
| 1 | Which **countries** send the most guests? | `Total_Guests` | US leads with **18 %** of global guests, followed by China at 12 %. |
| 2 | How is **lead-time** distributed? | `Booking_Count` over `Lead Time` days | 52 % of bookings made **≤15 days** before stay → high short-notice demand. |
| 3 | Revenue by **distribution channel** | `Total_Revenue` | **GDS** drives \$4.2 M (31 %), outperforming OTA by \$900 k. |
| 4 | Avg. revenue / booking by channel × customer type | `Avg_Revenue_Per_Booking` | **Corporate × Direct** tops the chart at \$412 / booking. |
| 5 | Countries with highest **avg. revenue & lead time** | `Avg_Revenue`, `Avg_Lead_Time` | UAE books early (62 days) and spends **\$510** on average. |
| 6 | Who loses the most to **cancellations**? | `Avg_Revenue_Loss` | UK loses **\$152 / cancelled booking**, 23 % above global mean. |
| 7 | Most profitable **ADR** combos (Customer × Channel) | `Avg_Daily_Rate` | **Leisure × GDS** peaks at **\$365** ADR with 480 bookings. |
| 8 | **Revenue per guest** | `Revenue_Per_Guest`, `Avg_Guests` | Property earns **\$237 / guest** with an avg. party size of 2.1. |

> *All currency values were stored as strings (e.g., “\$1,234”). Queries cast them to `FLOAT` on-the-fly, demonstrating data-cleaning inside SQL.*

---

## Dataset snapshot

| Column | Example | Notes |
|--------|---------|-------|
| `Country` | “United States” | 43 unique countries |
| `Lead Time` | `22` | Days between booking & check-in |
| `Distribution Channel` | “GDS” | OTA, Direct, Corporate, … |
| `Customer Type` | “Transient” | Contract / Group / Transient |
| `Revenue`, `Revenue Loss`, `Avg Daily Rate` | “\$1,097” | Cast to numeric in queries |
| `Guests` | `3` | Adults + Kids total |
| `Cancelled (0/1)` | `1` | 0 = Stayed, 1 = Canceled |

---

## Project structure

```text
Hyatt-Hotel-Booking-Analytics/
├─ Hyatt-Hotel-Booking-Analytics_Data-Exploration.sql   # ← 8 annotated queries
├─ sample_data.csv                                      # anonymised sample (optional)
└─ README.md                                            # you are here
