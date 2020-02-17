# 1. Danh sách top 5 các Sản phẩm Nổi bật
Lấy danh sách các Sản Phẩm với các điều kiện:
- Là Sản phẩm Nổi bật
- Hiển còn đang kinh doanh
- Còn đủ số lượng để Đặt hàng

Thông tin hiển thị như sau:
| ID | Tên sản phẩm | Hình ảnh đại diện | Mô tả ngắn | Giá niêm yết | Khuyến mãi (nếu có) |

```sql
SELECT p.id, p.product_name, p.image, p.short_description, p.list_price
	, pd.discount_name, pd.discount_amount, pd.id_fixed, pd.start_date, pd.end_date
	, c.category_name
	, s.supplier_name
FROM shop_products p
JOIN shop_categories c ON p.category_id = c.id
JOIN shop_suppliers s ON p.supplier_id = s.id
LEFT JOIN shop_product_discounts pd ON pd.product_id = p.id
WHERE p.is_featured = TRUE
	AND p.discontinued = FALSE
	AND p.quantity_per_unit > 0    
LIMIT 0,5
```

# 2. Danh sách top 5 các Sản phẩm Mới nhập về
Lấy danh sách các Sản Phẩm với các điều kiện:
- Là Sản phẩm Mới
- Hiển còn đang kinh doanh
- Còn đủ số lượng để Đặt hàng

Thông tin hiển thị như sau:
| ID | Tên sản phẩm | Hình ảnh đại diện | Mô tả ngắn | Giá niêm yết | Khuyến mãi (nếu có) |

```sql
SELECT p.id, p.product_name, p.image, p.short_description, p.list_price
	, pd.discount_name, pd.discount_amount, pd.id_fixed, pd.start_date, pd.end_date
	, c.category_name
	, s.supplier_name
FROM shop_products p
JOIN shop_categories c ON p.category_id = c.id
JOIN shop_suppliers s ON p.supplier_id = s.id
LEFT JOIN shop_product_discounts pd ON pd.product_id = p.id
WHERE p.is_new = TRUE
	AND p.discontinued = FALSE
	AND p.quantity_per_unit > 0    
LIMIT 0,5
```

# 3. Danh sách tất cả Sản phẩm đang có trong hệ thống
Lấy danh sách các Sản Phẩm với các điều kiện:
- Là Sản phẩm Mới
- Hiển còn đang kinh doanh
- Còn đủ số lượng để Đặt hàng

Thông tin hiển thị như sau:
| ID | Tên sản phẩm | Hình ảnh đại diện | Mô tả ngắn | Giá niêm yết | Khuyến mãi (nếu có) |

Danh sách cần phân trang:
- Mỗi trang 6 sản phẩm

- Người dùng (client) cung cấp 2 tham số như sau:
    - `@limit`: số mẫu tin (records) tối đa cần lấy trong 1 trang
    - `@page`: người dùng muốn xem trang mấy?

```sql
-- 1. Tạo biến và gán giá trị
SET @limit := 6;	-- Mỗi trang có tối đa 6 mẫu tin
SET @page := 1;	-- Người dùng muốn xem trang 1

-- 2. Tính Offset theo công thức: 
--  @offset := (@limit * (@page - 1));
--             (   6   * (  1   - 1)) = 0
SET @offset := (@limit * (@page - 1));
SELECT @LIMIT, @PAGE, @OFFSET;

-- 3. SELECT dữ liệu, với thông số Offset và Limit được tính toán bên trên
SELECT p.id, p.product_name, p.image, p.short_description, p.list_price
	, pd.discount_name, pd.discount_amount, pd.id_fixed, pd.start_date, pd.end_date
	, c.category_name
	, s.supplier_name
FROM shop_products p
JOIN shop_categories c ON p.category_id = c.id
JOIN shop_suppliers s ON p.supplier_id = s.id
LEFT JOIN shop_product_discounts pd ON pd.product_id = p.id
WHERE p.discontinued = FALSE
	AND p.quantity_per_unit > 0    
-- LIMIT @offset, @limit;
LIMIT 0, 6;
```