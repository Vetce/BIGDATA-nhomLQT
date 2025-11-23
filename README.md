# BTL Kỹ thuật và công nghệ dữ liệu lớn cho trí tuệ nhân tạo - nhóm 7

Thành viên nhóm:
1. Nông Phi Long
2. Chu Thanh Tùng
3. Phạm Quân

# Đề tài:

Optimize delivery routes & Inventory management (Xây dựng hệ thống tối ưu tuyến giao hàng và quản lý tồn kho)


# Cách hoạt động:

# !!!! SETUP NFS
/
với máy khác làm theo trong mục BIGDATA/ForOtherNFS
/
với máy chính chạy BIGDATA/set_up_NFS.py
và làm theo BIGDATA/NFS.md

# !!!YÊU CẦu

đầu tiên setup đảm bào tạo môi trường ảo trước .venv (BIGDATA/.venv) để tránh xung đột file

đảm bảo các file trong mục Datapack được up lên HDFS:

upload các folder Delivery, PickUp, Roadmap, Inventory lên HDFS bằng file BIGDATA/upload_to_hdfs.py

chạy hadoop

start-dfs.sh
start-yarn.sh


!!!!!Sau đó làm theo các mục dưới đây

# Optimize delivery routes

1. Optimize delivery routes ( tối ưu tuyến giao hàng)

- Tiền xử  lý, import và tổng hợp data:
+ chạy tất cả các file trong  Optimize-Delivery/post-processing 
BIGDATA/Optimize-Delivery/post-processing/combine.py
BIGDATA/Optimize-Delivery/post-processing/import-delivery.py
BIGDATA/Optimize-Delivery/post-processing/import-pickup.py
BIGDATA/Optimize-Delivery/post-processing/import-roadmap.py

+ sau đó chạy file combine để kết họp các file csv lại(dành cho việc tối ưu tổng hợp)
BIGDATA/Optimize-Delivery/src/combine.py


2. Vào folder BIGDATA/Optimize-Delivery

- đầu tiên chạy BIGDATA/Optimize-Delivery/optimize/check-file.ipynb để đảm bảo rằng file có thể sử dụng được

- lần lượt chạy các file ipynb sau
BIGDATA/Optimize-Delivery/optimize/ETA-predict.ipynb
BIGDATA/Optimize-Delivery/optimize/Routes-predict.ipynb
BIGDATA/Optimize-Delivery/optimize/Optimize-Delivery-Routes.ipynb
BIGDATA/Optimize-Delivery/optimize/STG-forecasting.ipynb

- sau đó xem kết quả và đánh giá ở 
BIGDATA/Optimize-Delivery/optimize/result

#  Inventory Management 

2. Inventory Management  (quản lý tồn kho)

- đảm bảo mục BIGDATA/upload_to_hdfs.py đã được chạy theo bước trên, thì vào việc

-  vào file BIGDATA/Inventory-Management

- chạy BIGDATA/Inventory-Management/check-file.ipynb để đảm bảo data sẵn sảng sử dụng 

- sau đó chạy file BIGDATA/Inventory-Management/Inventory-Management.ipynb cho việc import, chạy mô hình,
trực quan hóa và kết quả được export trong mục BIGDATA/Inventory-Management/result


# OPTIONAL
- có thẻ chạy file Inventory-Management-For-Quickresult.ipynb cho mô hình ML quản lý tồn kho, kết quả nằm ở BIGDATA/ML-result-for-inventory-management
- Có thể chạy file OPTIMIZE-FOR-SHIPPER.ipynb để  chạy mô hình DL cho tối ưu tuyến giao hàng, kết quả nằm ở
BIGDATA/quick-result


# File báo cáo bao gồm
báo cáo.pdf
BAOCAO.txt

# DATA

- Optimize delivery routes
https://huggingface.co/datasets/Cainiao-AI/LaDe

- Inventory management  
https://data.mendeley.com/datasets/mgzvngzng2/1

# Technologies
HDFS for storage 
ML
NFS
OR TOOLS
Jupyter
Hadoop
Python
and more...



# Cách chạy WEB cho LINUX
vào mục BIGDATA/file-display-app làm theo quick start

# Cách chạy WEB cho Windows
vào thư mục BIGDATA/file-display-app-windows và làm theo quickstart.md

# NFS
thư mục BIGDATA/archives là sau khi đóng gói kết quả đạt được qua chạy file 
BIGDATA/archive_results.py
và thư mục archives được lưu và setup NFS từ máy của nhóm trưởng, các thành viên khác có thể mount lại qua setup NFS để lấy dữ liệu qua server mạng, đây là hình thức lưu trữ kết quả thay cho Kafka
