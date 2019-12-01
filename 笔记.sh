
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


















































































