# 使用官方的 Python 基礎映像
FROM python:3.11-slim

# 設定工作目錄
WORKDIR /app

# 安裝系統依賴項
RUN apt-get update && apt-get install -y \
    build-essential \
    libpq-dev \
    && rm -rf /var/lib/apt/lists/*

# 安裝 Python 依賴項
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# 複製 Django 項目文件
COPY . .

# 暴露端口
EXPOSE 8000

# 運行 Django 開發伺服器
CMD ["python", "manage.py", "runserver", "0.0.0.0:8000"]
