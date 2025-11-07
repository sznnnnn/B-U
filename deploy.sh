#!/bin/bash

# 部署脚本
# 使用方法: ./deploy.sh

echo "🚀 开始部署个人档案系统..."
echo ""

# 检查是否在正确的目录
if [ ! -d "03-设计原型" ]; then
    echo "❌ 错误: 请在项目根目录运行此脚本"
    exit 1
fi

# 进入设计原型目录
cd "03-设计原型"

echo "📁 当前目录: $(pwd)"
echo ""

# 检查文件是否存在
if [ ! -f "个人简介-Notion风格.html" ]; then
    echo "❌ 错误: 找不到 个人简介-Notion风格.html"
    exit 1
fi

if [ ! -f "个人文书生成-Notion风格.html" ]; then
    echo "❌ 错误: 找不到 个人文书生成-Notion风格.html"
    exit 1
fi

echo "✅ 文件检查通过"
echo ""

# 选择部署方式
echo "请选择部署方式:"
echo "1) 本地服务器 (Python)"
echo "2) 本地服务器 (Node.js)"
echo "3) 显示部署指南"
read -p "请输入选项 (1-3): " choice

case $choice in
    1)
        echo ""
        echo "🌐 启动 Python 本地服务器..."
        echo "访问地址: http://localhost:8000"
        echo "按 Ctrl+C 停止服务器"
        echo ""
        python3 -m http.server 8000
        ;;
    2)
        echo ""
        echo "🌐 启动 Node.js 本地服务器..."
        echo "访问地址: http://localhost:8000"
        echo "按 Ctrl+C 停止服务器"
        echo ""
        if command -v npx &> /dev/null; then
            npx http-server . -p 8000
        else
            echo "❌ 错误: 未安装 Node.js，请先安装 Node.js"
            exit 1
        fi
        ;;
    3)
        echo ""
        echo "📖 部署指南:"
        echo ""
        echo "GitHub Pages:"
        echo "  1. 创建 GitHub 仓库"
        echo "  2. 上传文件到仓库"
        echo "  3. 在 Settings > Pages 中启用 GitHub Pages"
        echo ""
        echo "Netlify:"
        echo "  1. 访问 https://www.netlify.com/"
        echo "  2. 拖拽 03-设计原型 文件夹到部署区域"
        echo ""
        echo "Vercel:"
        echo "  1. 安装: npm install -g vercel"
        echo "  2. 运行: vercel"
        echo ""
        ;;
    *)
        echo "❌ 无效选项"
        exit 1
        ;;
esac

