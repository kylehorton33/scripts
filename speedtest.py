from requests import get
import os
import json
import datetime

ip_data = get('https://ipleak.net/json/').json()
speed_data = json.loads(os.popen('speedtest-cli --json').read())

data = f"\
    {datetime.datetime.now().strftime('%Y-%m-%d %H:%M')},\
    {str(round(speed_data['download']/1000000, 2))},\
    {str(round(speed_data['upload']/1000000, 2))},\
    {str(round(speed_data['ping'], 2))},\
    {ip_data['city_name']},\
    {ip_data['ip']},\
    {speed_data['client']['isp']}\n"

with open(r'/home/kingsley/speed_history.csv', 'a') as f:
    f.write(data)

f.close()