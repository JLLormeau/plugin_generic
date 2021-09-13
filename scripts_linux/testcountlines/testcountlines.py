from time import sleep
import os

directory = '/opt/dynatrace/oneagent/scripts/testcountlines'
i = 1
while i < 100:
  print(i)
  sleep(20)
  with open(directory+'/file.txt', 'a') as f:
      f.write("Content\n")
      f.close() 
  i += 1
  if i == 100:
    with open(directory+'/file.txt', 'w') as f:
       f.write("Content\n")
       f.close()    
    i = 1
  
