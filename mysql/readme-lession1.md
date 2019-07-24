

## 1. Tìm nhà sản xuất không bán được sản phẩm nào trong Hệ thống?
```sql
SELECT * 
FROM suppliers s
WHERE s.id NOT IN (
	SELECT distinct p.supplier_id
	FROM order_details od
	JOIN products p ON od.product_id = p.id
);
```

## 2. Tìm top 3 Khách hàng mua nhiều nhất trong năm nay để tri ân khách hàng?
```sql
SELECT *
FROM (
	SELECT concat(c.first_name, ' ', c.last_name) AS full_name, COUNT(*) AS order_count
	FROM customers c
	JOIN orders o ON o.customer_id = c.id
	GROUP BY c.id
) AS tmp
ORDER BY tmp.order_count DESC
LIMIT 3;
```

## 3. Sản phẩm nào đã quá lâu không có khách hàng mua?

```sql
select sp.sp_ten, sp.sp_gia, sp.sp_ngaycapnhat
from sanpham sp
where sp.sp_ma not in (
	select distinct sp_ma
	from sanpham_dondathang ddh
)
order by sp.sp_ngaycapnhat ASC;
```

## 4. Hình thức thanh toán phổ biến nhất là gì?
```
```