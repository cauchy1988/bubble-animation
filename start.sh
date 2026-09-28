#!/bin/bash
PORT=${1:-8080}
LAN_IP=$(ipconfig getifaddr en0 2>/dev/null || ipconfig getifaddr en1 2>/dev/null || echo "127.0.0.1")
TAILSCALE_IP=$(tailscale ip -4 2>/dev/null || echo "未连接")

echo "=========================================================="
echo "🫧 Bubble 动态演示与同步说明服务器启动中..."
echo "----------------------------------------------------------"
echo "🌐 本地访问:    http://127.0.0.1:${PORT}"
echo "📱 局域网访问:  http://${LAN_IP}:${PORT}"
echo "🔒 Tailscale:   http://${TAILSCALE_IP}:${PORT}"
echo "=========================================================="
echo "按 Ctrl+C 可停止服务器"
echo ""

cd "$(dirname "$0")" && exec python3 -m http.server "$PORT" --bind 0.0.0.0
