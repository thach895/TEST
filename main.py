class Product:
    def __init__(self,id,name,import_price,quantity,storage_fee):
        self.id=id
        self.name=name
        self.import_price=import_price
        self.quantity=quantity
        self.storage_fee=storage_fee
        self.total_value=0
        self.stock_status=""

        self.calculate_total_value()
        self.classify_stock_status()

    def calculate_total_value(self):
        self.total_value=(self.import_price*self.quantity)+self.storage_fee

    def classify_stock_status(self):
        if self.total_value>=30000000:
            self.stock_status="Rất cao (Rủi ro ứ đọng vốn)"
        elif self.total_value>=15000000:
            self.stock_status="Cao (Cần chú ý)"
        elif self.total_value>=9000000:
            self.stock_status="Trung bình"
        else:
            self.stock_status="Thấp (An toàn)"

class ProductManager:
    def __init__(self):
        self.products = []

    def find_by_id(self,id_product):
        for product in self.products:
            if id_product==product.id:
                return product
        return None
    def input_quantity(self,message):
        try:
            quantity=int(input("message"))

            if quantity <0 and quantity >1000:
                print("Số lượng không < 0 và > 1000 ")
            return quantity
        except:
            print("Vui lòng nhập số")
        
    def add_product(self):
        product_id=input("Nhập mã sản phẩm:")

        if not product_id:
            print("Mã không được để trống")
            return
        if self.find_by_id(product_id):
            print("Mã đã tồn tại")
            return
        
        product_name=input("Nhập tên sản phẩm:")

        if not product_name:
            print("Tên sản phẩm không được để trống")
            return
        
        product_price=int(input("Nhập giá sản phẩm:"))

        if product_price<0:
            print("Giá phải lớn hơn 0")
            return
        
        product_storage_fee=int(input("Nhập giá nhập kho:"))

        if product_storage_fee<0:
            print("Giá phải lớn hơn 0")
            return
        
        product_quantity=self.input_quantity("Nhập số lượng sản phẩm:")

        product =Product(
            product_id,
            product_name,
            product_price,
            product_quantity,
            product_storage_fee
        )

        self.products.append(product)

        print("Thêm hàng thành công")

    def show_product(self):
        print(f"{'Mã SP:<10'}"
              f"{'Tên SP:<20'}"
              f"{'Giá nhập:<15'}"
              f"{'Số lượng:<15'}"
              f"{'Chi phí kho:<20'}"
              f"{'Tổng giá trị:<15'}"
              f"{'Trạng thái tồn:<20'}"
              )
        for product in self.products:
            print(f"{product.id:<10}"
              f"{product.name:<20}"
              f"{product.import_price:<15}"
              f"{product.quantity:<15}"
              f"{product.storage_fee:<20}"
              f"{product.total_value:<15}"
              f"{product.stock_status:<20}"
              )

    
def main():
    product_manager=ProductManager()
    while True:
        print("="*30+"Menu"+"="*30)
        print("1. Hiển thị danh sách sản phẩm trong kho")
        print("2. Nhập sản phẩm mới vào kho")
        print("3. Cập nhật thông tin sản phẩm")
        print("4. Xóa sản phẩm khỏi kho")
        print("5. Tìm kiếm sản phẩm theo tên")
        print("6.Thoát")
        print("="*65)

        choice=input("Nhập lựa chọn của bạn:")

        match choice:
            case "2":
                product_manager.add_product()
            case "1":
                product_manager.show_product()

main()