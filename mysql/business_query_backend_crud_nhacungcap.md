
# Select Danh sách Nhà cung cấp
```sql
SELECT id, supplier_code, supplier_name, description, image, created_at, updated_at
	FROM shop_suppliers
```

# Thêm mới 1 dòng dữ liệu vào table `suppliers`
```sql
INSERT INTO shop_suppliers
	(id, supplier_code, supplier_name, description, image, created_at, updated_at)
	VALUES (NULL, '', '', '', '', NOW(), NOW())
```

# Sửa 1 dòng dữ liệu trong table `suppliers`
```sql
UPDATE shop_suppliers
	SET
		id=NULL,
		supplier_code='',
		supplier_name='',
		description='',
		image='',
		created_at=NOW(),
		updated_at=NOW()
	WHERE id=NULL
```

# Xóa 1 dòng dữ liệu trong table `suppliers`
```sql
DELETE FROM shop_suppliers WHERE id=NULL
```