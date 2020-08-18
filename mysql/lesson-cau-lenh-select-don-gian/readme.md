# SELECT tất cả các cột (column)

```sql
-- SELECT dữ liệu tất cả các cột (column) và tất cả các dòng dữ liệu (records) có trong table `shop_products`
-- Lưu ý: 
-- 1. Tên bảng (table), và tên cột (column) nên được bao bọc trong cặp dấu `` để đảm bảo câu lệnh truy vấn được thực thi một cách đúng đắn (nếu tên bảng (table) có trùng với các từ khóa trong MySQL vẫn có thể thực thi được).
-- Ví dụ: `shop_products`
SELECT *
FROM `shop_products`
```

```sql
-- SELECT dữ liệu tất cả các cột (column) và tất cả các dòng dữ liệu (records) có trong table `shop_suppliers`
-- Lưu ý: 
-- 1. Tên bảng (table), và tên cột (column) nên được bao bọc trong cặp dấu `` để đảm bảo câu lệnh truy vấn được thực thi một cách đúng đắn (nếu tên bảng (table) có trùng với các từ khóa trong MySQL vẫn có thể thực thi được).
-- Ví dụ: `shop_suppliers`
SELECT *
FROM `shop_suppliers`
```

```sql
-- SELECT chỉ dữ liệu các cột (columns) như `id, supplier_code, supplier_name, created_at` và tất cả các dòng dữ liệu (records) có trong table `shop_suppliers`
-- Lưu ý: 
-- 1. Tên bảng (table), và tên cột (column) nên được bao bọc trong cặp dấu `` để đảm bảo câu lệnh truy vấn được thực thi một cách đúng đắn (nếu tên bảng (table) có trùng với các từ khóa trong MySQL vẫn có thể thực thi được).
-- Ví dụ: `shop_suppliers`
SELECT `id`, `supplier_code`, `supplier_name`, `created_at`
FROM `shop_suppliers`
```

# SELECT WHERE
```sql
-- SELECT dữ liệu tất cả các cột (column) và các dòng dữ liệu (records) có trong table `shop_suppliers` thỏa điều kiện:
-- id = 10 hoặc id = 12 hoặc id = 13
-- Lưu ý: 
-- 1. Tên bảng (table), và tên cột (column) nên được bao bọc trong cặp dấu `` để đảm bảo câu lệnh truy vấn được thực thi một cách đúng đắn (nếu tên bảng (table) có trùng với các từ khóa trong MySQL vẫn có thể thực thi được).
-- Ví dụ: `shop_suppliers`
SELECT *
FROM `shop_suppliers`
WHERE id = 10
  OR id = 12
  OR id = 13;
```

```sql
-- SELECT dữ liệu tất cả các cột (column) và các dòng dữ liệu (records) có trong table `shop_customers` thỏa điều kiện:
-- gender = 1 (là Nữ)
-- Sau đó, sắp xếp dữ liêu theo thứ tự Tăng dần của cột `first_name`
-- Sau đó, chỉ lấy 3 người đầu tiên để trao quà tặng
-- Lưu ý: 
-- 1. Tên bảng (table), và tên cột (column) nên được bao bọc trong cặp dấu `` để đảm bảo câu lệnh truy vấn được thực thi một cách đúng đắn (nếu tên bảng (table) có trùng với các từ khóa trong MySQL vẫn có thể thực thi được).
-- Ví dụ: `shop_customers`
SELECT * 
FROM shop_customers
WHERE gender = 1
LIMIT 0, 3;
```