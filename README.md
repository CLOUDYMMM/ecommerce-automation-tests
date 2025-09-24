# Robot Framework E-commerce Testing Project

โปรเจคทดสอบระบบ E-commerce ด้วย Robot Framework สำหรับการทดสอบการเข้าสู่ระบบ การค้นหาสินค้า และการสั่งซื้อสินค้า

## 📋 ภาพรวมโปรเจค

โปรเจคนี้เป็นชุดทดสอบอัตโนมัติสำหรับเว็บไซต์ E-commerce ที่ทดสอบฟีเจอร์หลักๆ ดังนี้:
- การเข้าสู่ระบบ (Sign In)
- การค้นหาสินค้า (Product Search)
- การเพิ่มสินค้าลงตะกร้า (Add to Cart)
- การจัดการตะกร้าสินค้า (Cart Management)
- การคำนวณราคารวม (Checkout Calculation)

## 🛠️ เทคโนโลยีที่ใช้

- **Robot Framework** - Framework สำหรับการทดสอบอัตโนมัติ
- **SeleniumLibrary** - Library สำหรับควบคุม Web Browser
- **Selenium WebDriver** - สำหรับควบคุม Edge Browser
- **Python** - ภาษาที่ใช้ในการเขียน Test Scripts

## 📁 โครงสร้างโปรเจค

```
robot_tests - Login/
├── demo.robot                 # ไฟล์ทดสอบตัวอย่าง
├── TestCase.robot            # ไฟล์ทดสอบหลัก
├── requirements.txt          # รายการ dependencies
├── resource/
│   ├── Keywords.robot        # คำสั่งที่ใช้ในการทดสอบ
│   └── Variables.robot       # ตัวแปรและ locators
├── results/                  # ผลลัพธ์การทดสอบ
├── screenshots/              # ภาพหน้าจอระหว่างการทดสอบ
└── venv/                     # Python Virtual Environment
```

## 🚀 การติดตั้งและใช้งาน

### 1. ติดตั้ง Dependencies

```bash
# สร้าง Virtual Environment
python -m venv venv

# เปิดใช้งาน Virtual Environment
# Windows
venv\Scripts\activate
# Linux/Mac
source venv/bin/activate

# ติดตั้ง packages
pip install -r requirements.txt
```

### 2. ติดตั้ง WebDriver

ดาวน์โหลดและติดตั้ง Edge WebDriver:
- ดาวน์โหลดจาก: https://developer.microsoft.com/en-us/microsoft-edge/tools/webdriver/
- วางไฟล์ `msedgedriver.exe` ใน `C:/WebDrivers/Edge/`
- หรือแก้ไข path ในไฟล์ `resource/Variables.robot`

### 3. รันการทดสอบ

```bash
# รันการทดสอบทั้งหมด
robot TestCase.robot

# รันการทดสอบเฉพาะ test case
robot -t "TC-0001*" TestCase.robot

# รันการทดสอบพร้อมสร้าง report
robot --outputdir results TestCase.robot
```

## 📝 Test Cases

### TC-0001: Add to cart and checkout cart with mug search
- ทดสอบการค้นหา "mug" ผ่าน search suggestion
- เพิ่ม White Ceramic Mug จำนวน 3 ชิ้นลงตะกร้า
- ตรวจสอบการคำนวณราคารวม
- ใช้คูปอง "General12345"
- ลบสินค้าออกจากตะกร้า

### TC-0002: Add to cart and Checkout Cart with Ceramic Mug search
- ทดสอบการค้นหา "ceramic mug" ผ่าน search button
- เพิ่ม White Ceramic Mug จำนวน 3 ชิ้นลงตะกร้า
- ตรวจสอบการคำนวณราคารวม
- ใช้คูปอง "General12345"
- ลบสินค้าออกจากตะกร้า

## 🔧 การกำหนดค่า

### ตัวแปรสำคัญใน `resource/Variables.robot`:

```robot
${Signin_URL}    https://training-platform2.doppio-tech.com/signin
${Home_URL}      https://training-platform2.doppio-tech.com/
${EMAIL}         your-email@example.com
${PASSWORD}      your-password
```

### WebDriver Configuration:
```robot
${EDGE_DRIVER}    C:/WebDrivers/Edge/msedgedriver.exe
```

## 🎯 ฟีเจอร์หลัก

### 1. Shadow DOM Support
- รองรับการทำงานกับ Shadow DOM elements
- ใช้ JavaScript execution สำหรับเข้าถึง shadow elements

### 2. Dynamic Element Handling
- รอให้ elements ปรากฏก่อนดำเนินการ
- ใช้ multiple selector strategies สำหรับความเสถียร

### 3. Cart Management
- เพิ่ม/ลบสินค้าจากตะกร้า
- ตรวจสอบราคารวม
- รองรับการใช้งานคูปอง

### 4. Screenshot Capture
- บันทึกภาพหน้าจอเมื่อเกิดข้อผิดพลาด
- เก็บภาพในโฟลเดอร์ `results/`

## 📊 ผลลัพธ์การทดสอบ

หลังจากการทดสอบจะได้ไฟล์ผลลัพธ์:
- `log.html` - รายละเอียดการทดสอบ
- `report.html` - สรุปผลการทดสอบ
- `output.xml` - ผลลัพธ์ในรูปแบบ XML
- `selenium-screenshot-*.png` - ภาพหน้าจอเมื่อเกิดข้อผิดพลาด

## 🔍 การ Debug

### ดู Log ระหว่างการทดสอบ:
```bash
robot --loglevel DEBUG TestCase.robot
```

### รันการทดสอบแบบ Interactive:
```bash
robot --dryrun TestCase.robot
```

## 📋 Prerequisites

- Python 3.7+
- Microsoft Edge Browser
- Edge WebDriver
- Internet Connection

## 🤝 การมีส่วนร่วม

1. Fork โปรเจค
2. สร้าง feature branch (`git checkout -b feature/AmazingFeature`)
3. Commit การเปลี่ยนแปลง (`git commit -m 'Add some AmazingFeature'`)
4. Push ไปยัง branch (`git push origin feature/AmazingFeature`)
5. เปิด Pull Request

## 📄 License

โปรเจคนี้เป็นส่วนหนึ่งของการทดสอบเทคนิค (Technical Test)

## 📞 ติดต่อ

หากมีคำถามหรือข้อสงสัย กรุณาติดต่อทีมพัฒนา

---

**หมายเหตุ**: โปรเจคนี้ใช้สำหรับการทดสอบระบบ E-commerce และเป็นส่วนหนึ่งของการประเมินเทคนิค
