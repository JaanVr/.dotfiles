import subprocess, re

output = ""
output = subprocess.check_output(["amixer", "get", "Master"])
volume_line = output.splitlines()[4]
volume = re.findall("\[(.*?)\]", str(volume_line))
if (volume[2]=="off"):
    print("")
else:
    print(volume[0])
