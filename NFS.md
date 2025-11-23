

1/

echo '/home/sirin/BIGDATA/archives *(rw,sync,no_subtree_check,no_root_squash)' | sudo tee -a /etc/exports
sudo exportfs -a -v
sudo systemctl start nfs-server
sudo systemctl enable nfs-server

2/

echo '/home/sirin/BIGDATA/archives *(rw,sync,no_subtree_check,no_root_squash)' | sudo tee -a /etc/exports

3/

sudo exportfs -a -v


4/ (optional)
sudo systemctl start nfs-server
sudo systemctl enable nfs-server
sudo systemctl start rpc-statd
sudo systemctl enable rpc-statd
sudo systemctl start rpc-mountd
sudo systemctl enable rpc-mountd


5/
sudo exportfs -v
sudo systemctl status nfs-server
showmount -e localhost


6/
df -h | grep archives
ls -la /mnt/archives



7/
sudo exportfs -ra
sudo exportfs -v   # kiểm tra export

