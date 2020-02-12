

## 1. Thêm dữ liệu vào bảng (table) `categories`
### Cho dữ liệu sau:

### Câu lệnh Query:
- Insert có dữ liệu cột ID: trường hợp này dùng để INSERT dữ liệu với giá trị ID cụ thể, thường dùng với các dữ liệu dạng cứng (fixed).
```sql
-- Insert với dữ liệu cột ID
INSERT INTO categories
	(id, category_code, category_name, description, image)
	VALUES (NULL, '', '', '', '');
```

- Insert với dữ liệu cột ID do MySQL tự sinh: không cần set cột ID cụ thể (để MySQL database tự sinh), thường dùng khi IMPORT dữ liệu từ file dữ liệu của người dùng (Excel, CSV, TXT...)
```sql
-- Insert không có dữ liệu cột ID
INSERT INTO categories
	(category_code, category_name, description, image)
	VALUES ('', '', '', '');
```

## 2. Thêm dữ liệu vào bảng (table) `suppliers`
### Cho dữ liệu sau:

### Câu lệnh Query:
```sql
-- Insert với dữ liệu cột ID
INSERT INTO suppliers
	(id, supplier_code, supplier_name, description, image)
	VALUES (NULL, '', '', '', '')
```

## 3. Thêm dữ liệu vào các bảng (tables) `suppliers`, `categories`, `products`
### Cho dữ liệu như sau:

### Câu lệnh Query:
```sql
-- 1. INSERT dữ liệu cho bàng cha (master/parent table) `suppliers`

```