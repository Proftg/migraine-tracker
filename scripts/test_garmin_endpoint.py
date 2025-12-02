import garth
import os
from datetime import date

home_dir = os.path.expanduser('~')
garth_dir = os.path.join(home_dir, '.garth')
garth.resume(garth_dir)

day_str = date.today().isoformat()
print(f'Testing for {day_str}')

try:
    stats = garth.connectapi(f'/usersummary-service/usersummary/daily/{garth.client.username}', params={'calendarDate': day_str})
    print('Success!')
    print(stats)
except Exception as e:
    print(f'Error: {e}')
