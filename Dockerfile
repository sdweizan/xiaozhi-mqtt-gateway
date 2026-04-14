# 使用官方 Node.js 18 LTS 镜像（基于 Debian 精简版）
FROM node:18-slim

# 设置工作目录
WORKDIR /app

# 复制当前文件夹下的所有文件到工作目录
COPY . .

# 全局安装 PM2
RUN npm install --registry=https://mirrors.cloud.tencent.com/npm/
RUN npm install --registry=https://mirrors.cloud.tencent.com/npm/ -g pm2

# 创建日志目录
RUN mkdir -p /app/logs

# 暴露 MQTT、UDP 和管理 API 端口
EXPOSE 1883 8884/udp 8007

# 数据卷挂载点
VOLUME ["/app/logs"]

# 启动命令
CMD ["pm2-runtime", "start", "ecosystem.config.js"]
