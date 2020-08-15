

## 1. Cập nhật dữ liệu trong bảng (table) `categories`
```sql
-- UPDATE dữ liệu trong table `shop_suppliers` với điều kiện id=6
UPDATE `shop_suppliers`
SET	supplier_code='SUP_GOOGLE',
		supplier_name='Google Company',
		description=N'Công ty Google, công cụ Search nổi tiếng',
		image='suppliers/google_new_logo.jpg',
		updated_at='2020-08-15 12:51:53'
WHERE id=6;
```


```sql
-- DELETE dữ liệu trong table `shop_suppliers` với điều kiện id=10, id=12, id=13
DELETE FROM `shop_suppliers`
WHERE id=10
	OR id=12
	OR id=13;
```