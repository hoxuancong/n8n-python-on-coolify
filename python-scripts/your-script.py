import requests

# Thực hiện một yêu cầu HTTP GET đến một API
response = requests.get('https://api.github.com')

# Kiểm tra mã phản hồi và in ra một số thông tin
if response.status_code == 200:
    print("Yêu cầu thành công!")
    print("Dữ liệu từ GitHub API:")
    print(response.json())  # In ra thông tin trả về dưới dạng JSON
else:
    print("Yêu cầu không thành công. Mã lỗi:", response.status_code)

# Thực hiện một phép toán cơ bản
x = 10
y = 5
result = x + y

print(f"10 + 5 = {result}")
