echo "Task 1: Perform YUM update"

yum -y update

echo "Task 2: Install haproxy"

yum -y install haproxy > /dev/null 2>&1

#echo "Task 3: Set SELinux to permissive (For Lab Work Only!)"
#sudo setenforce permissive

echo "Task 4: Backup haproxy.cfg"
if [ -f /etc/haproxy/haproxy.cfg.orig ]; then
  echo "haproxy.cfg already backed up"
else
  echo "Make a copy of file"
  sudo cp -v  /etc/haproxy/haproxy.cfg /etc/haproxy/haproxy.cfg.orig
fi

echo "Task 5: Changer Permissions of haproxy.cfg"
sudo chown root:root /home/vagrant/haproxy.cfg

echo "Task 6: Move File from Home to /etc"
sudo mv /home/vagrant/haproxy.cfg /etc/haproxy/haproxy.cfg
#sudo chown root:root /etc/haproxy/haproxy.cfg

echo "Task 7: Change SELinux File Type"
sudo chcon -t etc_t /etc/haproxy/haproxy.cfg 

echo "Task 7: Start HAProxy"
sudo systemctl start haproxy
sudo systemctl enable haproxy

echo "Task 8 Update /etc/hosts file"
cat >>/etc/hosts<<EOF
192.168.200.201 ha-loadbalancer
192.168.200.210 nginx-server-1
192.168.200.211 nginx-server-2
EOF

