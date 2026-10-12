<div align="center">

<img src="./assets/backend-os-banner.svg" alt="Backend OS animated banner" width="100%">

<h1>Backend OS</h1>

<p><strong>Local orchestration kernel for OpenAI-compatible clients</strong></p>

<p>Kết nối client qua API tương thích và MCP SSE với các browser worker được Chrome Extension đăng ký.</p>

<p>
  <img src="https://img.shields.io/badge/Platform-Windows-0078D4?style=flat-square" alt="Windows">
  <img src="https://img.shields.io/badge/Delivery-Portable-2EA44F?style=flat-square" alt="Portable delivery">
  <img src="https://img.shields.io/badge/License-Required-F59E0B?style=flat-square" alt="License required">
</p>

<p><strong>Client request vào. Kernel dispatch. Worker stream kết quả.</strong></p>

</div>

<br>

<img src="./assets/backend-os-architecture.svg" alt="Backend OS kernel and Chrome worker pipeline" width="100%">

<br>

<table align="center">
  <tr>
    <td align="center" width="33%"><strong>CLIENT HARNESS</strong><br><sub>OpenAI-compatible API hoặc MCP/SSE client</sub></td>
    <td align="center" width="33%"><strong>BACKEND OS KERNEL</strong><br><sub>Auth, normalize, dispatch và stream</sub></td>
    <td align="center" width="33%"><strong>CHROME WORKER</strong><br><sub>MV3 extension điều khiển browser tab</sub></td>
  </tr>
</table>

## Backend OS là gì?

Backend OS là một **kernel orchestration chạy local**. Kernel nhận request từ client, chuẩn hóa payload, dispatch công việc tới browser worker và stream kết quả ngược về client.

Các endpoint chính:

```text
Client harness
  ├─ POST /v1/chat/completions
  └─ MCP SSE /mcp/sse
          ↓
BackendOS Kernel :3210
  ├─ authenticate + normalize + dispatch
  ├─ coordinate /v1/swarm/*
  └─ stream results via SSE
          ↓
Chrome Extension worker
  ├─ register browser tab, provider and role
  ├─ receive pending tasks
  └─ harvest / stream results
```

## Cài đặt bản phát hành Windows

<details>
<summary><strong>Mở hướng dẫn cài đặt</strong></summary>

Sau khi khởi chạy, kernel mặc định lắng nghe tại `http://127.0.0.1:3210`.

### 1. Chuẩn bị các file

Tải đầy đủ các file dưới đây về **cùng một thư mục**:

```text
Backend-OS/
├─ manifest.json
├─ gpt_agent.exe.part001
├─ gpt_agent.exe.part002
├─ merge.bat
├─ get_hdid.exe
└─ ...
```

`manifest.json` là nguồn thông tin cho tên file output, thứ tự các part và SHA-256 cần kiểm tra.

### 2. Ghép executable

Double-click:

```text
merge.bat
```

Script sẽ ghép các part thành:

```text
gpt_agent.exe
```

Sau khi ghép, script tự tính SHA-256 của file output và dừng nếu không khớp với `manifest.json`.

### 3. Lấy HDID và đặt license

1. Double-click `get_hdid.exe`.
2. Copy HDID hiển thị trong cửa sổ.
3. Gửi HDID cho nhà cung cấp để nhận license `.json`.
4. Đặt file license cạnh executable:

```text
gpt_agent.exe
license.json
```

### 4. Khởi chạy

Double-click `gpt_agent.exe` sau khi license đã được đặt đúng vị trí.

</details>

## Các file chính

| File | Vai trò |
| --- | --- |
| `manifest.json` | Mô tả artifact, thứ tự part và các giá trị SHA-256. |
| `gpt_agent.exe.part*` | Các phần được chia nhỏ của executable. |
| `merge.bat` | Lệnh Windows để ghép và xác thực executable. |
| `merge.ps1` | Wrapper PowerShell cho thao tác ghép file. |
| `get_hdid.exe` | Công cụ lấy HDID của máy. |
| `license.json` | License do nhà cung cấp cấp, đặt cạnh executable. |

<div align="center">

<br>

<strong>Model in. API out. Client-compatible by design.</strong>

</div>
