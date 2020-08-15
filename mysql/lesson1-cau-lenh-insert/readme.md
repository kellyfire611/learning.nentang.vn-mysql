

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

Ví dụ:
```sql
-- INSERT dữ liệu vào table `shop_suppliers` (cách tường minh)
-- Lưu ý: 
-- 1. nếu muốn truyền dữ liệu là chuỗi UNICODE (tức là có gõ dấu tiếng Việt)
--    chúng ta phải sử dụng tiền tố N trước chuỗi giá trị cần truyền
--    Ví dụ: N'Điện thoại BPhone'
-- 2. Đối với dữ liệu ngày tháng, MYSQL nhận vào chuỗi theo định dạng sau YYYY-MM-DD HH:mm:ss
--                                                          tức là Năm(4 số)-Tháng-Ngày Giờ:Phút:Giây
INSERT INTO shop_suppliers(id, supplier_code, supplier_name, description, image, created_at, updated_at)
VALUES (13, 'SUP13', 'VinPhone', N'Điện thoại VinPhone', 'suppliers/vinphone.jpg', '2020-08-08 12:45:00', NULL)
```

## 3. Thêm dữ liệu vào các bảng (tables) `suppliers`, `categories`, `products`
### Cho dữ liệu như sau:

### Câu lệnh Query:
```sql
-- 1. INSERT dữ liệu cho bàng cha (master/parent table) `suppliers`

```