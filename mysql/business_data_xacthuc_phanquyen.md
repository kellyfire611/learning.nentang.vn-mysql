# Xác thực tài khoản / Đăng nhập Hệ thống (Authentication)
- Người dùng (client) cung cấp 2 tham số như sau:
    - `@email`: email tài khoản cần xác thực
    - `@password`: mật khẩu tài khoản cần xác thực

```sql
-- Xác thực tài khoản
-- 1. Tạo biến và gán giá trị
SET @email := 'phucuong@ctu.edu.vn' COLLATE utf8mb4_unicode_ci;
SET @password := 'Admin@123' COLLATE utf8mb4_unicode_ci;

-- 2. SELECT dữ liệu trong table `acl_users` với điều kiện (WHERE) khớp với 2 biến `@email` và `@password`
-- Nếu: 
-- # Tìm thấy bất kỳ dòng dữ liệu nào (COUNT) > 0 => Xác thực thành công
-- # Nếu không => Xác thực thất bại
SELECT COUNT(*)
FROM `acl_users`
WHERE email = @email AND password = @password;
```

# Kiểm tra Quyền người dùng (Authorize)
- Người dùng (client) cung cấp 2 tham số như sau:
    - `@email`: email tài khoản cần Kiểm tra Quyền

```sql
-- Kiểm tra quyền
-- 1. Tạo biến và gán giá trị
SET @email := 'phucuong@ctu.edu.vn' COLLATE utf8mb4_unicode_ci;

-- Người dùng vời điều kiện @email có ID bao nhiêu?
SET @user_id := 
    (SELECT id
    FROM `acl_users`
    WHERE email = @email
    LIMIT 1);
-- SELECT @user_id;

-- 1. Người dùng thuộc những vai trò nào?
SET @list_role_ids = (
    SELECT GROUP_CONCAT(ar.id)
    FROM `acl_model_has_roles` amhr
    JOIN `acl_roles` ar ON amhr.role_id = ar.id
    WHERE amhr.model_type = 'App\\Models\\Auth\\User' -- Tài khoản Backend
        AND model_id = @user_id);
SELECT @list_role_ids;

-- 2. Vai trò đó có quyền gì?
DROP TABLE IF EXISTS `tmp_list_permissions_via_roles`;
CREATE TEMPORARY TABLE IF NOT EXISTS `tmp_list_permissions_via_roles` AS (
	SELECT ap.*
	FROM `acl_role_has_permissions` arhp
	JOIN `acl_permissions` ap ON arhp.permission_id = ap.id
	WHERE FIND_IN_SET(arhp.role_id, @list_role_ids) > 0
);

-- 3. Người dùng có những quyền gì được cấp riêng biệt không?
SET @list_permission_ids = (
    SELECT GROUP_CONCAT(ap.id)
    FROM `acl_model_has_permissions` amhp
    JOIN `acl_permissions` ap ON amhp.permission_id = ap.id
    WHERE amhp.model_type = 'App\\Models\\Auth\\User' -- Tài khoản Backend
        AND model_id = @user_id);
SELECT @list_permission_ids;

DROP TABLE IF EXISTS `tmp_list_individual_permissions`;
CREATE TEMPORARY TABLE IF NOT EXISTS `tmp_list_individual_permissions` AS (
	SELECT ap.*
	FROM `acl_permissions` ap
	WHERE FIND_IN_SET(ap.id, @list_permission_ids) > 0
);

-- 4. Tổng hợp danh sách các Quyền của người dùng
SELECT * FROM `tmp_list_permissions_via_roles`
UNION ALL
SELECT * FROM `tmp_list_individual_permissions`;

```