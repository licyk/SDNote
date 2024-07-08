#!/bin/bash

if ! python3 -V &> /dev/null ;then
    echo "未找到 Python，终止运行"
    read -p "按 Enter 键继续..."
    exit 1
fi

if ! python3 -m pip -V &> /dev/null ;then
    echo "未找到 Python Pip 模块，终止运行"
    read -p "按 Enter 键继续..."
    exit 1
fi

if ! python3 -c "import venv" &> /dev/null ;then
    echo "未找到 Python venv 模块，终止运行"
    read -p "按 Enter 键继续..."
    exit 1
fi

if [ ! -f "./venv/bin/activate" ];then
    echo "未找到虚拟环境"
    echo "创建虚拟环境中..."
    python3 -m venv venv
fi

source ./venv/bin/activate

if ! which mkdocs &> /dev/null ;then
    echo "安装 MKDocs 中..."
    python3 -m pip install -r requirements.txt --index-url https://mirror.baidu.com/pypi/simple
    if [ ! $? = 0 ];then
        echo "安装 MKDocs 失败，终止运行"
        read -p "按 Enter 键继续..."
        exit 1
    fi
fi

case $@ in
    --update)
        echo "更新 MKDocs 中..."
        python3 -m pip install -r requirements.txt --upgrade --index-url https://mirror.baidu.com/pypi/simple
        if [ ! $? = 0 ];then
            echo "更新 MKDocs 失败"
        fi
        ;;
esac

echo "启动 MKDocs 中..."
mkdocs serve

read -p "按 Enter 键继续..."