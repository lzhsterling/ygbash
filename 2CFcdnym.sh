#!/bin/bash
export LANG=en_US.UTF-8
cdn_domains=(
"time.cloudflare.com"
"shopify.com"
"time.is"
"icook.hk"
"icook.tw"
"ip.sb"
"japan.com"
"malaysia.com"
"russia.com"
"singapore.com"
"skk.moe"
"www.visa.com"
"www.visa.com.sg"
"www.visa.com.hk"
"www.visa.com.tw"
"www.visa.co.jp"
"www.visakorea.com"
"www.gco.gov.qa"
"www.gov.se"
"www.gov.ua"
"www.digitalocean.com"
"www.csgo.com"
"www.shopify.com"
"www.whoer.net"
"www.whatismyip.com"
"www.ipget.net"
"www.hugedomains.com"
"www.udacity.com"
"www.4chan.org"
"www.okcupid.com"
"www.glassdoor.com"
"www.udemy.com"
"www.baipiao.eu.org"
"cdn.anycast.eu.org"
"edgetunnel.anycast.eu.org"
"alejandracaiccedo.com"
"log.bpminecraft.com"
"www.boba88slot.com"
"gur.gov.ua"
"www.zsu.gov.ua"
"www.iakeys.com"
"edtunnel-dgp.pages.dev"
"fbi.gov"
"download.yunzhongzhuan.com"
"whatismyipaddress.com"
"www.ipaddress.my"
"www.pcmag.com"
"www.ipchicken.com"
"www.iplocation.net"
"iplocation.io"
"www.who.int"
"www.wto.org"
)

echo "------------------------------------------------------"
echo "甬哥Github项目 ：github.com/yonggekkk"
echo "甬哥Blogger博客 ：ygkkk.blogspot.com"
echo "甬哥YouTube频道 ：www.youtube.com/@ygkkk"
echo "------------------------------------------------------"
echo "请在非代理的本地网络环境下运行"
echo "------------------------------------------------------"
echo "24.1.18更新：目前已收录52个CF-CDN域名（不定期更新域名列表）"
echo "------------------------------------------------------"
echo ""
sleep 2
echo "每个域名Ping 3次，取平均值排序……"
echo "注意：Ping值高低仅供参考，与速度无关"
echo ""
sleep 2
ping_results=()
for domain in "${cdn_domains[@]}"; do
  echo -n "正在测试 $domain 的ping值……"
  ping_result=$(ping -c 3 -q "$domain" 2>/dev/null | awk -F'/' 'END {print $5}')
  if [ -n "$ping_result" ]; then
    echo " $ping_result ms"
    ping_results+=("$ping_result:$domain")
  else
    echo " 该域名ping失败"
  fi
done
sorted_results=$(echo "${ping_results[@]}" | tr ' ' '\n' | sort -t ':' -k1n -k2)
echo "$sorted_results" | while IFS=":" read -r ping_value domain; do
  if [[ "$domain" != "该域名ping失败" ]]; then
    printf "%s ms：%s\n" "$ping_value" "$domain"
  fi
done | sort -k1n > CDNym.txt
echo ""
echo "排序结果已保存到主目录文件：CDNym.txt，内容如下，选择延迟低的域名替换客户端地址"
echo "------------------------"
cat CDNym.txt
echo ""
echo "甬哥提示：如果你的网络支持IPV6，可使用懒人专用不死自选IP：2606:4700:: 填到客户端地址即可"
echo "------------------------"
