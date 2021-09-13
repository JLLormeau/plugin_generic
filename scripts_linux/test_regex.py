import subprocess
import re


def run_cmd(cmd, shell=None):
    if shell:
        full_cmd = f"{shell} {cmd}"
    else:
        full_cmd = cmd
    print('cmd = '+cmd)
    result = subprocess.run(full_cmd, stdout=subprocess.PIPE, shell=True, stderr=subprocess.PIPE) 
    print(result)
    if result.returncode != 0:
        return result.returncode, result.stderr.decode()
    else:
        return result.returncode, result.stdout.decode()

cmd = '/opt/dynatrace/oneagent/scripts/demo_metric.ksh'

result, message = run_cmd(cmd, None)
print(message)
#message = "Active: active (running) since mar. 2021-07-20 10:01:44 CEST; 7h ago"
captured_values_dict = {}
if (result == 0):
    re_result = re.search("Application: (.*?), Server: (.*?), Status: Critical, ErrorCode: (.+)", message)
    if re_result:
        print(re_result.groups())
        for group in re_result.groups():
            print(group)
    else:
        print("No regex match")
else:
    print("Execution failed : "+message)
