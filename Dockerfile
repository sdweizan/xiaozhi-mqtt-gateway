# 使用官方 Node.js 18 LTS 镜像（基于 Debian 精简版）
FROM node:18-slim

# 设置工作目录
WORKDIR /app

# 克隆 MQTT 网关仓库
RUN git clone https://github.com/sdweizan/xiaozhi-mqtt-gateway.git .

# 安装 Node.js 依赖
RUN npm install --production
RUN npm install -g pm2

# 创建日志目录
RUN mkdir -p /app/logs

# 暴露 MQTT、UDP 和管理 API 端口
EXPOSE 1883 8884/udp 8007

# 数据卷挂载点
VOLUME ["/app/logs"]

# 启动命令
CMD ["pm2", "start", "ecosystem.config.js"]