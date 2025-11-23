!!!! SETUP NFS
/
với máy khách làm theo trong mục BIGDATA/ForOtherNFS
/
với máy chính chạy BIGDATA/set_up_NFS.py
và làm theo BIGDATA/NFS.md

!!!YÊU CẦu

đầu tiên setup đảm bào tạo môi trường ảo trước .venv (BIGDATA/.venv) để tránh xung đột file

đảm bảo các file trong mục Datapack được up lên HDFS:

upload các folder Delivery, PickUp, Roadmap, Inventory lên HDFS bằng file BIGDATA/upload_to_hdfs.py

chạy hadoop

start-dfs.sh
start-yarn.sh


!!!!!Sau đó làm theo các mục dưới đây

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


2. Inventory Management 

- đảm bảo mục BIGDATA/upload_to_hdfs.py đã được chạy theo bước trên, thì vào việc

-  vào file BIGDATA/Inventory-Management

- chạy BIGDATA/Inventory-Management/check-file.ipynb để đảm bảo data sẵn sảng sử dụng 

- sau đó chạy file BIGDATA/Inventory-Management/Inventory-Management.ipynb cho việc import, chạy mô hình,
trực quan hóa và kết quả được export trong mục BIGDATA/Inventory-Management/result

- cuối cùng là viết báo cáo

3. OPTIONAL
- có thẻ chạy file Inventory-Management-For-Quickresult.ipynb cho mô hình DL quản lý tồn kho, kết quả nằm ở BIGDATA/ML-result-for-inventory-management
- Có thể chạy file OPTIMIZE-FOR-SHIPPER.ipynb để thử chạy mô hình DL cho tối ưu tuyến giao hàng, kết quả nằm ở
BIGDATA/quick-result


DATA

File báo cáo nằm trong mục BAOCAO.txt

- Optimize delivery routes
https://huggingface.co/datasets/Cainiao-AI/LaDe

- Inventory management  
https://data.mendeley.com/datasets/mgzvngzng2/1

Technologies
HDFS for storage 
ML
NFS
OR TOOLS
Jupyter
Hadoop
Python
and more...

Cách chạy WEB cho LINUX


##  Quick Start 

Make scripts executable
```bash
chmod +x /home/sirin/BIGDATA/file-display-app/setup.sh (thay bằng đường dẫn trong máy)
chmod +x /home/sirin/BIGDATA/file-display-app/install.sh (thay bằng đường dẫn trong máy)

```

Run setup
```bash
/home/sirin/BIGDATA/file-display-app/setup.sh (thay bằng đường dẫn trong máy)

```

3 Start application
```bash
cd /home/sirin/BIGDATA/file-display-app (thay bằng đường dẫn trong máy)
npm run dev
```

Then open: **http://localhost:3000**

---

Với windows
vào thư mục BIGDATA/file-display-app-windows và làm theo quickstart.md


thư mục BIGDATA/archives là sau khi đóng gói kết quả đạt được qua chạy file 
BIGDATA/archive_results.py
và thư mục archives được lưu và setup NFS từ máy của nhóm trưởng, các thành viên khác có thể mount lại qua setup NFS để lấy dữ liệu qua server mạng, đây là hình thức lưu trữ kết quả thay cho Kafka