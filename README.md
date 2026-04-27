# 🚀 LaTeX Resume Builder Script

Một bộ công cụ script giúp tự động hóa việc build CV từ LaTeX tại máy local, giải phóng bạn khỏi sự phụ thuộc vào các trình biên tập online như Overleaf.

## 💡 Tại sao tôi tạo ra repo này?

Việc sử dụng **Overleaf** rất tiện lợi, nhưng nó có những hạn chế nhất định:
- **Giới hạn lượt compile**: Tài khoản miễn phí bị giới hạn số lần biên dịch (compile) ra PDF.
- **Phụ thuộc internet**: Không thể làm việc khi không có mạng.
- **Tốc độ**: Compile local thường nhanh hơn và linh hoạt hơn trong việc quản lý file.

Repo này cung cấp các script giúp bạn compile LaTeX chuyên nghiệp ngay trên máy tính của mình chỉ với một dòng lệnh.

## 🛠️ Tính năng
- **Tự động hóa hoàn toàn**: Một lệnh duy nhất để build PDF và dọn dẹp file rác.
- **Thông minh**: Tự động nhận diện file chính (`main.tex` hoặc `resume.tex`).
- **Sạch sẽ**: Tất cả file PDF kết quả được gom vào thư mục `scripts/pdf/`, giữ cho thư mục gốc luôn gọn gàng.
- **Đa nền tảng**: Hỗ trợ cả macOS/Linux (`.sh`) và Windows (`.bat`).

---

## 🚀 Hướng dẫn sử dụng

### 1. Cài đặt LaTeX (Nếu chưa có)
Bạn cần cài đặt một bản phân phối LaTeX trên máy:
- **macOS**: `brew install --cask mactex-no-gui`
- **Windows**: [MiKTeX](https://miktex.org/download) hoặc [TeX Live](https://www.tug.org/texlive/).
- **Linux**: `sudo apt-get install texlive-full`

### 2. Tải Template CV
Bạn có thể tìm và tải các template đẹp từ: [Overleaf LaTeX Templates](https://www.overleaf.com/latex/templates).

**Một số gợi ý:**
- **Template tôi đang dùng**: [SWE Resume Template](https://www.overleaf.com/latex/templates/swe-resume-template/bznbzdprjfyy)
- **Data Science/Tech**: [Data Science Tech Resume](https://www.overleaf.com/latex/templates/data-science-tech-resume-template/zcdmpfxrzjhv)
- **Minimalist**: [Harshibar's Resume](https://www.overleaf.com/latex/templates/harshibars-resume/sbcyynmtpnyd)
- **Network Engineer**: [Personal Resume of Shriram Jadhav](https://www.overleaf.com/latex/templates/personal-resume-of-shriram-jadhav-network-engineer/zzcxzhmqyddy)

### 3. Tích hợp Script vào Project của bạn
Có 2 cách để bắt đầu:

**Cách A: Copy script vào template (Khuyên dùng)**
1. Tải template từ Overleaf về máy và giải nén.
2. Clone repo này về: `git clone https://github.com/your-username/resume-builder-script.git`
3. Copy thư mục `scripts/` từ repo này vào thư mục template bạn vừa tải.

**Cách B: Sử dụng trực tiếp trên repo này**
1. Clone repo này về.
2. Chỉnh sửa nội dung trong file `resume.tex` hoặc thay thế bằng nội dung template của bạn.

### 4. Build CV
Mở terminal tại thư mục gốc của project và chạy:

**macOS / Linux:**
```bash
chmod +x scripts/build.sh
./scripts/build.sh "Ten_File_CV_Cua_Ban"
```

**Windows:**
```batch
scripts\build.bat "Ten_File_CV_Cua_Ban"
```

*Mặc định script sử dụng `pdfLaTeX`. Nếu template của bạn yêu cầu `XeLaTeX` (thường là các template dùng font hệ thống custom), hãy thêm flag `--xe`:*
```bash
./scripts/build.sh "Ten_File_CV_Cua_Ban" --xe
```

---

## 🛠️ Xử lý lỗi thường gặp (Troubleshooting)

### 1. Lỗi `Undefined control sequence \pdfglyphtounicode`
Lỗi này xảy ra khi bạn dùng template cũ của `pdfLaTeX` nhưng lại compile bằng `XeLaTeX`.
- **Cách sửa**: Chạy script **không có** flag `--xe`. Script sẽ mặc định dùng `pdfLaTeX` và lỗi này sẽ biến mất.

### 2. Lỗi font không tìm thấy
Nếu bạn dùng flag `--xe` và gặp lỗi không tìm thấy font:
- Đảm bảo bạn đã cài đặt font đó vào máy (Windows Fonts hoặc Font Book trên macOS).
- Hoặc kiểm tra xem template có đi kèm file font (`.ttf`, `.otf`) không.

---

## 📝 Lưu ý về file đầu vào
Script được thiết kế để tự động tìm file `main.tex` hoặc `resume.tex`. Nếu template của bạn sử dụng một tên file khác, hãy đảm bảo chỉ có duy nhất một file `.tex` ở thư mục gốc, hoặc đổi tên file chính thành `main.tex` để script hoạt động chính xác nhất.

## 📄 License
Project này được public dưới dạng mã nguồn mở theo license MIT.
