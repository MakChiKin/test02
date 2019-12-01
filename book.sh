# 登出Vagrant
# 安装插件
vagrant plugin install vagrant-scp

# 把本地文件复制到Vagrant中
vagrant scp /Users/makchikin/Documents/docker-k8s-devops-master/chapter5/labs docker-node1:/home/vagrant/




# 水平扩展
docker service scale demo=5
# 发现此时 service 下的容器列表总数有5个
docker service ps demo

# 打开另外一个窗口登录 swarm-worker1/swarm-worker2
# 查看运行的容器
docker ps
# 在 swarm-worker2 下尝试强制删除某个容器
docker rm -f we62ne7a2adf

# 在swarm-manager节点上查看
docker service ls
# 发现就算关闭了某个，swarm会自动恢复节点而保持稳定

# 删除 service 
docker service rm demo




# chapter7-4 在swarm 集群里通过 service 部署 WordPress
# 登录 swarm-manager 节点机器
vagrant ssh swarm-manager
# 先创建overlayer网络，确保swarm网络下各容器能互相通信
# 创建一个 overlaye 类型的网络，名字叫demo
docker network create -d overlay demo

# 查看网络列表
docker network ls

# 通过创建 service 创建 mysql 容器
# --name mysql 设置 service 名称
# --env MYSQL_DATABASE 设置数据库名称 
# --env MYSQL_ROOT_PASSWORD 设置数据库密码
# --network 选择网络名称
# --mount type 类型选择volume
#		  source 设置volume的名称
#         destination 设置volume的保存路径
docker service create --name mysql --env MYSQL_ROOT_PASSWORD=root \
--env MYSQL_DATABASE=wordpress \
--network demo \
--mount type=volume,source=mysql-data,\
destination=/var/lib/mysql mysql 


# 查看 service 列表
docker service ls


docker stack deploy


















































































