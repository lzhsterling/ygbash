import random, httpx, os, time, requests

def download_file(url, filename):
    response = requests.get(url)
    if response.status_code == 200:
        with open(filename, 'wb') as (file):
            file.write(response.content)
        print('文件下载成功！')
    else:
        print('文件下载失败。')
        sys.exit()


def read_keys_from_file(filename):
    with open(filename, 'r') as (file):
        keys = [line.strip() for line in file]
    return keys


download_file('https://github.com/yonggekkk/warp-yg/raw/main/ygkkkkeys.txt', 'ygkkkkeys.txt')
keys = read_keys_from_file('ygkkkkeys.txt')
for key in keys:
    time.sleep(1)
else:
    os.remove('ygkkkkeys.txt')
    gkeys = []
    os.system('cls' if os.name == 'nt' else 'clear')
    print('------------------------------------------------------')
    print('甬哥Github项目  ：github.com/yonggekkk')
    print('甬哥Blogger博客 ：ygkkk.blogspot.com')
    print('甬哥YouTube频道 ：www.youtube.com/@ygkkk')
    print('------------------------------------------------------')
    print('一键注册生成2000多万GB流量的WARP+密钥 by OTC/甬哥侃侃侃')
    print('------------------------------------------------------')
    a = 0
    while a < 1:
        a += 1
        print('<========WARP+密钥生成中========请稍等5秒========>')
        try:
            headers = {'CF-Client-Version':'a-6.11-2223', 
             'Host':'api.cloudflareclient.com', 
             'Connection':'Keep-Alive', 
             'Accept-Encoding':'gzip', 
             'User-Agent':'okhttp/3.12.1'}
            with httpx.Client(base_url='https://api.cloudflareclient.com/v0a2223',
              headers=headers,
              timeout=30.0) as (client):
                r = client.post('/reg')
                id = r.json()['id']
                license = r.json()['account']['license']
                token = r.json()['token']
                r = client.post('/reg')
                id2 = r.json()['id']
                token2 = r.json()['token']
                headers_get = {'Authorization': f"Bearer {token}"}
                headers_get2 = {'Authorization': f"Bearer {token2}"}
                headers_post = {'Content-Type':'application/json; charset=UTF-8', 
                 'Authorization':f"Bearer {token}"}
                json = {'referrer': f"{id2}"}
                client.patch(f"/reg/{id}", headers=headers_post, json=json)
                client.delete(f"/reg/{id2}", headers=headers_get2)
                while True:
                    key = random.choice(keys)
                    json = {'license': f"{key}"}
                    client.put(f"/reg/{id}/account", headers=headers_post, json=json)
                    json = {'license': f"{license}"}
                    client.put(f"/reg/{id}/account", headers=headers_post, json=json)
                    r = client.get(f"/reg/{id}/account", headers=headers_get)
                    account_type = r.json()['account_type']
                    referral_count = r.json()['referral_count']
                    license = r.json()['license']
                    if referral_count > 12000000:
                        break

                client.delete(f"/reg/{id}", headers=headers_get)
                gkeys.append(key)
                print(f"\n[ok] warp+流量：{referral_count}\n[ok] warp+密钥：{license}\n")
                print('更多WARP-wireguard相关教程更新，请关注甬哥YouTube频道: www.youtube.com/@ygkkk')
                with open('WARP+Keys.txt', 'a') as (f):
                    f.write(license + '  ' + '流量:' + str(referral_count) + 'GB')
                    f.write('\n')
                    f.close()
                time.sleep(3)
        except:
            print('\n[!] Error: Something went wrong.\n')