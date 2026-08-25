# GPT Agent (Windows)

Bản phát hành này chứa file thực thi **được chia nhỏ** (`.part000`, `.part001`, ...).
Bạn cần **ghép lại** để tạo `gpt_agent.exe`, lấy **HDID** để nhận **license `.json`**, và (nếu chưa có) cài **ngrok** một lần.

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
- Chương trình sẽ tạo các file cần thiết cho setup → mở và làm theo **`SETUP_README.md`**
- **Lưu ý:** `gpt_agent.exe` và `start_ngrok.bat` cần chạy **đồng thời**.
