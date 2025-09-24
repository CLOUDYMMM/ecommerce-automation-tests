# Robot Framework Test Automation Project

## 📋 Project Overview

This project contains automated test cases for the Doppio training platform e-commerce website. The tests focus on user authentication, product search, shopping cart functionality, and checkout processes.

## 🎯 Test Cases

### TC-0001: Add to cart and checkout cart with mug search
- **Description**: Search for 3 mugs, add to cart, verify checkout with correct pricing
- **Steps**:
  - Open signin page and authenticate
  - Search for "Mug" and select "Ceramic Mug" from suggestions
  - Select white ceramic mug
  - Add 3 mugs to cart
  - Apply coupon "General12345"
  - Verify checkout total
  - Clean up cart

### TC-0002: Add to cart and checkout cart with ceramic mug search
- **Description**: Search for ceramic mugs using search button, add to cart, verify checkout
- **Steps**:
  - Open signin page and authenticate
  - Search for "Ceramic Mug" using search button
  - Find and view ceramic mug details
  - Select white ceramic mug
  - Add 3 mugs to cart
  - Apply coupon "General12345"
  - Verify checkout total
  - Clean up cart

## 🛠️ Prerequisites

- Python 3.13.4 or higher
- Microsoft Edge browser
- Edge WebDriver (msedgedriver.exe)

## 📦 Installation

1. **Clone the repository**
   ```bash
   git clone <repository-url>
   cd robot_tests-Doppio
   ```

2. **Create virtual environment**
   ```bash
   python -m venv venv
   ```

3. **Activate virtual environment**
   ```bash
   # Windows
   venv\Scripts\activate
   
   # Linux/Mac
   source venv/bin/activate
   ```

4. **Install dependencies**
   ```bash
   pip install -r requirements.txt
   ```

5. **Download Edge WebDriver**
   - Download from: https://developer.microsoft.com/en-us/microsoft-edge/tools/webdriver/
   - Place `msedgedriver.exe` in `C:/WebDrivers/Edge/`
   - Update path in `resource/Variables.robot` if needed

## 🚀 Running Tests

### Run all test cases
```bash
robot --outputdir results TestCase.robot
```

### Run specific test case
```bash
robot --outputdir results --test "TC-0001*" TestCase.robot
```

### Run with specific browser
```bash
robot --outputdir results --variable BROWSER:chrome TestCase.robot
```

### Run with parallel execution
```bash
pabot --outputdir results TestCase.robot
```

## 📁 Project Structure

```
robot_tests-Doppio/
├── TestCase.robot              # Main test cases
├── demo.robot                  # Demo test case
├── resource/
│   ├── SignupPage.robot        # Signup page keywords
│   ├── LoginPage.robot         # Login page keywords
│   ├── ProductPage.robot       # Product page keywords
│   ├── CartPage.robot          # Cart page keywords
│   ├── Variables.robot         # Test data and locators
│   └── Keywords.robot          # Generic keywords
├── results/                    # Test execution results
│   ├── output.xml
│   ├── log.html
│   ├── report.html
│   └── geckodriver-1.log
├── screenshots/                # Test screenshots
├── requirements.txt            # Python dependencies
└── README.md                   # Project documentation

```

## 🔧 Configuration

### Test Data
Update credentials in `resource/Variables.robot`:
```robot
${EMAIL}            your-email@example.com
${PASSWORD}         your-password
${FULLNAME}         Your Full Name
${MOBILE}           0123456789
```

### WebDriver Path
Update Edge WebDriver path in `resource/Variables.robot`:
```robot
${EDGE_DRIVER}    C:/WebDrivers/Edge/msedgedriver.exe
```

### URLs
Test URLs are configured in `resource/Variables.robot`:
- Home: `https://training-platform2.doppio-tech.com/`
- Signin: `https://training-platform2.doppio-tech.com/signin`
- Signup: `https://training-platform2.doppio-tech.com/signup`
- Cart: `https://training-platform2.doppio-tech.com/cart`

## 🎨 Key Features

### Shadow DOM Support
The project includes custom keywords to handle Shadow DOM elements:
- `Get Shadow Element`: Retrieve elements within shadow DOM
- `Get Shadow Text`: Extract text from shadow DOM elements

### Advanced Cart Management
- Add multiple items to cart
- Apply coupons and verify pricing
- Remove all items with confirmation
- Verify empty cart state

### Robust Element Handling
- Multiple locator strategies (XPath, CSS, data-testid)
- Wait strategies for dynamic content
- Error handling and retry mechanisms

## 📊 Test Results

After test execution, view results in:
- **report.html**: High-level test summary
- **log.html**: Detailed execution log with screenshots
- **output.xml**: Machine-readable results

## 🐛 Troubleshooting

### Common Issues

1. **WebDriver not found**
   - Ensure Edge WebDriver is downloaded and path is correct
   - Check file permissions

2. **Element not found**
   - Verify website structure hasn't changed
   - Check if elements are in Shadow DOM
   - Increase wait timeouts

3. **Authentication failures**
   - Verify credentials in Variables.robot
   - Check if account is active

4. **Cart operations fail**
   - Ensure items are properly added before cart operations
   - Check coupon codes are valid

### Debug Mode
Run tests with debug output:
```bash
robot --loglevel DEBUG --outputdir results TestCase.robot
```

## 📝 Dependencies

- **Robot Framework**: 7.0
- **SeleniumLibrary**: 6.2.0
- **Selenium**: 4.20.0
- **WebDriver Manager**: 4.0.2

## 🤝 Contributing

1. Fork the repository
2. Create a feature branch
3. Make your changes
4. Add tests for new functionality
5. Submit a pull request



---

**Last Updated**: September 2025  
**Robot Framework Version**: 7.3  
**Python Version**: 3.13.4
