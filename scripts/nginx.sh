echo "Task 1: Perform YUM update"
yum -y update

echo "Task 2: Add epel-release"
yum -y install epel-release

echo "Task 3: Install nginx"
yum -y install nginx > /dev/null 2>&1

echo "Taks 4: Modify index.html test page"
sudo cp /home/vagrant/index.html /usr/share/nginx/html/index.html

echo "Task 5: Enable NGINX"
sudo systemctl enable nginx

echo "Task 6: Start NGINX"
sudo systemctl start nginx

echo "Task 7 Update /etc/hosts file"
cat >>/etc/hosts<<EOF
192.168.200.201 ha-loadbalancer
192.168.200.210 nginx-server-1
192.168.200.211 nginx-server-2
EOF

