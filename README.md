# GPT Agent (Windows)

Bản phát hành này chứa file thực thi **được chia nhỏ** (`.part000`, `.part001`, ...).
Bạn cần **ghép lại** để tạo `gpt_agent.exe` và lấy **HDID** để nhận **license `.json`**.

---

## 1) Ghép file thành `gpt_agent.exe`

- Tải **đầy đủ** các file `.part***` về **cùng 1 thư mục**
- **Double-click `merge.bat`**
- Sau khi xong sẽ có:
  ```
  gpt_agent.exe
  ```

---

## 2) Lấy HDID & cài license

1. **Double-click `get_hdid.exe`** → copy **HDID**
2. Gửi HDID cho **nhà cung cấp** để nhận **license `.json`**
3. Đặt file license `.json` **cạnh** `gpt_agent.exe`

Ví dụ:

```
gpt_agent.exe
license.json
```

---

## 3) Chạy & setup

- **Double-click `gpt_agent.exe`**
- Vui lòng đọc các file README (ví dụ **`SETUP_README.md`**) để biết thêm chi tiết cài đặt và sử dụng.
