
# Báo cáo Doanh thu trong Khoảng thời gian
- Người dùng (client) cung cấp 2 tham số như sau:
    - `@from_date`: Báo cáo từ ngày, theo định dạng `yyyy-mm-dd HH:mm:ss`
    - `@to_date`: Báo cáo đến ngày, theo định dạng `yyyy-mm-dd HH:mm:ss`

```sql

```

# Top 5 Sản phẩm có Doanh thu cao nhất
```sql
SET @from_date := '2017-01-01 00:00:00';
SET @to_date := '2019-12-31 23:59:59';

SELECT (od.quantity * od.unit_price) * ((100 - od.discount) / 100)
FROM shop_orders o
JOIN shop_order_details od ON od.order_id = o.id
JOIN shop_products p ON od.product_id = p.id
WHERE o.order_date BETWEEN @from_date AND @to_date;


```