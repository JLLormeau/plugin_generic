from time import sleep
import os

directory = '/opt/dynatrace/oneagent/scripts/testcountfiles'
i = 1
while i < 100:
  print(i)
  sleep(20)
  with open(directory+'/file_'+str(i)+'.txt', 'w') as f:
      f.write("Content")
      f.close() 
  i += 1
  if i == 100:
    for j in range (1,100):
       filename = directory+'/file_'+str(j)+'.txt'
       if os.path.exists(filename):
          os.remove(filename)
       else:
          print("The file "+filename+"does not exist")    
    i = 1
  
